
import 'package:emoov_app_assets/emoov_app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @{category Service}
/// Preference 서비스 클래스
class PreferenceService
{
  static Future<void> initializeSharedPreference() async
  {
    /// preference 저장소 인스턴스를 설정한다.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    /// Set default filter options for charger searching.
    if(prefs.getStringList(PreferenceKeys.prefKeyFilterCpo) == null) {
      prefs.setStringList(PreferenceKeys.prefKeyFilterCpo, []);
    }
    if(prefs.getBool(PreferenceKeys.prefKeyFilterIsOpen) == null) {
      prefs.setBool(PreferenceKeys.prefKeyFilterIsOpen, false);
    }
    if(prefs.getStringList(PreferenceKeys.prefKeyFilterConnectorType) == null) {
      prefs.setStringList(PreferenceKeys.prefKeyFilterConnectorType, []);
    }
    if(prefs.getDouble(PreferenceKeys.prefKeyFilterRadius) == null) {
      prefs.setDouble(PreferenceKeys.prefKeyFilterRadius, 1.0);
    }
    if(prefs.getStringList(PreferenceKeys.prefKeyFilterChargingSpeed) == null) {
      prefs.setStringList(PreferenceKeys.prefKeyFilterChargingSpeed, []);
    }
    if(prefs.getStringList(PreferenceKeys.prefKeyFilterFacilityType) == null) {
      prefs.setStringList(PreferenceKeys.prefKeyFilterFacilityType, []);
    }

    /// Set default setup
    if(prefs.getBool(PreferenceKeys.prefKeySetupUseBiometrics) == null) {
      prefs.setBool(PreferenceKeys.prefKeySetupUseBiometrics, false);
    }

    /// Set default state
    if(prefs.getBool(PreferenceKeys.prefKeyStateIsFirstRun) == null) {
      prefs.setBool(PreferenceKeys.prefKeyStateIsFirstRun, true);
    }
    if(prefs.getBool(PreferenceKeys.prefKeyStateCanUseBiometrics) == null) {
      prefs.setBool(PreferenceKeys.prefKeyStateCanUseBiometrics, false);
    }
    if(prefs.getBool(PreferenceKeys.prefKeyStateRememberLoginInfo) == null) {
      prefs.setBool(PreferenceKeys.prefKeyStateRememberLoginInfo, false);
    }
    if(prefs.getBool(PreferenceKeys.prefKeyStateNeverShowFirstLoginHelp) == null) {
      prefs.setBool(PreferenceKeys.prefKeyStateNeverShowFirstLoginHelp, false);
    }
    if(prefs.getString(PreferenceKeys.prefKeyStateShowNoticeDialog) == null) {
      prefs.setString(PreferenceKeys.prefKeyStateShowNoticeDialog, '');
    }

    /// Set Default charging status
    if(prefs.getString(PreferenceKeys.prefKeyChargingStatusStartTime) == null) {
      prefs.setString(PreferenceKeys.prefKeyChargingStatusStartTime, '');
    }
    if(prefs.getString(PreferenceKeys.prefKeyChargingStatusStage) == null) {
      prefs.setString(PreferenceKeys.prefKeyChargingStatusStage, '');
    }
    if(prefs.getString(PreferenceKeys.prefKeyChargingStatusChargerId) == null) {
      prefs.setString(PreferenceKeys.prefKeyChargingStatusChargerId, '');
    }
    if(prefs.getInt(PreferenceKeys.prefKeyChargingStatusAoC) == null) {
      prefs.setInt(PreferenceKeys.prefKeyChargingStatusAoC, 0);
    }
    if(prefs.getDouble(PreferenceKeys.prefKeyChargingStatusSoC) == null) {
      prefs.setDouble(PreferenceKeys.prefKeyChargingStatusSoC, 0.0);
    }
  }

  static Future<dynamic> hasChargingProcess() async
  {
    final prefs = await SharedPreferences.getInstance();

    bool? onCharging = prefs.getBool(PreferenceKeys.prefKeyOnCharging);

    if(onCharging == null)
    {
      return false;
    }
    else {
      return onCharging;
    }
  }

