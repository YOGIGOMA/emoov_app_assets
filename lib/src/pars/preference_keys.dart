
/// @{category Pars}
/// Preference 서비스에 사용하는 키 값 상수
class PreferenceKeys
{
  static const String prefKeyOnCharging = 'state.onCharging';

  static const String prefKeyFilterCpo = 'filter.cpo';
  static const String prefKeyFilterIsOpen = 'filter.isOpen';
  static const String prefKeyFilterConnectorType = 'filter.connectorType';
  static const String prefKeyFilterRadius = 'filter.radius';
  static const String prefKeyFilterChargingSpeed = 'filter.chargingSpeed';
  static const String prefKeyFilterFacilityType = 'filter.facilityType';
  static const String prefKeySetupUseBiometrics = 'setup.useBiometrics';
  static const String prefKeyStateIsFirstRun = 'state.isFirstRun';

  static const String prefKeyStateCanUseBiometrics = 'state.canUseBiometrics';
  static const String prefKeyStateRememberLoginInfo = 'state.rememberLoginInfo';
  static const String prefKeyStateNeverShowNfcHelp = 'state.neverShowNfcHelp';
  // 최초 로그인시 안내 대화상자 전시 여부
  static const String prefKeyStateNeverShowFirstLoginHelp = 'state.neverShowFirstLoginHelp';

  // 충전상태 정보
  static const String prefKeyChargingStatusStartTime = 'chargingStatus.startTime';
  static const String prefKeyChargingStatusStage = 'chargingStatus.stage';
  static const String prefKeyChargingStatusAoC = 'chargingStatus.aoc';
  static const String prefKeyChargingStatusSoC = 'chargingStatus.soc';
  static const String prefKeyChargingStatusChargerId = 'chargingStatus.chargerId';
}