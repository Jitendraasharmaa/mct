import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppVersionService {
  static const String _versionKey = "app_version";

  /// Get version from device
  static Future<String> getCurrentAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Save version to SharedPreferences
  static Future<void> saveAppVersion() async {
    final prefs = await SharedPreferences.getInstance();
    String version = await getCurrentAppVersion();
    await prefs.setString(_versionKey, version);
  }

  /// Get saved version from SharedPreferences
  static Future<String?> getSavedVersion() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_versionKey);
  }

  /// Check if app updated
  static Future<bool> isAppUpdated() async {
    final prefs = await SharedPreferences.getInstance();

    String currentVersion = await getCurrentAppVersion();
    String? savedVersion = prefs.getString(_versionKey);

    if (savedVersion == null) {
      await prefs.setString(_versionKey, currentVersion);
      return false;
    }
    if (savedVersion != currentVersion) {
      await prefs.setString(_versionKey, currentVersion);
      return true;
    }
    return false;
  }
}
