import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/subSuperAdminProvider/sub_super_admin_initiations_details_provider.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:provider/provider.dart';

import '../../wigets/initiation_card_widget.dart';

class SupSuperAdminInitiationsDetailsScreen extends StatefulWidget {
  const SupSuperAdminInitiationsDetailsScreen({super.key});

  @override
  State<SupSuperAdminInitiationsDetailsScreen> createState() =>
      _SupSuperAdminInitiationsDetailsScreenScreenState();
}

class _SupSuperAdminInitiationsDetailsScreenScreenState
    extends State<SupSuperAdminInitiationsDetailsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedTemple = 'All';
  String selectedDm = 'All';

  DateTime? selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SubSuperAdminInitiationsDetailsProvider>()
          .fetchParentAdminInitiations();
    });
  }

  List<Map<String, dynamic>> _filteredItems(List<Map<String, dynamic>> items) {
    return items.where((item) {
      final query = _searchController.text.toLowerCase();

      final matchesSearch =
          item['person'].toString().toLowerCase().contains(query) ||
          item['uniqueID'].toString().toLowerCase().contains(query) ||
          item['temple'].toString().toLowerCase().contains(query);

      final matchesTemple =
          selectedTemple == 'All' || item['temple'] == selectedTemple;

      final matchesDm = selectedDm == 'All' || item['dmAttended'] == selectedDm;

      bool matchesDate = true;

      if (selectedDate != null &&
          item['englishDate'] != null &&
          item['englishDate'].toString().isNotEmpty) {
        try {
          final parts = item['englishDate'].toString().split('/');

          final date = DateTime(
            int.parse(parts[2]),
            int.parse(parts[1]),
            int.parse(parts[0]),
          );

          matchesDate =
              date.year == selectedDate!.year &&
              date.month == selectedDate!.month &&
              date.day == selectedDate!.day;
        } catch (_) {
          matchesDate = false;
        }
      }

      return matchesSearch && matchesTemple && matchesDm && matchesDate;
    }).toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SubSuperAdminInitiationsDetailsProvider>(
      builder: (context, provider, child) {
        final filteredItems = _filteredItems(provider.initiations);
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
                                  DropdownMenuItem(
                                    value: 'Kuang Wu',
                                    child: Text('Kuang Wu'),
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
                                  DropdownMenuItem(
                                    value: 'All',
                                    child: Text('DM'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Yes',
                                    child: Text('Yes'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'No',
                                    child: Text('No'),
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
                                color: theme.colorScheme.primary.withOpacity(
                                  0.25,
                                ),
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
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : filteredItems.isEmpty
                    ? const Center(child: Text('No matching records found'))
                    : RefreshIndicator(
                        onRefresh: provider.fetchParentAdminInitiations,
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          itemCount: filteredItems.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            return InitiationCard(
                              uniqueID: item['uniqueID'] ?? '',
                              bookId: item['bookSlNo'] ?? '',
                              personName: item['person'] ?? '',
                              age: int.tryParse(item['age'].toString()) ?? 0,
                              gender: item['gender'] ?? '',
                              education: item['education'] ?? '',
                              phoneNumber:
                                  int.tryParse(item['phone'].toString()) ?? 0,
                              introducerName: item['introducer'] ?? '',
                              guarantorName: item['guarantor'] ?? '',
                              masterName: item['master'] ?? '',
                              templeName: item['temple'] ?? '',
                              iniEnglishDate: item['englishDate'] ?? '',
                              iniChineseDate: item['chineseDate'] ?? '',
                              donationFee: int.parse(item['meritsFee']),
                              address: item['address'] ?? '',
                              dmAttended: item['dmAttended'] ?? '',
                              remarks: item['remarks'] ?? '',
                              userRole: 'sub_super_admin',
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
