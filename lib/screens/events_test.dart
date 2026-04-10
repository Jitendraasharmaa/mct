import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:mct_prayer_book/constants/app_colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime selectedDate = DateTime.now();

  late DateTime _selectedDate;
  late List<DateTime> _eventDates;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
    _eventDates = [
      DateTime.now().add(const Duration(days: 2)),
      DateTime.now().add(const Duration(days: 3)),
      DateTime.now().add(const Duration(days: 4)),
      DateTime.now().subtract(const Duration(days: 4)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print("The date is: ${selectedDate}");
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 16),
                _buildTopBar(),
                const SizedBox(height: 16),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CalendarTimeline(
                      showYears: true,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365 * 4),
                      ),
                      eventDates: _eventDates,
                      onDateSelected: (date) =>
                          setState(() => _selectedDate = date),
                      leftMargin: 12,
                      monthColor: AppColors.orangeDark,
                      dayColor: Colors.teal[200],
                      dayNameColor: const Color(0xFF333A47),
                      activeDayColor: AppColors.whiteColor,
                      activeBackgroundDayColor: AppColors.orange,
                      dotColor: Colors.white,
                      selectableDayPredicate: (date) => date.day != 23,
                      locale: 'en',
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 16),
                    //   child: TextButton(
                    //     style: ButtonStyle(
                    //       backgroundColor: WidgetStateProperty.all(
                    //         Colors.teal[200],
                    //       ),
                    //     ),
                    //     child: const Text(
                    //       'RESET',
                    //       style: TextStyle(color: Color(0xFF333A47)),
                    //     ),
                    //     onPressed: () => setState(() => _resetSelectedDate()),
                    //   ),
                    // ),
                  ],
                ),
                // _buildWeekHeader(),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _timeRow(
                          '8:00 am',
                          ScheduleCard(
                            title: 'Research new project',
                            time: '8:00 - 09:00 am',
                            background: const Color(0xffF3DDF4),
                            border: const Color(0xffB52AC7),
                          ),
                        ),
                        _timeRow(
                          '9:00 am',
                          ScheduleCard(
                            title: 'Design onboarding',
                            time: '8:00 - 09:00 am',
                            background: const Color(0xffDCE7F4),
                            border: const Color(0xff005BBB),
                            checked: true,
                          ),
                        ),
                        _timeRow(
                          '11:00 am',
                          ScheduleCard(
                            title: 'Learn Webflow',
                            time: '8:00 - 09:00 am',
                            background: const Color(0xffF3DDF4),
                            border: const Color(0xffB52AC7),
                          ),
                        ),
                        _buildNoonDivider(),
                        _timeRow(
                          '13:00 pm',
                          ScheduleCard(
                            title: 'Lunch break',
                            time: '8:00 - 09:00 am',
                            background: const Color(0xffE0EEE6),
                            border: const Color(0xff12954A),
                          ),
                        ),
                        const SizedBox(height: 130),
                        _timeRow(
                          '16:00 pm',
                          ScheduleCard(
                            title: 'Report progress with client',
                            time: '8:00 - 09:00 am',
                            background: const Color(0xffE0EEE6),
                            border: const Color(0xff12954A),
                          ),
                        ),
                        const SizedBox(height: 160),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              right: 20,
              bottom: 80,
              child: Column(
                children: [
                  _fab(
                    color: const Color(0xffF47A14),
                    icon: Icons.content_paste,
                  ),
                  const SizedBox(height: 14),
                  _fab(
                    color: const Color(0xff16A085),
                    icon: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xffC8D2DF),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.08),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.close, size: 34),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _squareButton(Icons.menu),
          const SizedBox(width: 18),
          const Text(
            'December 2023',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          _squareButton(Icons.close),
          const SizedBox(width: 10),
          _squareButton(Icons.search),
        ],
      ),
    );
  }

  Widget _buildWeekHeader() {
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Sat'];
    final dates = ['17', '18', '19', '20', '23'];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var day in days)
                SizedBox(
                  width: 46,
                  child: Text(
                    day,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dateItem('17'),
              _dateItem('18'),
              _dateItem('19'),
              _dateItem('20', selected: true),
              _dateItem('23'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(height: 1, color: const Color(0xffE1E1E1)),
      ],
    );
  }

  Widget _dateItem(String value, {bool selected = false}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: selected ? const Color(0xff3B82F6) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: selected
            ? Border.all(color: const Color(0xff9CC3FF), width: 2)
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _timeRow(String time, Widget card) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 78,
            child: Text(
              time,
              style: const TextStyle(
                color: Color(0xff808080),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(width: 1, color: const Color(0xffE2E2E2)),
          const SizedBox(width: 8),
          Expanded(child: card),
        ],
      ),
    );
  }

  Widget _buildNoonDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 18),
      child: Row(
        children: [
          const SizedBox(
            width: 74,
            child: Text(
              'Noon',
              style: TextStyle(
                color: Color(0xffF05A1A),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Icon(Icons.play_arrow, size: 14, color: Color(0xffF05A1A)),
          const SizedBox(width: 4),
          Expanded(child: Container(height: 2, color: const Color(0xffF05A1A))),
        ],
      ),
    );
  }

  Widget _fab({required Color color, required IconData icon}) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String title;
  final String time;
  final Color background;
  final Color border;
  final bool checked;

  const ScheduleCard({
    super.key,
    required this.title,
    required this.time,
    required this.background,
    required this.border,
    this.checked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: border, width: 4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    decoration: checked ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: checked ? border : Colors.transparent,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: border, width: 2),
            ),
            child: checked
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        ],
      ),
    );
  }
}

Widget _squareButton(IconData icon) {
  return Container(
    width: 52,
    height: 52,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xffE3E8EF), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Icon(icon, size: 24, color: const Color(0xff1F2937)),
  );
}
