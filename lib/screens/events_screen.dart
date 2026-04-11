import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../wigets/appBar_widget.dart';
import '../wigets/loading_cards_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final ScrollController _scrollController = ScrollController();

  String searchQuery = '';
  String selectedFilter = 'all';

  int visibleItemCount = 10;
  int filteredLength = 0;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !isLoadingMore &&
          visibleItemCount < filteredLength) {
        setState(() {
          isLoadingMore = true;
        });

        await Future.delayed(const Duration(milliseconds: 800));

        if (!mounted) return;

        setState(() {
          visibleItemCount += 10;

          if (visibleItemCount > filteredLength) {
            visibleItemCount = filteredLength;
          }

          isLoadingMore = false;
        });
      }
    });
  }

  void resetPagination() {
    visibleItemCount = 10;
    isLoadingMore = false;

    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void openFilterSheet() {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filter Events",
                style: GoogleFonts.notoSerifGeorgian(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 20),

              ListTile(
                leading: Icon(
                  Icons.sort_by_alpha_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  "All Events",
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                trailing: selectedFilter == 'all'
                    ? Icon(Icons.check, color: theme.colorScheme.primary)
                    : null,
                onTap: () {
                  setState(() {
                    selectedFilter = 'all';
                    resetPagination();
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.calendar_today_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  "Sort by Date",
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                trailing: selectedFilter == 'date'
                    ? Icon(Icons.check, color: theme.colorScheme.primary)
                    : null,
                onTap: () {
                  setState(() {
                    selectedFilter = 'date';
                    resetPagination();
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.access_time_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  "Sort by Time",
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                trailing: selectedFilter == 'time'
                    ? Icon(Icons.check, color: theme.colorScheme.primary)
                    : null,
                onTap: () {
                  setState(() {
                    selectedFilter = 'time';
                    resetPagination();
                  });
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  "Sort by Temple Name",
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                trailing: selectedFilter == 'temple'
                    ? Icon(Icons.check, color: theme.colorScheme.primary)
                    : null,
                onTap: () {
                  setState(() {
                    selectedFilter = 'temple';
                    resetPagination();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Color> cardColors = theme.brightness == Brightness.dark
        ? [
            theme.cardColor,
            theme.colorScheme.surface,
            theme.cardColor.withOpacity(0.95),
            theme.colorScheme.surface.withOpacity(0.95),
          ]
        : [theme.colorScheme.surface, theme.colorScheme.surface];

    return Scaffold(
      appBar: AppbarWidget(title: "Events"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: IconButton(
                    onPressed: openFilterSheet,
                    icon: Icon(
                      Icons.tune_rounded,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: theme.colorScheme.onSurface),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase().trim();
                        resetPagination();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search event, temple, date or time...',
                      hintStyle: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.close,
                                color: theme.textTheme.bodyMedium?.color,
                              ),
                              onPressed: () {
                                setState(() {
                                  searchQuery = '';
                                  resetPagination();
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: theme.cardColor,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: theme.dividerColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: theme.dividerColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<DatabaseEvent>(
              stream: FirebaseDatabase.instance.ref('allevents').onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: theme.dividerColor),
                    ),
                    child: const LoadingCard(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Something went wrong',
                      style: TextStyle(
                        color: theme.colorScheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData ||
                    snapshot.data?.snapshot.value == null) {
                  return Center(
                    child: Text(
                      'No event data found',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  );
                }

                final rawData = snapshot.data!.snapshot.value;

                if (rawData is! Map) {
                  return Center(
                    child: Text(
                      'Invalid event data format',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  );
                }

                final Map<dynamic, dynamic> data = rawData;
                final List<Map<String, dynamic>> events = [];

                data.forEach((yearKey, yearValue) {
                  if (yearValue is Map) {
                    yearValue.forEach((monthKey, monthValue) {
                      if (monthValue is Map) {
                        monthValue.forEach((subMonthKey, subMonthValue) {
                          if (subMonthValue is Map) {
                            subMonthValue.forEach((eventKey, eventValue) {
                              if (eventValue is Map) {
                                events.add(
                                  Map<String, dynamic>.from(eventValue),
                                );
                              }
                            });
                          }
                        });
                      }
                    });
                  }
                });

                List<Map<String, dynamic>> filteredEvents = events.where((
                  event,
                ) {
                  final eventName =
                      event['eventName']?.toString().toLowerCase() ?? '';
                  final templeName =
                      event['templeName']?.toString().toLowerCase() ?? '';
                  final date = event['date']?.toString().toLowerCase() ?? '';
                  final time = event['time']?.toString().toLowerCase() ?? '';

                  return eventName.contains(searchQuery) ||
                      templeName.contains(searchQuery) ||
                      date.contains(searchQuery) ||
                      time.contains(searchQuery);
                }).toList();

                switch (selectedFilter) {
                  case 'date':
                    filteredEvents.sort((a, b) {
                      final aDate = a['date']?.toString() ?? '';
                      final bDate = b['date']?.toString() ?? '';
                      return aDate.compareTo(bDate);
                    });
                    break;

                  case 'time':
                    filteredEvents.sort((a, b) {
                      final aTime = a['time']?.toString() ?? '';
                      final bTime = b['time']?.toString() ?? '';
                      return aTime.compareTo(bTime);
                    });
                    break;

                  case 'temple':
                    filteredEvents.sort((a, b) {
                      final aTemple = a['templeName']?.toString() ?? '';
                      final bTemple = b['templeName']?.toString() ?? '';
                      return aTemple.compareTo(bTemple);
                    });
                    break;
                }

                filteredLength = filteredEvents.length;

                if (visibleItemCount > filteredLength) {
                  visibleItemCount = filteredLength;
                }

                if (filteredEvents.isEmpty) {
                  return Center(
                    child: Text(
                      searchQuery.isEmpty
                          ? 'No events available'
                          : 'No matching events found',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  itemCount:
                      visibleItemCount +
                      (visibleItemCount < filteredLength ? 1 : 0),
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    if (index == visibleItemCount) {
                      return Visibility(
                        visible: isLoadingMore,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      );
                    }

                    final event = filteredEvents[index];
                    final cardColor = cardColors[index % cardColors.length];

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
                                  color: theme.textTheme.bodyMedium?.color,
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
                              color: theme.colorScheme.primary.withOpacity(
                                0.25,
                              ),
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
                                    color: theme.colorScheme.primary,
                                    width: 4,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.brightness == Brightness.dark
                                        ? Colors.black.withOpacity(0.20)
                                        : Colors.black.withOpacity(0.04),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eventName,
                                    style: GoogleFonts.notoSerifGeorgian(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                        color:
                                            theme.textTheme.bodyMedium?.color,
                                      ),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          templeName,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: theme
                                                .textTheme
                                                .bodyMedium
                                                ?.color,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        size: 18,
                                        color:
                                            theme.textTheme.bodyMedium?.color,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        time,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              theme.textTheme.bodyMedium?.color,
                                          fontWeight: FontWeight.w500,
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
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../constants/app_colors.dart';
// import '../wigets/appBar_widget.dart';
// import '../wigets/loading_cards_screen.dart';
//
// class EventsScreen extends StatefulWidget {
//   const EventsScreen({super.key});
//
//   @override
//   State<EventsScreen> createState() => _EventsScreenState();
// }
//
// class _EventsScreenState extends State<EventsScreen> {
//   final List<Color> cardColors = [
//     AppColors.lightPink,
//     AppColors.lightYellow,
//     AppColors.lightGreen,
//     AppColors.border,
//   ];
//
//   final ScrollController _scrollController = ScrollController();
//
//   String searchQuery = '';
//   String selectedFilter = 'all';
//
//   int visibleItemCount = 10;
//   int filteredLength = 0;
//   bool isLoadingMore = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _scrollController.addListener(() async {
//       if (_scrollController.position.pixels >=
//           _scrollController.position.maxScrollExtent - 100 &&
//           !isLoadingMore &&
//           visibleItemCount < filteredLength) {
//         setState(() {
//           isLoadingMore = true;
//         });
//
//         await Future.delayed(const Duration(milliseconds: 800));
//
//         if (!mounted) return;
//
//         setState(() {
//           visibleItemCount += 10;
//
//           if (visibleItemCount > filteredLength) {
//             visibleItemCount = filteredLength;
//           }
//
//           isLoadingMore = false;
//         });
//       }
//     });
//   }
//
//   void resetPagination() {
//     visibleItemCount = 10;
//     isLoadingMore = false;
//
//     if (_scrollController.hasClients) {
//       _scrollController.jumpTo(0);
//     }
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void openFilterSheet() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(24),
//         ),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "Filter Events",
//                 style: GoogleFonts.notoSerifGeorgian(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.primaryText,
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               ListTile(
//                 leading: const Icon(Icons.sort_by_alpha_outlined),
//                 title: const Text("All Events"),
//                 trailing: selectedFilter == 'all'
//                     ? Icon(Icons.check, color: AppColors.primaryText)
//                     : null,
//                 onTap: () {
//                   setState(() {
//                     selectedFilter = 'all';
//                     resetPagination();
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//
//               ListTile(
//                 leading: const Icon(Icons.calendar_today_outlined),
//                 title: const Text("Sort by Date"),
//                 trailing: selectedFilter == 'date'
//                     ? Icon(Icons.check, color: AppColors.primaryText)
//                     : null,
//                 onTap: () {
//                   setState(() {
//                     selectedFilter = 'date';
//                     resetPagination();
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//
//               ListTile(
//                 leading: const Icon(Icons.access_time_outlined),
//                 title: const Text("Sort by Time"),
//                 trailing: selectedFilter == 'time'
//                     ? Icon(Icons.check, color: AppColors.primaryText)
//                     : null,
//                 onTap: () {
//                   setState(() {
//                     selectedFilter = 'time';
//                     resetPagination();
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//
//               ListTile(
//                 leading: const Icon(Icons.location_on_outlined),
//                 title: const Text("Sort by Temple Name"),
//                 trailing: selectedFilter == 'temple'
//                     ? Icon(Icons.check, color: AppColors.primaryText)
//                     : null,
//                 onTap: () {
//                   setState(() {
//                     selectedFilter = 'temple';
//                     resetPagination();
//                   });
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppbarWidget(title: "Events"),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//             child: Row(
//               children: [
//                 Container(
//                   height: 56,
//                   width: 56,
//                   decoration: BoxDecoration(
//                     color: AppColors.card,
//                     borderRadius: BorderRadius.circular(18),
//                     border: Border.all(color: AppColors.border),
//                   ),
//                   child: IconButton(
//                     onPressed: openFilterSheet,
//                     icon: Icon(
//                       Icons.tune_rounded,
//                       color: AppColors.primaryText,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(width: 12),
//
//                 Expanded(
//                   child: TextField(
//                     onChanged: (value) {
//                       setState(() {
//                         searchQuery = value.toLowerCase().trim();
//                         resetPagination();
//                       });
//                     },
//                     decoration: InputDecoration(
//                       hintText: 'Search event, temple, date or time...',
//                       hintStyle: TextStyle(
//                         color: Colors.grey.shade500,
//                         fontSize: 15,
//                       ),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: Colors.grey.shade600,
//                       ),
//                       suffixIcon: searchQuery.isNotEmpty
//                           ? IconButton(
//                         icon: const Icon(Icons.close),
//                         onPressed: () {
//                           setState(() {
//                             searchQuery = '';
//                             resetPagination();
//                           });
//                         },
//                       )
//                           : null,
//                       filled: true,
//                       fillColor: AppColors.card,
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 14,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide(color: AppColors.border),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide(color: AppColors.border),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18),
//                         borderSide: BorderSide(
//                           color: AppColors.primaryText,
//                           width: 1.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Expanded(
//             child: StreamBuilder<DatabaseEvent>(
//               stream: FirebaseDatabase.instance
//                   .ref('allevents')
//                   .onValue,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Container(
//                     margin: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: AppColors.card,
//                       borderRadius: BorderRadius.circular(24),
//                       border: Border.all(color: AppColors.border),
//                     ),
//                     child: const LoadingCard(),
//                   );
//                 }
//
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Text(
//                       'Something went wrong',
//                       style: TextStyle(
//                         color: AppColors.primaryText,
//                         fontSize: 16,
//                       ),
//                     ),
//                   );
//                 }
//
//                 if (!snapshot.hasData ||
//                     snapshot.data?.snapshot.value == null) {
//                   return const Center(
//                     child: Text(
//                       'No event data found',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   );
//                 }
//
//                 final rawData = snapshot.data!.snapshot.value;
//
//                 if (rawData is! Map) {
//                   return const Center(
//                     child: Text(
//                       'Invalid event data format',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   );
//                 }
//
//                 final Map<dynamic, dynamic> data = rawData;
//                 final List<Map<String, dynamic>> events = [];
//
//                 // Traverse nested Firebase structure
//                 data.forEach((yearKey, yearValue) {
//                   if (yearValue is Map) {
//                     yearValue.forEach((monthKey, monthValue) {
//                       if (monthValue is Map) {
//                         monthValue.forEach((subMonthKey, subMonthValue) {
//                           if (subMonthValue is Map) {
//                             subMonthValue.forEach((eventKey, eventValue) {
//                               if (eventValue is Map) {
//                                 events.add(
//                                   Map<String, dynamic>.from(eventValue),
//                                 );
//                               }
//                             });
//                           }
//                         });
//                       }
//                     });
//                   }
//                 });
//
//                 // Search
//                 List<Map<String, dynamic>> filteredEvents =
//                 events.where((event) {
//                   final eventName =
//                       event['eventName']?.toString().toLowerCase() ?? '';
//                   final templeName =
//                       event['templeName']?.toString().toLowerCase() ?? '';
//                   final date =
//                       event['date']?.toString().toLowerCase() ?? '';
//                   final time =
//                       event['time']?.toString().toLowerCase() ?? '';
//
//                   return eventName.contains(searchQuery) ||
//                       templeName.contains(searchQuery) ||
//                       date.contains(searchQuery) ||
//                       time.contains(searchQuery);
//                 }).toList();
//
//                 // Sorting
//                 switch (selectedFilter) {
//                   case 'date':
//                     filteredEvents.sort((a, b) {
//                       final aDate = a['date']?.toString() ?? '';
//                       final bDate = b['date']?.toString() ?? '';
//                       return aDate.compareTo(bDate);
//                     });
//                     break;
//
//                   case 'time':
//                     filteredEvents.sort((a, b) {
//                       final aTime = a['time']?.toString() ?? '';
//                       final bTime = b['time']?.toString() ?? '';
//                       return aTime.compareTo(bTime);
//                     });
//                     break;
//
//                   case 'temple':
//                     filteredEvents.sort((a, b) {
//                       final aTemple = a['templeName']?.toString() ?? '';
//                       final bTemple = b['templeName']?.toString() ?? '';
//                       return aTemple.compareTo(bTemple);
//                     });
//                     break;
//                 }
//
//                 filteredLength = filteredEvents.length;
//
//                 if (visibleItemCount > filteredLength) {
//                   visibleItemCount = filteredLength;
//                 }
//
//                 if (filteredEvents.isEmpty) {
//                   return Center(
//                     child: Text(
//                       searchQuery.isEmpty
//                           ? 'No events available'
//                           : 'No matching events found',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey.shade700,
//                       ),
//                     ),
//                   );
//                 }
//
//                 return ListView.separated(
//                   controller: _scrollController,
//                   padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
//                   itemCount: visibleItemCount +
//                       (visibleItemCount < filteredLength ? 1 : 0),
//                   separatorBuilder: (_, __) => const SizedBox(height: 14),
//                   itemBuilder: (context, index) {
//                     // Pagination Loader
//                     if (index == visibleItemCount) {
//                       return Visibility(
//                         visible: isLoadingMore,
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 20),
//                           child: Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         ),
//                       );
//                     }
//
//                     final event = filteredEvents[index];
//                     final cardColor = cardColors[index % cardColors.length];
//
//                     final date = event['date']?.toString() ?? '';
//                     final time = event['time']?.toString() ?? '';
//                     final eventName = event['eventName']?.toString() ?? '';
//                     final templeName = event['templeName']?.toString() ?? '';
//
//                     return IntrinsicHeight(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: 75,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 16),
//                               child: Text(
//                                 date,
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.notoSerifGeorgian(
//                                   color: const Color(0xff808080),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           Container(
//                             width: 1.5,
//                             margin:
//                             const EdgeInsets.symmetric(horizontal: 10),
//                             decoration: BoxDecoration(
//                               color: AppColors.pinkColor.withAlpha(80),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//
//                           Expanded(
//                             child: Container(
//                               padding: const EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 color: cardColor,
//                                 borderRadius: BorderRadius.circular(18),
//                                 border: Border(
//                                   left: BorderSide(
//                                     color: AppColors.primaryText,
//                                     width: 4,
//                                   ),
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.04),
//                                     blurRadius: 8,
//                                     offset: const Offset(0, 3),
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     eventName,
//                                     style: GoogleFonts.notoSerifGeorgian(
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w700,
//                                       color: AppColors.greenColor,
//                                     ),
//                                   ),
//
//                                   const SizedBox(height: 10),
//
//                                   Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Icon(
//                                         Icons.location_on_outlined,
//                                         size: 18,
//                                         color: Colors.grey.shade700,
//                                       ),
//                                       const SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           templeName,
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                             color: Colors.grey.shade700,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//
//                                   const SizedBox(height: 8),
//
//                                   Row(
//                                     children: [
//                                       Icon(
//                                         Icons.timer_outlined,
//                                         size: 18,
//                                         color: Colors.grey.shade700,
//                                       ),
//                                       const SizedBox(width: 6),
//                                       Text(
//                                         time,
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                           color: Colors.grey.shade700,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
