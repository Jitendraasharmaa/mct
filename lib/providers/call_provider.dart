import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallProvider extends ChangeNotifier {
  Future<void> makePhoneCall(BuildContext context, int? phoneNumber) async {
    if (phoneNumber == null) {
      _showMessage(context, "Phone number not available");
      return;
    }

    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber.toString());

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        _showMessage(context, "Cannot open dialer");
      }
    } catch (e) {
      _showMessage(context, "Something went wrong");
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
