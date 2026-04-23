import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/superAdminProviders/get_annual_events_provider.dart';

enum EventFilter { all, upcoming, past }

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  EventFilter selectedFilter = EventFilter.all;
  String searchQuery = "";
  bool isNewestFirst = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<GetAnnualEventsProvider>(
        context,
        listen: false,
      ).fetchAllEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Annual Events"),
        actions: [
          IconButton(
            icon: Icon(
              isNewestFirst ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            onPressed: () {
              setState(() {
                isNewestFirst = !isNewestFirst;
              });
            },
          ),
        ],
      ),
      body: Consumer<GetAnnualEventsProvider>(
        builder: (context, provider, child) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          if (provider.listEvents.isEmpty) {
            return const Center(child: Text("No events found"));
          }

          // 🔍 FILTER + SEARCH
          List<Map<String, dynamic>> filteredEvents = provider.listEvents.where(
            (event) {
              final Timestamp ts = event['dateTime'];
              final DateTime eventDate = ts.toDate();
              final now = DateTime.now();

              final matchesSearch = event['eventname']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery);

              final matchesFilter = () {
                switch (selectedFilter) {
                  case EventFilter.upcoming:
                    return eventDate.isAfter(now);
                  case EventFilter.past:
                    return eventDate.isBefore(now);
                  case EventFilter.all:
                  default:
                    return true;
                }
              }();

              return matchesSearch && matchesFilter;
            },
          ).toList();

          // 🔄 SORT
          filteredEvents.sort((a, b) {
            final aDate = (a['dateTime'] as Timestamp).toDate();
            final bDate = (b['dateTime'] as Timestamp).toDate();

            return isNewestFirst
                ? bDate.compareTo(aDate)
                : aDate.compareTo(bDate);
          });

          return Column(
            children: [
              // 🔍 SEARCH BAR
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search events...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
                ),
              ),

              // 🎯 MODERN FILTER BAR
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    // Background
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),

                    // Animated selector
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      alignment: _getAlignment(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade800,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    // Segments
                    Row(
                      children: [
                        _buildSegment("All", EventFilter.all),
                        _buildSegment("Upcoming", EventFilter.upcoming),
                        _buildSegment("Past", EventFilter.past),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 📋 LIST
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    final event = filteredEvents[index];

                    final Timestamp ts = event['dateTime'];
                    final DateTime dateTime = ts.toDate();

                    final formattedDate = DateFormat(
                      "dd-MM-yyyy",
                    ).format(dateTime);

                    final formattedTime = DateFormat(
                      "hh:mm a",
                    ).format(dateTime);

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // DATE COLUMN
                        SizedBox(
                          width: 90,
                          child: Column(
                            children: [
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  color: theme.textTheme.bodyMedium?.color,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 2,
                                height: 140,
                                color: theme.dividerColor,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 10),

                        // CARD
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                              color: theme.cardColor,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // RED STRIP
                                Container(
                                  width: 6,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade800,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      bottomLeft: Radius.circular(24),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 18,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event['eventname'] ?? '',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red.shade900,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              size: 18,
                                              color: theme
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.color,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              event['place'] ?? '',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: theme
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 18,
                                              color: theme
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.color,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              formattedTime,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: theme
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // 🎯 ALIGNMENT FOR ANIMATION
  Alignment _getAlignment() {
    switch (selectedFilter) {
      case EventFilter.all:
        return Alignment.centerLeft;
      case EventFilter.upcoming:
        return Alignment.center;
      case EventFilter.past:
        return Alignment.centerRight;
    }
  }

  Widget _buildSegment(String title, EventFilter filter) {
    final isSelected = selectedFilter == filter;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = filter;
          });
        },
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.grey.shade600,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
