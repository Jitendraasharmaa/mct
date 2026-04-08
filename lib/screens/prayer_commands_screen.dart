import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';
import 'package:mct_prayer_book/constants/text_consts.dart';
import 'package:mct_prayer_book/screens/bid_festival_outing_ceremony_screen.dart';
import 'package:mct_prayer_book/screens/big_purnima_amavasya_screen.dart';
import 'package:mct_prayer_book/screens/coming_leaving_prayer.dart';
import 'package:mct_prayer_book/screens/festival_ceremony_screen.dart';
import 'package:mct_prayer_book/screens/holy_water_ceremony.dart';
import 'package:mct_prayer_book/screens/hui_siang_transfer_merits.dart';
import 'package:mct_prayer_book/screens/initation_ceremony_screen.dart';
import 'package:mct_prayer_book/screens/khai_pan_opening_class.dart';
import 'package:mct_prayer_book/screens/making_vow_screen.dart';
import 'package:mct_prayer_book/screens/morning_evening_prayer_command.dart';
import 'package:mct_prayer_book/screens/new_year_ceremony.dart';
import 'package:mct_prayer_book/screens/purnima_amavasya_screen.dart';
import 'package:mct_prayer_book/screens/repentance_ceremony.dart';
import 'package:mct_prayer_book/screens/serving_prasada_scren.dart';
import 'package:mct_prayer_book/screens/set_up_altar_ceremony.dart';
import 'package:mct_prayer_book/screens/sien_en_express_gratitude.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';

class PrayerCommandsScreen extends StatefulWidget {
  const PrayerCommandsScreen({super.key});

  @override
  State<PrayerCommandsScreen> createState() => _PrayerCommandsScreenState();
}

class _PrayerCommandsScreenState extends State<PrayerCommandsScreen> {
  void _openScreen(BuildContext context, int index) {
    Widget screen;
    switch (index) {
      case 0:
        screen = ComingLeavingPrayer();
        break;
      case 1:
        screen = MorningEveningPrayerCommand();
        break;
      case 2:
        screen = ServingPrasadaScren();
        break;
      case 3:
        screen = PurnimaAmavasyaScreen();
        break;
      case 4:
        screen = BigPurnimaAmavasyaScreen();
        break;
      case 5:
        screen = InitationCeremonyScreen();
        break;
      case 6:
        screen = KhaiPanOpeningClass();
        break;
      case 7:
        screen = SienEnExpressGratitude();
        break;
      case 8:
        screen = HuiSiangTransferMerits();
        break;
      case 9:
        screen = RepentanceCeremony();
        break;
      case 10:
        screen = MakingVowScreen();
        break;
      case 11:
        screen = FestivalCeremonyScreen();
        break;
      case 12:
        screen = BidFestivalOutingCeremonyScreen();
        break;
      case 13:
        screen = NewYearCeremony();
        break;
      case 14:
        screen = SetUpAltarCeremony();
        break;
      case 15:
        screen = HolyWaterCeremony();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppbarWidget(title: "Prayer Commands"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: ListView.builder(
          itemCount: TextConsts().commandHeading.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      "${index + 1}",
                      style: GoogleFonts.notoSerifGeorgian(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      TextConsts().commandHeading[index],
                      style: GoogleFonts.notoSerifGeorgian(
                        color: AppColors.primaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () => _openScreen(context, index),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.orange.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.orange.withOpacity(0.25),
                        ),
                      ),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
