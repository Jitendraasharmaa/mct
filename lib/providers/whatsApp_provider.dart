import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappProvider extends ChangeNotifier {
  Future<void> openWhatsApp(BuildContext context, int? phoneNumber) async {
    if (phoneNumber == null) {
      _showMessage(context, "Phone number not available");
      return;
    }

    final String phone = "91${phoneNumber.toString()}";

    final String message = Uri.encodeComponent(
      "Namaste,\nI’m Maitreya Charitable Trust.",
    );

    final Uri uri = Uri.parse("whatsapp://send?phone=$phone&text=$message");

    try {
      // ✅ Try opening WhatsApp app
      await launchUrl(uri);
    } catch (e) {
      try {
        // 🔁 Fallback (browser)
        final Uri fallback = Uri.parse("https://wa.me/$phone?text=$message");

        await launchUrl(fallback, mode: LaunchMode.externalApplication);
      } catch (e) {
        _showMessage(context, "WhatsApp not installed");
      }
    }
  }

  /// 🔔 Snackbar helper
  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
