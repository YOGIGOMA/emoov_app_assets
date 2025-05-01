
import 'package:emoov_app_assets/emoov_app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// @{category Service}
/// Preference 서비스 클래스
class PreferenceService
{
  Future<dynamic> hasChargingProcess() async
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

  Future<StationSearchFilter> getFilterOptions() async
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

  Future<SetupOptions> getSetupOptions() async
  {
    final prefs = await SharedPreferences.getInstance();

    SetupOptions options = SetupOptions(
      useBiometrics: prefs.getBool(PreferenceKeys.prefKeySetupUseBiometrics)!,
    );

    return options;
  }

  Future<void> saveCpos(List<String> cpos) async
  {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(PreferenceKeys.prefKeyFilterCpo, cpos);

    return;
  }

  Future<void>  saveConnectors(List<String> connectors) async
  {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(PreferenceKeys.prefKeyFilterConnectorType, connectors);
  }

  void saveSpeeds(List<String> speeds) async
  {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(PreferenceKeys.prefKeyFilterChargingSpeed, speeds);
  }

  void saveRadius(double value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(PreferenceKeys.prefKeyFilterRadius, value);
  }

  void saveAccessible(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.prefKeyFilterIsOpen, value);
  }

  void saveUseBiometric(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(PreferenceKeys.prefKeySetupUseBiometrics, value);
  }

  Future<bool?> getUseBiometricState() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PreferenceKeys.prefKeySetupUseBiometrics);
  }

  Future<String> printBiometricsStatus() async
  {
    final prefs = await SharedPreferences.getInstance();

    String rv = 'Shared Preference: \n'
        '${PreferenceKeys.prefKeySetupUseBiometrics}: '
        '${prefs.getBool(PreferenceKeys.prefKeySetupUseBiometrics)}';

    return rv;
  }
}