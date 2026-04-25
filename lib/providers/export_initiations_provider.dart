import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ExportInitiationsProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> exportCSV(
    BuildContext context,
    List<Map<String, dynamic>> data, // 👈 receive data
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      List<List<dynamic>> rows = [];

      // Header
      rows.add([
        "Book Sl No",
        "Name",
        "Age",
        "Gender",
        "Education",
        "Phone",
        "Introducer",
        "Guarantor",
        "Master",
        "Temple",
        "EnglishDate",
        "ChineseDate",
        "MeritsFee",
        "Address",
        "DMAttended",
        "Remarks",
      ]);

      for (var item in data) {
        rows.add([
          item['bookSlNo'],
          item['person'] ?? '',
          item['age'] ?? '',
          item['gender'] ?? '',
          item['education'] ?? '',
          item['phone'] ?? '',
          item['introducer'] ?? '',
          item['guarantor'] ?? '',
          item['master'] ?? '',
          item['temple'] ?? '',
          item['englishDate'] ?? '',
          item['chineseDate'] ?? '',
          item['meritsFee'] ?? '',
          item['address'] ?? '',
          item['dmAttended'] ?? '',
          item['remarks'] ?? '',
        ]);
      }

      String csvData = const ListToCsvConverter().convert(rows);

      final directory = await getExternalStorageDirectory();
      final path =
          "${directory!.path}/initiations_${DateTime.now().millisecondsSinceEpoch}.csv";

      final file = File(path);
      await file.writeAsString(csvData);

      await Share.shareXFiles([XFile(path)]);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CSV exported successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    isLoading = false;
    notifyListeners();
  }
}
