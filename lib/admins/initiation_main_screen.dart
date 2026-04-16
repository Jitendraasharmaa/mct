import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';

import '../wigets/initiation_card_widget.dart';

class InitiationMainScreen extends StatefulWidget {
  const InitiationMainScreen({super.key});

  @override
  State<InitiationMainScreen> createState() => _InitiationMainScreenState();
}

class _InitiationMainScreenState extends State<InitiationMainScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedTemple = 'All';
  String selectedDm = 'All';

  DateTime? selectedDate;

  final List<InitiationCard> allItems = [
    InitiationCard(
      uniqueID: 'P123',
      personName: 'Jitendra Kumar Sharma',
      dmAttended: 'Yes',
      iniEnglishDate: '02-02-2026',
      iniChineseDate: '01-01-2026',
      templeName: 'Hong Ci',
    ),
    InitiationCard(
      uniqueID: 'P124',
      personName: 'Ramesh Singh',
      dmAttended: 'No',
      iniEnglishDate: '04-02-2026',
      iniChineseDate: '03-01-2026',
      templeName: 'Kuang Ji',
    ),
    InitiationCard(
      uniqueID: 'P125',
      personName: 'Amit Das',
      dmAttended: 'Yes',
      iniEnglishDate: '10-02-2026',
      iniChineseDate: '08-01-2026',
      templeName: 'Kong Thong',
    ),
  ];

  List<InitiationCard> get filteredItems {
    return allItems.where((item) {
      final query = _searchController.text.toLowerCase();

      final matchesSearch =
          item.personName.toLowerCase().contains(query) ||
          item.uniqueID.toLowerCase().contains(query) ||
          item.templeName.toLowerCase().contains(query);

      final matchesTemple =
          selectedTemple == 'All' || item.templeName == selectedTemple;

      final matchesDm = selectedDm == 'All' || item.dmAttended == selectedDm;

      bool matchesDate = true;

      if (selectedDate != null) {
        final itemDateParts = item.iniEnglishDate.split('-');

        final itemDate = DateTime(
          int.parse(itemDateParts[2]),
          int.parse(itemDateParts[1]),
          int.parse(itemDateParts[0]),
        );

        matchesDate =
            itemDate.year == selectedDate!.year &&
            itemDate.month == selectedDate!.month &&
            itemDate.day == selectedDate!.day;
      }

      return matchesSearch && matchesTemple && matchesDm && matchesDate;
    }).toList();
  }

  // List<InitiationCard> get filteredItems {
  //   return allItems.where((item) {
  //     final query = _searchController.text.toLowerCase();
  //
  //     final matchesSearch =
  //         item.personName.toLowerCase().contains(query) ||
  //         item.uniqueID.toLowerCase().contains(query) ||
  //         item.templeName.toLowerCase().contains(query);
  //
  //     final matchesTemple =
  //         selectedTemple == 'All' || item.templeName == selectedTemple;
  //
  //     final matchesDm = selectedDm == 'All' || item.dmAttended == selectedDm;
  //
  //     return matchesSearch && matchesTemple && matchesDm;
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const AppbarWidget(title: 'Initiation Details'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Search by name, ID or temple',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: theme.dividerColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedTemple,
                            isExpanded: true,
                            dropdownColor: theme.cardColor,
                            items: const [
                              DropdownMenuItem(
                                value: 'All',
                                child: Text(
                                  'Temple',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Hong Ci',
                                child: Text('Hong Ci'),
                              ),
                              DropdownMenuItem(
                                value: 'Kong Ta',
                                child: Text('Kong Ta'),
                              ),
                              DropdownMenuItem(
                                value: 'Yi En',
                                child: Text('Yi En'),
                              ),
                              DropdownMenuItem(
                                value: 'Kuang Ji',
                                child: Text('Kuang Ji'),
                              ),
                              DropdownMenuItem(
                                value: 'Kong Thong',
                                child: Text('Kong Thong'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedTemple = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedDm,
                            isExpanded: true,
                            dropdownColor: theme.cardColor,
                            items: const [
                              DropdownMenuItem(value: 'All', child: Text('DM')),
                              DropdownMenuItem(
                                value: 'Yes',
                                child: Text('Yes'),
                              ),
                              DropdownMenuItem(value: 'No', child: Text('No')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedDm = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2035),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: theme.dividerColor),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 18,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  selectedDate == null
                                      ? 'Date'
                                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: selectedDate == null
                                        ? theme.textTheme.bodyMedium?.color
                                        : theme.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() {
                          selectedTemple = 'All';
                          selectedDm = 'All';
                          selectedDate = null;
                          _searchController.clear();
                        });
                      },
                      child: Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.25),
                          ),
                        ),
                        child: Icon(
                          Icons.filter_alt_off_rounded,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(
                      'No matching records found',
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    itemCount: filteredItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];

                      return InitiationCard(
                        uniqueID: item.uniqueID,
                        personName: item.personName,
                        dmAttended: item.dmAttended,
                        iniEnglishDate: item.iniEnglishDate,
                        iniChineseDate: item.iniChineseDate,
                        templeName: item.templeName,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
