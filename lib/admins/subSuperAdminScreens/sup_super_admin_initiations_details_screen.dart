import 'package:flutter/material.dart';
import 'package:mct_prayer_book/admins/adminsScreens/add_initiations_screen.dart';
import 'package:mct_prayer_book/providers/get_current_user.dart';
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<SubSuperAdminInitiationsDetailsProvider>()
          .fetchParentAdminInitiations();
    });
  }

  // =========================
  //  YEAR PICKER (NO CALENDAR)
  // =========================
  Future<void> _pickYear() async {
    final currentYear = DateTime
        .now()
        .year;
    final years = List.generate(100, (i) => currentYear - 30 + i);

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
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.pop(context, year),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.dividerColor,
                            ),
                          ),
                          child: Text(
                            year.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : theme.textTheme.bodyMedium?.color,
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
  // FILTER (YEAR ONLY)
  // =========================
  List<Map<String, dynamic>> _filteredItems(List<Map<String, dynamic>> items) {
    return items.where((item) {
      final query = _searchController.text.toLowerCase();

      final matchesSearch =
          item['person'].toString().toLowerCase().contains(query) ||
              item['uniqueID'].toString().toLowerCase().contains(query) ||
              item['temple'].toString().toLowerCase().contains(query);

      final matchesTemple =
          selectedTemple == 'All' || item['temple'] == selectedTemple;

      final matchesDm =
          selectedDm == 'All' || item['dmAttended'] == selectedDm;

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
    final currentUserDetails =
    context.read<GetCurrentUserDetailsProvider>();

    return Consumer<SubSuperAdminInitiationsDetailsProvider>(
      builder: (context, provider, child) {

        final filteredItems = _filteredItems(provider.initiations);

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddInitiationsScreen(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),

          appBar: const AppbarWidget(title: 'Initiation Details'),

          body: Column(
            children: [

              /// FILTERS
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
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [

                        Expanded(
                          child: _buildDropdown(
                            value: selectedTemple,
                            items: const [
                              'All',
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
                            items: const ['All', 'Yes', 'No'],
                            onChanged: (v) =>
                                setState(() => selectedDm = v!),
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// YEAR PICKER
                        Expanded(
                          child: InkWell(
                            onTap: _pickYear,
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 16),
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: theme.dividerColor),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined,
                                      size: 18,
                                      color: theme.colorScheme.primary),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      selectedDate == null
                                          ? 'Year'
                                          : '${selectedDate!.year}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// RESET
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
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(Icons.filter_alt_off_rounded,
                                color: theme.colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// LIST
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : filteredItems.isEmpty
                    ? const Center(child: Text('No matching records found'))
                    : RefreshIndicator(
                  onRefresh: provider.fetchParentAdminInitiations,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredItems.length,
                    separatorBuilder: (_, __) =>
                    const SizedBox(height: 16),
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
                        donationFee:
                        int.tryParse(item['meritsFee'].toString()) ?? 0,
                        address: item['address'] ?? '',
                        dmAttended: item['dmAttended'] ?? '',
                        remarks: item['remarks'] ?? '',
                        role: currentUserDetails.role,
                        onDelete: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (_) =>
                                AlertDialog(
                                  title: Text(item['person'] ?? ''),
                                  content: const Text("Delete this record?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text("Delete"),
                                    ),
                                  ],
                                ),
                          );

                          if (confirm != true) return;

                          final message =
                          await provider.deleteInitiation(item['id']);

                          if (!context.mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  message ?? 'Something went wrong'),
                            ),
                          );
                        },
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

  /// DROPDOWN
  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.dividerColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}