  static Future<StationSearchFilter> getFilterOptions() async
  {
    final prefs = await SharedPreferences.getInstance();

    StationSearchFilter filter = StationSearchFilter(
        searchingRadius: prefs.getDouble(PreferenceKeys.prefKeyFilterRadius)!,
        onlyAccessible: prefs.getBool(PreferenceKeys.prefKeyFilterIsOpen)!,
        minChargingWatt: 7,
        connectorTypes: prefs.getStringList(PreferenceKeys.prefKeyFilterConnectorType)!,
        cpos : prefs.getStringList(PreferenceKeys.prefKeyFilterCpo)!,
        chargingSpeeds: prefs.getStringList(PreferenceKeys.prefKeyFilterChargingSpeed)!,
        facilityTypes: prefs.getStringList(PreferenceKeys.prefKeyFilterFacilityType)!
    );

    return filter;
  }

  static Future<SetupOptions> getSetupOptions() async
  {
    final prefs = await SharedPreferences.getInstance();

    SetupOptions options = SetupOptions(
      useBiometrics: prefs.getBool(PreferenceKeys.prefKeySetupUseBiometrics)!,
    );

    return options;
  }

  static Future<void> saveCpos(List<String> cpos) async
  {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(PreferenceKeys.prefKeyFilterCpo, cpos);

    return;
  }

  static Future<void>  saveConnectors(List<String> connectors) async
  {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(PreferenceKeys.prefKeyFilterConnectorType, connectors);
  }

  static void saveSpeeds(List<String> speeds) async
  {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(PreferenceKeys.prefKeyFilterChargingSpeed, speeds);
  }

  static void saveRadius(double value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(PreferenceKeys.prefKeyFilterRadius, value);
  }

  static void saveAccessible(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.prefKeyFilterIsOpen, value);
  }

  static void saveUseBiometric(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.prefKeySetupUseBiometrics, value);
  }

  static Future<bool?> getUseBiometricState() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PreferenceKeys.prefKeySetupUseBiometrics);
  }

  static void saveRememberLoginInfoState(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.prefKeyStateRememberLoginInfo, value);
  }

  static Future<bool?> getRememberLoginInfoState() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PreferenceKeys.prefKeyStateRememberLoginInfo);
  }

  static void saveNeverShowNfcHelpState(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.prefKeyStateNeverShowNfcHelp, value);
  }

  static Future<bool?> getNeverShowNfcHelpState() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PreferenceKeys.prefKeyStateNeverShowNfcHelp);
  }

  static void saveNeverShowFirstLoginHelpState(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.prefKeyStateNeverShowFirstLoginHelp, value);
  }

  static Future<bool?> getNeverShowFirstLoginHelpState() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PreferenceKeys.prefKeyStateNeverShowFirstLoginHelp);
  }

  static void saveShowNoticeDialogState(String value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferenceKeys.prefKeyStateShowNoticeDialog, value);
  }

  static Future<String> getShowNoticeDialogState() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(PreferenceKeys.prefKeyStateShowNoticeDialog)!;
  }

  static void saveChargingStatusAoC(int value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(PreferenceKeys.prefKeyChargingStatusAoC, value);
  }

  static Future<int> getChargingStatusAoC() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(PreferenceKeys.prefKeyChargingStatusAoC)!;
  }

  static void saveChargingStatusSoC(double value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(PreferenceKeys.prefKeyChargingStatusSoC, value);
  }

  static Future<double> getChargingStatusSoC() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(PreferenceKeys.prefKeyChargingStatusSoC)!;
  }

  static void saveChargingStatusStage(String value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferenceKeys.prefKeyChargingStatusStage, value);
  }

  static Future<String> getChargingStatusStage() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(PreferenceKeys.prefKeyChargingStatusStage)!;
  }

  static void saveChargingStatusStartTime(String value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferenceKeys.prefKeyChargingStatusStartTime, value);
  }

  static Future<String> getChargingStatusStartTime() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(PreferenceKeys.prefKeyChargingStatusStartTime)!;
  }

  static Future<String> printBiometricsStatus() async
  {
    final prefs = await SharedPreferences.getInstance();

    String rv = 'Shared Preference: \n'
        '${PreferenceKeys.prefKeySetupUseBiometrics}: '
        '${prefs.getBool(PreferenceKeys.prefKeySetupUseBiometrics)}';

    return rv;
  }
}