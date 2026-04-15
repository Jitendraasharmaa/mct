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

      return matchesSearch && matchesTemple && matchesDm;
    }).toList();
  }

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
                                child: Text('All Temples'),
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
                                child: Text('Yi En'),
                              ),
                              DropdownMenuItem(
                                value: 'Kong Thong',
                                child: Text('Kong Thong'),
                              ),
                              DropdownMenuItem(
                                value: 'Kuang Wu',
                                child: Text('Kuang Wu'),
                              ),
                              DropdownMenuItem(
                                value: 'Kong Rong',
                                child: Text('Kuang Wu'),
                              ),
                              DropdownMenuItem(
                                value: 'Kong Fong',
                                child: Text('Kong Fong'),
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
                    const SizedBox(width: 12),
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
                              DropdownMenuItem(
                                value: 'All',
                                child: Text('DM Status'),
                              ),
                              DropdownMenuItem(
                                value: 'Yes',
                                child: Text('DM Attended'),
                              ),
                              DropdownMenuItem(
                                value: 'No',
                                child: Text('DM Not Attended'),
                              ),
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
