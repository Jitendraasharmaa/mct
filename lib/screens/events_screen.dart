import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../wigets/appBar_widget.dart';
import '../wigets/loading_cards_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Events"),
      body: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.ref('allevents').onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.border),
              ),
              child: const LoadingCard(),
            );
          }
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(child: Text('No event data found'));
          }
          final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
          // Traverse: allevents -> year -> month -> jan -> e1,e2...
          List<Map<String, dynamic>> events = [];

          data.forEach((yearKey, yearValue) {
            if (yearValue is Map) {
              yearValue.forEach((monthKey, monthValue) {
                if (monthValue is Map) {
                  monthValue.forEach((subMonthKey, subMonthValue) {
                    if (subMonthValue is Map) {
                      subMonthValue.forEach((eventKey, eventValue) {
                        if (eventValue is Map) {
                          events.add(Map<String, dynamic>.from(eventValue));
                        }
                      });
                    }
                  });
                }
              });
            }
          });
          if (events.isEmpty) {
            return const Center(child: Text('No events available'));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: events.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final event = events[index];

                final date = event['date']?.toString() ?? '';
                final splitDate = date.split('-');

                final day = splitDate.isNotEmpty ? splitDate[0] : '--';
                final month = splitDate.length > 1 ? splitDate[1] : '--';

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              day,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              month,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['eventName']?.toString() ?? '',
                              style: const TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${event['templeName'] ?? ''} · ${event['time'] ?? ''}',
                              style: const TextStyle(
                                color: AppColors.secondaryText,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
