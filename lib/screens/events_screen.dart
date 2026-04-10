import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../wigets/appBar_widget.dart';
import '../wigets/loading_cards_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final List<Color> cardColors = [
    AppColors.lightPink,
    AppColors.lightYellow,
    AppColors.lightGreen,
    AppColors.greenColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Events"),
      body: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.ref('allevents').onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.border),
              ),
              child: const LoadingCard(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: AppColors.primaryText, fontSize: 16),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(
              child: Text(
                'No event data found',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final rawData = snapshot.data!.snapshot.value;

          if (rawData is! Map) {
            return const Center(
              child: Text(
                'Invalid event data format',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final Map<dynamic, dynamic> data = rawData;

          List<Map<String, dynamic>> events = [];

          // Traverse: allevents -> year -> month -> jan -> e1,e2...
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
            return const Center(
              child: Text(
                'No events available',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: events.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final cardColor = cardColors[index % cardColors.length];
              final event = events[index];
              final date = event['date']?.toString() ?? '';
              final time = event['time']?.toString() ?? '';
              final eventName = event['eventName']?.toString() ?? '';
              final templeName = event['templeName']?.toString() ?? '';

              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 75,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          date,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSerifGeorgian(
                            color: Color(0xff808080),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1.5,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.pinkColor.withAlpha(80),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border(
                            left: BorderSide(
                              color: AppColors.primaryText,
                              width: 4,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eventName,
                                    style: GoogleFonts.notoSerifGeorgian(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                        color: Colors.grey.shade700,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          templeName,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.timer,
                                        size: 18,
                                        color: Colors.grey.shade700,
                                      ),
                                      Expanded(
                                        child: Text(
                                          time,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
