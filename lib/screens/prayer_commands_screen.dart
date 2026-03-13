import 'package:flutter/material.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
import 'package:mct_prayer_book/constants/text_consts.dart';
import 'package:mct_prayer_book/screens/bid_festival_outing_ceremony_screen.dart';
import 'package:mct_prayer_book/screens/big_purnima_amavasya_screen.dart';
import 'package:mct_prayer_book/screens/coming_leaving_prayer.dart';
import 'package:mct_prayer_book/screens/festival_ceremony_screen.dart';
import 'package:mct_prayer_book/screens/hui_siang_transfer_merits.dart';
import 'package:mct_prayer_book/screens/initation_ceremony_screen.dart';
import 'package:mct_prayer_book/screens/khai_pan_opening_class.dart';
import 'package:mct_prayer_book/screens/making_vow_screen.dart';
import 'package:mct_prayer_book/screens/morning_evening_prayer_command.dart';
import 'package:mct_prayer_book/screens/purnima_amavasya_screen.dart';
import 'package:mct_prayer_book/screens/repentance_ceremony.dart';
import 'package:mct_prayer_book/screens/serving_prasada_scren.dart';
import 'package:mct_prayer_book/screens/sien_en_express_gratitude.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';

class PrayerCommandsScreen extends StatefulWidget {
  const PrayerCommandsScreen({super.key});

  @override
  State<PrayerCommandsScreen> createState() => _PrayerCommandsScreenState();
}

class _PrayerCommandsScreenState extends State<PrayerCommandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Prayer Commands"),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 20),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: TextConsts().commandHeading.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ComingLeavingPrayer(),
                    ),
                  );
                }
                if (index == 1) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MorningEveningPrayerCommand(),
                    ),
                  );
                }
                if (index == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServingPrasadaScren(),
                    ),
                  );
                }
                if (index == 3) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PurnimaAmavasyaScreen(),
                    ),
                  );
                }
                if (index == 4) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BigPurnimaAmavasyaScreen(),
                    ),
                  );
                }
                if (index == 5) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InitationCeremonyScreen(),
                    ),
                  );
                }
                if (index == 6) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => KhaiPanOpeningClass(),
                    ),
                  );
                }
                if (index == 7) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SienEnExpressGratitude(),
                    ),
                  );
                }
                if (index == 8) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HuiSiangTransferMerits(),
                    ),
                  );
                }
                if (index == 9) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RepentanceCeremony(),
                    ),
                  );
                }
                if (index == 10) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MakingVowScreen(),
                    ),
                  );
                }
                if (index == 11) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FestivalCeremonyScreen(),
                    ),
                  );
                }
                if (index == 12) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BidFestivalOutingCeremonyScreen(),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomLeft,
                    colors: [AppColors.secondaryColor, AppColors.primaryColor],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Main Card
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFF6D27A), // light yellow
                            Color(0xFFE99A7A), // light orange
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF6B2E1A),
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        TextConsts().commandHeading[index],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Top Left Number Box
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5B1A0E), // dark brown
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
