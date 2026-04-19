import 'package:flutter/material.dart';
import 'package:mct_prayer_book/providers/admin_profile_details_provider.dart';
import 'package:mct_prayer_book/providers/sub_super_admins_details_provider.dart';
import 'package:provider/provider.dart';

import '../../wigets/Elevated_button_widget.dart';
import '../../wigets/text_button_widget.dart';
import '../superAdminScreens/create_sup_super_admin.dart';

class SubSuperAdminsDetailsScreen extends StatefulWidget {
  const SubSuperAdminsDetailsScreen({super.key});

  @override
  State<SubSuperAdminsDetailsScreen> createState() =>
      _SubSuperAdminsDetailsScreenState();
}

class _SubSuperAdminsDetailsScreenState
    extends State<SubSuperAdminsDetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminProfileDetailsProvider>().fetchAdmins();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Sub Super Admins'), elevation: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateSupSuperAdmin()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<SubSuperAdminsDetailsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.subSuperAdmins.isEmpty) {
            return Center(
              child: Text(
                'No Sub Super Admins Found',
                style: TextStyle(
                  fontSize: 16,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => provider.fetchSubSuperAdmins(),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: provider.subSuperAdmins.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: theme.dividerColor.withOpacity(0.7),
              ),
              itemBuilder: (context, index) {
                final member = provider.subSuperAdmins[index];

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: theme.colorScheme.primary
                                .withOpacity(0.12),
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: theme.colorScheme.primary,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member['username'] ?? '',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  member['email'] ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: theme.textTheme.bodyMedium?.color,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  member['role'] ?? '',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: theme.colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          PopupMenuButton<String>(
                            icon: Icon(
                              Icons.more_vert,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            onSelected: (value) async {
                              if (value == 'edit') {
                                // TODO: Navigate to edit screen
                              } else if (value == 'remove') {
                                final confirm = await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    final theme = Theme.of(context);

                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      insetPadding: const EdgeInsets.symmetric(
                                        horizontal: 28,
                                        vertical: 24,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          color: theme.cardColor,
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 72,
                                              height: 72,
                                              decoration: BoxDecoration(
                                                color: Colors.red.withOpacity(
                                                  0.12,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.delete_outline_rounded,
                                                color: Colors.red,
                                                size: 36,
                                              ),
                                            ),

                                            const SizedBox(height: 20),

                                            Text(
                                              member['username'],
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    theme.colorScheme.onSurface,
                                              ),
                                            ),

                                            const SizedBox(height: 10),

                                            Text(
                                              "Are you sure you want to delete sub super admin record? This action cannot be undone.",
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
                                                      Navigator.pop(
                                                        context,
                                                        false,
                                                      );
                                                    },
                                                    text: "Cancel",
                                                  ),
                                                ),

                                                const SizedBox(width: 12),

                                                Expanded(
                                                  child: ElevatedButtonWidget(
                                                    onTap: () {
                                                      Navigator.pop(
                                                        context,
                                                        true,
                                                      );
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

                                if (confirm == true) {
                                  await provider.deleteSubSuperAdmin(
                                    member['id'],
                                  );

                                  if (!mounted) return;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Sub Super Admin removed successfully',
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(
                                value: 'remove',
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete_outline,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Remove',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
