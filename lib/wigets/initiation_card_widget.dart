import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mct_prayer_book/admins/edit_initiations_screen.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
import 'package:mct_prayer_book/providers/get_current_user.dart';
import 'package:mct_prayer_book/providers/whatsApp_provider.dart';
import 'package:provider/provider.dart';

import '../providers/call_provider.dart';
import 'divider_widget.dart';

class InitiationCard extends StatelessWidget {
  final String uniqueID;
  final String? bookId;
  final String personName;
  final int? age;
  final String? gender;
  final String? education;
  final int? phoneNumber;
  final String? introducerName;
  final String? guarantorName;
  final String? masterName;
  final String? templeName;
  final String? iniEnglishDate;
  final String? iniChineseDate;
  final int? donationFee;
  final String? address;
  final String? dmAttended;
  final String? remarks;
  final String? role;
  final String documentId;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onDeleteAsSuperAdmin;

  const InitiationCard({
    super.key,
    required this.uniqueID,
    this.bookId,
    required this.personName,
    this.age,
    this.gender,
    this.education,
    this.phoneNumber,
    this.introducerName,
    this.guarantorName,
    this.masterName,
    this.templeName,
    this.iniEnglishDate,
    this.iniChineseDate,
    this.donationFee,
    this.address,
    this.dmAttended,
    this.remarks,
    this.role,
    required this.documentId,
    this.onDelete,
    this.onDeleteAsSuperAdmin,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    // Future<void> openWhatsApp(BuildContext context, int? phoneNumber) async {
    //   if (phoneNumber == null) return;
    //
    //   final String phone = phoneNumber.toString();
    //
    //   final String message = Uri.encodeComponent(
    //     "Namaste🙏,\nI’m Maitreya Charitable Trust.",
    //   );
    //
    //   final Uri uri = Uri.parse("https://wa.me/91$phone?text=$message");
    //
    //   try {
    //     await launchUrl(uri, mode: LaunchMode.externalApplication);
    //   } catch (e) {
    //     // 👇 Show message here
    //     ScaffoldMessenger.of(
    //       context,
    //     ).showSnackBar(const SnackBar(content: Text("WhatsApp not installed")));
    //   }
    // }

    final theme = Theme.of(context);
    // final color = _statusColor(context);
    final theUserRole = Provider.of<GetCurrentUserDetailsProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.dividerColor.withOpacity(0.7)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              theme.brightness == Brightness.dark ? 0.15 : 0.05,
            ),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: theme.dividerColor),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Sl No. $bookId",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 10,
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _row(
                                  context,
                                  'Book Sl.No',
                                  bookId?.toString() ?? '-',
                                ),
                                DividerWidget(),
                                _row(context, 'Name', personName),
                                DividerWidget(),
                                _row(context, 'Age', age?.toString() ?? '-'),
                                DividerWidget(),
                                _row(
                                  context,
                                  'Gender',
                                  gender?.toString() ?? '-',
                                ),
                                DividerWidget(),
                                _row(context, 'Education', education ?? '-'),
                                DividerWidget(),
                                _row(
                                  context,
                                  'Phone',
                                  phoneNumber?.toString() ?? '-',
                                ),
                                DividerWidget(),
                                _row(
                                  context,
                                  'Introducer',
                                  introducerName ?? '-',
                                ),
                                DividerWidget(),
                                _row(
                                  context,
                                  'Guarantor',
                                  guarantorName ?? '-',
                                ),
                                DividerWidget(),
                                _row(context, 'Master', masterName ?? '-'),
                                DividerWidget(),
                                _row(context, 'Temple', templeName ?? '-'),
                                DividerWidget(),
                                _row(
                                  context,
                                  'English Date',
                                  iniEnglishDate ?? '-',
                                ),
                                DividerWidget(),
                                _row(
                                  context,
                                  'Lunar Date',
                                  iniChineseDate ?? '-',
                                ),
                                DividerWidget(),
                                _row(
                                  context,
                                  'Merits Fee',
                                  donationFee?.toString() ?? '-',
                                ),
                                DividerWidget(),
                                _row(context, 'Address', address ?? '-'),
                                DividerWidget(),
                                _row(context, 'Dm Attended', dmAttended ?? '-'),
                                DividerWidget(),
                                _row(context, 'Remarks', remarks ?? '-'),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: _topIcon(context, Icons.remove_red_eye_outlined),
              ),
              // const SizedBox(width: 12),
              // _topIcon(context, Icons.copy_outlined),
              const SizedBox(width: 12),
              if (theUserRole.role == "sub_super_admin")
                InkWell(
                  onTap: onDelete,
                  child: _topIcon(context, Icons.delete_outline),
                ),
              if (theUserRole.role == "super_admin")
                InkWell(
                  onTap: onDeleteAsSuperAdmin,
                  child: _topIcon(context, Icons.delete_outline),
                ),
              const SizedBox(width: 12),
              if (theUserRole.role == "sub_super_admin")
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditInitiationsScreen(
                          initiationData: {
                            'id': documentId,
                            'bookSlNo': bookId,
                            'person': personName,
                            'age': age?.toString() ?? '',
                            'gender': gender ?? '',
                            'education': education ?? '',
                            'phone': phoneNumber?.toString() ?? '',
                            'introducer': introducerName ?? '',
                            'guarantor': guarantorName ?? '',
                            'master': masterName ?? '',
                            'temple': templeName ?? '',
                            'englishDate': iniEnglishDate ?? '',
                            'chineseDate': iniChineseDate ?? '',
                            'meritsFee': donationFee?.toString() ?? '',
                            'address': address ?? '',
                            'dmAttended': dmAttended ?? '',
                            'remarks': remarks ?? '',
                          },
                        ),
                      ),
                    );
                  },
                  child: _topIcon(context, Icons.edit_outlined),
                ),
              if (theUserRole.role == "super_admin")
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditInitiationsScreen(
                          initiationData: {
                            'id': documentId,
                            'bookSlNo': bookId,
                            'person': personName,
                            'age': age?.toString() ?? '',
                            'gender': gender ?? '',
                            'education': education ?? '',
                            'phone': phoneNumber?.toString() ?? '',
                            'introducer': introducerName ?? '',
                            'guarantor': guarantorName ?? '',
                            'master': masterName ?? '',
                            'temple': templeName ?? '',
                            'englishDate': iniEnglishDate ?? '',
                            'chineseDate': iniChineseDate ?? '',
                            'meritsFee': donationFee?.toString() ?? '',
                            'address': address ?? '',
                            'dmAttended': dmAttended ?? '',
                            'remarks': remarks ?? '',
                          },
                        ),
                      ),
                    );
                  },
                  child: _topIcon(context, Icons.edit_outlined),
                ),
            ],
          ),
          const SizedBox(height: 16),
          _row(context, 'Name', personName),
          DividerWidget(),
          _row(context, 'Age', age.toString()),
          DividerWidget(),
          _row(context, 'Temple Name', templeName.toString()),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Provider.of<CallProvider>(
                    context,
                    listen: false,
                  ).makePhoneCall(context, phoneNumber);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.greenColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Symbols.call,
                    color: AppColors.greenColor,
                    size: 28,
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  context.read<WhatsappProvider>().openWhatsApp(
                      context, phoneNumber);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.greenColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(width: 30, "assets/images/whatsApp.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String value, {
    bool showInfo = false,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Row(
              children: [
                Text(
                  label,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: theme.textTheme.bodySmall?.color,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              overflow: TextOverflow.clip,
              value,
              style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topIcon(BuildContext context, IconData icon) {
    return Icon(
      icon,
      size: 20,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }
}
