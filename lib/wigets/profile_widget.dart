import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String? uniqueID;
  final String? userName;
  final String? role;
  final String? email;
  final String? createdBy;
  final String? joined;

  const ProfileWidget({
    super.key,
    this.uniqueID,
    this.userName,
    this.role,
    this.email,
    this.createdBy,
    this.joined,
  });

  @override
  Widget build(BuildContext context) {
    Widget _infoTile({
      required BuildContext context,
      required IconData icon,
      required String title,
      Widget? trailing,
    }) {
      final theme = Theme.of(context);

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: theme.dividerColor.withOpacity(0.6)),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: theme.colorScheme.primary.withOpacity(0.85),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: theme.textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      );
    }

    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          userName.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          role.toString(),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: -48,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      border: Border.all(
                        color: theme.scaffoldBackgroundColor,
                        width: 4,
                      ),
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 52,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 70),

          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: theme.dividerColor.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  _infoTile(
                    context: context,
                    icon: Icons.badge_outlined,
                    title: 'ID: $uniqueID',
                  ),
                  _infoTile(
                    context: context,
                    icon: Icons.person_outline_rounded,

                    title: userName.toString(),
                  ),
                  _infoTile(
                    context: context,
                    icon: Icons.email_outlined,
                    title: email.toString(),
                  ),
                  _infoTile(
                    context: context,
                    icon: Icons.person_add_alt_1_outlined,
                    title: createdBy.toString(),
                  ),
                  const Spacer(),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     height: 56,
                  //     child: DecoratedBox(
                  //       decoration: BoxDecoration(
                  //         gradient: LinearGradient(
                  //           colors: [
                  //             theme.colorScheme.primary,
                  //             theme.colorScheme.secondary,
                  //           ],
                  //         ),
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       child: ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (context) =>
                  //                   AdminChangePasswordScreen(),
                  //             ),
                  //           );
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.transparent,
                  //           shadowColor: Colors.transparent,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(30),
                  //           ),
                  //         ),
                  //         child: const Text(
                  //           'Change Password',
                  //           style: TextStyle(
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w700,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
