import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_initiations_provider.dart';
import '../providers/export_initiations_provider.dart';
import '../wigets/Elevated_button_widget.dart';
import '../wigets/appBar_widget.dart';
import '../wigets/initiation_card_widget.dart';
import '../wigets/text_button_widget.dart';

class InitiationMainScreen extends StatefulWidget {
  const InitiationMainScreen({super.key});

  @override
  State<InitiationMainScreen> createState() => _InitiationMainScreenState();
}

class _InitiationMainScreenState extends State<InitiationMainScreen> {
  Future<void> _refreshScreen() async {
    await Future.delayed(Duration(seconds: 2)); // simulate network call

    setState(() {});
  }

  final TextEditingController _searchController = TextEditingController();

  String selectedTemple = 'All';
  String selectedDm = 'All';
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AllInitiationsProvider>().fetchAllInitiations();
    });
  }

  List<Map<String, dynamic>> getFilteredItems(
    List<Map<String, dynamic>> allItems,
  ) {
    return allItems.where((item) {
      final query = _searchController.text.toLowerCase();

      final personName = (item['name'] ?? '').toString().toLowerCase();
      final bookId = (item['bookSlNo'] ?? '').toString().toLowerCase();
      final temple = (item['parentAdminUsername'] ?? '')
          .toString()
          .toLowerCase();
      final dm = (item['dmAttended'] ?? '').toString();

      final matchesSearch =
          personName.contains(query) ||
          bookId.contains(query) ||
          temple.contains(query);

      final matchesTemple =
          selectedTemple == 'All' ||
          (item['parentAdminUsername'] ?? '') == selectedTemple;

      final matchesDm = selectedDm == 'All' || dm == selectedDm;

      bool matchesDate = true;

      if (selectedDate != null) {
        try {
          final dateString = (item['englishDate'] ?? '').toString();

          if (dateString.isNotEmpty) {
            final parts = dateString.split('/');

            final itemDate = DateTime(
              int.parse(parts[2]),
              int.parse(parts[1]),
              int.parse(parts[0]),
            );

            matchesDate =
                itemDate.year == selectedDate!.year &&
                itemDate.month == selectedDate!.month &&
                itemDate.day == selectedDate!.day;
          }
        } catch (_) {
          matchesDate = false;
        }
      }

      return matchesSearch && matchesTemple && matchesDm && matchesDate;
    }).toList();
  }

  // Future<void> _deleteItem(String docId) async {
  //   final provider = context.read<AllInitiationsProvider>();
  //
  //   final confirm = await showDialog<bool>(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Delete Initiation'),
  //         content: const Text(
  //           'Are you sure you want to delete this initiation?',
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context, false),
  //             child: const Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () => Navigator.pop(context, true),
  //             child: const Text('Delete', style: TextStyle(color: Colors.red)),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //
  //   if (confirm == true) {
  //     final success = await provider.deleteInitiation(docId);
  //
  //     if (!mounted) return;
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           success
  //               ? 'Initiation deleted successfully'
  //               : 'Failed to delete initiation',
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<AllInitiationsProvider>(
      builder: (context, provider, child) {
        final filteredItems = getFilteredItems(provider.initiations);

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: const AppbarWidget(title: 'Initiation Details'),
          body: RefreshIndicator(
            onRefresh: _refreshScreen,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: (_) => setState(() {}),
                              decoration: InputDecoration(
                                hintText: 'Search by name, book ID or temple',
                                prefixIcon: const Icon(Icons.search),
                                filled: true,
                                fillColor: theme.cardColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              final exportProvider = context
                                  .read<ExportInitiationsProvider>();
                              exportProvider.exportCSV(
                                context,
                                filteredItems,
                              ); // 👈 pass filtered data
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.blue.shade200),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "Export",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: theme.dividerColor),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedTemple,
                                  isExpanded: true,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'All',
                                      child: Text('Temple'),
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: theme.dividerColor),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedDm,
                                  isExpanded: true,
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
                                              ? theme
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.color
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
                                color: theme.colorScheme.primary.withOpacity(
                                  0.1,
                                ),
                                borderRadius: BorderRadius.circular(14),
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
                      : provider.error != null
                      ? Center(
                          child: Text(
                            provider.error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        )
                      : filteredItems.isEmpty
                      ? const Center(child: Text('No matching records found'))
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                          itemCount: filteredItems.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            print("The temple name is:  ${item['temple']}");
                            return Stack(
                              children: [
                                InitiationCard(
                                  documentId: item['docId'],
                                  uniqueID: item['docId'],
                                  bookId: item['bookSlNo'],
                                  personName: item['name'],
                                  age: int.tryParse(item['age'].toString()),
                                  gender: item['gender'],
                                  education: item['education'],
                                  phoneNumber: int.tryParse(
                                    item['phone'].toString(),
                                  ),
                                  introducerName: item['introducer'],
                                  guarantorName: item['guarantor'],
                                  masterName: item['master'],
                                  templeName: item['temple'],
                                  // templeName: item['parentAdminUsername'],
                                  iniEnglishDate: item['englishDate'],
                                  iniChineseDate: item['chineseDate'],
                                  donationFee: int.tryParse(
                                    item['meritsFee'].toString(),
                                  ),
                                  address: item['address'],
                                  dmAttended: item['dmAttended'],
                                  remarks: item['remarks'],
                                  onDeleteAsSuperAdmin: () async {
                                    final confirm = await showDialog<bool>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) {
                                        final theme = Theme.of(context);
                                        final personName =
                                            item['name'] ?? 'this person';

                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              24,
                                            ),
                                          ),
                                          insetPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 28,
                                                vertical: 24,
                                              ),
                                          child: Container(
                                            padding: const EdgeInsets.all(24),
                                            decoration: BoxDecoration(
                                              color: theme.cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 72,
                                                  height: 72,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red
                                                        .withOpacity(0.12),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons
                                                        .delete_outline_rounded,
                                                    color: Colors.red,
                                                    size: 36,
                                                  ),
                                                ),

                                                const SizedBox(height: 20),

                                                Text(
                                                  personName,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                    color: theme
                                                        .colorScheme
                                                        .onSurface,
                                                  ),
                                                ),

                                                const SizedBox(height: 10),

                                                Text(
                                                  "Are you sure you want to delete this initiation record? This action cannot be undone.",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    height: 1.5,
                                                    color: theme
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.color,
                                                  ),
                                                ),

                                                const SizedBox(height: 24),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextButtonWidget(
                                                        onTap: () {
                                                          Navigator.of(
                                                            context,
                                                          ).pop(false);
                                                        },
                                                        text: "Cancel",
                                                      ),
                                                    ),

                                                    const SizedBox(width: 12),

                                                    Expanded(
                                                      child:
                                                          ElevatedButtonWidget(
                                                            onTap: () {
                                                              Navigator.of(
                                                                context,
                                                              ).pop(true);
                                                            },
                                                            text: "Delete",
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    if (confirm != true) return;

                                    final bool success = await provider
                                        .deleteInitiation(item['docId']);

                                    if (!mounted) return;

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          success
                                              ? '${item['name']} deleted successfully'
                                              : 'Failed to delete initiation',
                                        ),
                                        backgroundColor: success
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
