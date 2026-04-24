import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mct_prayer_book/admins/superAdmin/Add_annual_events_screen.dart';
import 'package:mct_prayer_book/admins/superAdmin/edit_annual_events_screen.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/superAdminProviders/get_annual_events_provider.dart';

class AnnualEventsScreen extends StatefulWidget {
  const AnnualEventsScreen({super.key});

  @override
  State<AnnualEventsScreen> createState() => _AnnualEventsScreenState();
}

class _AnnualEventsScreenState extends State<AnnualEventsScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<GetAnnualEventsProvider>(
        context,
        listen: false,
      ).fetchAllEvents(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GetAnnualEventsProvider>(context);

    return Scaffold(
      appBar: AppbarWidget(title: "Annual Events"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddAnnualEventsScreen()),
          );
        },
        child: Icon(Icons.add),
      ),

      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.error != null
          ? Center(child: Text(provider.error!))
          : provider.listEvents.isEmpty
          ? const Center(child: Text("No Events Found"))
          : RefreshIndicator(
              onRefresh: () => provider.fetchAllEvents(),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: provider.listEvents.length,
                itemBuilder: (context, index) {
                  final event = provider.listEvents[index];

                  final DateTime date = (event['dateTime'] as Timestamp)
                      .toDate();
                  final day = date.day.toString();
                  final month = DateFormat('MMM').format(date);
                  final time = DateFormat('hh:mm a').format(date);

                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          // 📅 Date Box
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  day,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  month.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 16),

                          // 📄 Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event['eventname'] ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${event['place'] ?? ""} • $time",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),

                          // Actions
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  final provider =
                                      Provider.of<GetAnnualEventsProvider>(
                                        context,
                                        listen: false,
                                      );

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Delete Event"),
                                      content: const Text(
                                        "Are you sure you want to delete this event?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);

                                            await provider.deleteEvent(
                                              event['docId'],
                                            );

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text("Event deleted"),
                                              ),
                                            );
                                          },
                                          child: const Text("Delete"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditAnnualEventsScreen(
                                            event: provider.listEvents[index],
                                          ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
