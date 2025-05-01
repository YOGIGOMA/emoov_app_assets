
/// @{category Pars}
/// 앱에서 사용하는 공통 상수 값
class CommonConstants
{
  static const Map<String, String> creditCardBrandImageMap = {
    'JCB':'assets/img/creditcard/jcb_icon.svg',
    '다이너스':'assets/img/creditcard/diners_icon.svg',
    '아멕스': 'assets/img/creditcard/amex_icon.svg',
    '비자': 'assets/img/creditcard/visa_icon.svg',
    '마스터': 'assets/img/creditcard/mastercard_icon.svg',
    '은련': 'assets/img/creditcard/union_icon.svg',
  };

  static const Map<String, String> connectorLabelMap = {
    '01':'DC차데모',
    '02':'AC완속',
    '03':'DC차데모 / AC3상',
    '04':'DC콤보',
    '05':'DC차데모 / DC콤보',
    '06':'DC차데모 / AC3상 / DC콤보',
    '07':'AC3상',
    '89':'H2',
  };
}