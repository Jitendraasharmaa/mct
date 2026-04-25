import 'package:flutter/material.dart';
import 'package:mct_prayer_book/admins/adminsScreens/add_initiations_screen.dart';
import 'package:mct_prayer_book/admins/adminsScreens/admin_profile_screen.dart';
import 'package:mct_prayer_book/admins/subSuperAdminScreens/sub_sper_admin_screen.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/initiation_card_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/admin_providers/admin_initiation_details_provider.dart';
import '../../providers/export_initiations_provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String appVersion = '';

  final TextEditingController _searchController = TextEditingController();

  String selectedTemple = 'Temple';
  String selectedDm = 'DM';
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _loadAppVersion();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminInitiationDetailsProvider>().fetchInitiationsDetails();
    });
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    if (mounted) {
      setState(() {
        appVersion = packageInfo.version;
      });
    }
  }

  // =========================
  // ✅ YEAR PICKER
  // =========================
  Future<void> _pickYear() async {
    final currentYear = DateTime.now().year;
    final years = List.generate(30, (i) => currentYear - 15 + i);

    final pickedYear = await showDialog<int>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 320,
            child: Column(
              children: [
                Text("Select Year", style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    itemCount: years.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      final year = years[index];
                      final isSelected = selectedDate?.year == year;

                      return InkWell(
                        onTap: () => Navigator.pop(context, year),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.cardColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            year.toString(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : null,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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

    if (pickedYear != null) {
      setState(() {
        selectedDate = DateTime(pickedYear);
      });
    }
  }

  // =========================
  // ✅ FILTER (YEAR ONLY)
  // =========================
  List<Map<String, dynamic>> _filteredItems(List<Map<String, dynamic>> items) {
    return items.where((item) {
      final query = _searchController.text.toLowerCase();

      final matchesSearch =
          item['person'].toString().toLowerCase().contains(query) ||
          item['uniqueID'].toString().toLowerCase().contains(query) ||
          item['temple'].toString().toLowerCase().contains(query);

      final matchesTemple =
          selectedTemple == 'Temple' || item['temple'] == selectedTemple;

      final matchesDm = selectedDm == 'DM' || item['dmAttended'] == selectedDm;

      bool matchesDate = true;

      if (selectedDate != null &&
          item['englishDate'] != null &&
          item['englishDate'].toString().isNotEmpty) {
        try {
          final parts = item['englishDate'].toString().split('/');
          final year = int.parse(parts[2]);

          matchesDate = year == selectedDate!.year;
        } catch (_) {
          matchesDate = false;
        }
      }

      return matchesSearch && matchesTemple && matchesDm && matchesDate;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<AdminInitiationDetailsProvider>(
      builder: (context, provider, child) {
        final filteredItems = _filteredItems(provider.initiations);

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          drawer: buildAppDrawer(context, appVersion),

          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddInitiationsScreen()),
              );
              if (!mounted) return;
              context
                  .read<AdminInitiationDetailsProvider>()
                  .fetchInitiationsDetails();
            },
            child: Text(
              provider.initiations.length.toString(),
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.tertiary,
              ),
            ),
          ),

          appBar: AppbarWidget(
            title: 'Initiation Details',
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminProfileScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
              ),
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: (_) => setState(() {}),
                              decoration: InputDecoration(
                                hintText: 'Search...',
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
                            child: _buildDropdown(
                              value: selectedTemple,
                              items: const [
                                'Temple',
                                'Hong Ci',
                                'Kong Ta',
                                'Yi En',
                                'Kuang Ji',
                                'Kong Thong',
                                'Kuang Wu',
                              ],
                              onChanged: (v) =>
                                  setState(() => selectedTemple = v!),
                            ),
                          ),
                          const SizedBox(width: 8),

                          Expanded(
                            child: _buildDropdown(
                              value: selectedDm,
                              items: const ['DM', 'Yes', 'No'],
                              onChanged: (v) => setState(() => selectedDm = v!),
                            ),
                          ),
                          const SizedBox(width: 8),

                          /// YEAR PICKER UI
                          Expanded(
                            child: InkWell(
                              onTap: _pickYear,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  selectedDate == null
                                      ? 'Year'
                                      : '${selectedDate!.year}',
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
                  child: provider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : filteredItems.isEmpty
                      ? const Center(child: Text('No records'))
                      : ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];

                            return InitiationCard(
                              documentId: item['id'],
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

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return DropdownButton<String>(
      value: value,
      isExpanded: true,
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
