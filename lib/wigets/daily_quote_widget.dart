import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class DailyQuoteWidget extends StatelessWidget {
  const DailyQuoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DatabaseEvent>(
        stream: FirebaseDatabase.instance.ref("dailyTeachings").onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("There is no teachings"));
          }

          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(child: Text("No quote found"));
          }

          final rawData = snapshot.data!.snapshot.value;

          if (rawData is! Map) {
            return const Center(child: Text("Invalid data format"));
          }
          final data = Map<String, dynamic>.from(rawData);
          // Convert all daily teachings into a list
          final quotes = data.entries.map((entry) {
            return Map<String, dynamic>.from(entry.value);
          }).toList();

          if (quotes.isEmpty) {
            return const Center(child: Text("No quotes available"));
          }
          // Pick one quote based on today's day
          final today = DateTime.now().day;
          // Example:
          // day 1 -> index 0
          // day 2 -> index 1
          // repeats automatically if more days than quotes
          final index = (today - 1) % quotes.length;
          final todayQuote = quotes[index];
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DAILY TEACHING',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.auto_stories_outlined,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      todayQuote["quote"] ?? "",
                      style: GoogleFonts.notoSerifGeorgian(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.45,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      "- ${todayQuote["author"] ?? ""}",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
