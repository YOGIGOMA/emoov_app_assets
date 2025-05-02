
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_models/app_user.dart';

///@{category Provider}
///AppUser 데이터의 상태를 관리하는 상태알림 클래스
class AppUserNotifier extends StateNotifier<AppUser?> {

  AppUserNotifier() : super(null);

  void setAppUser(AppUser user)
  {
    state = user;
  }

  void clearAppUser() {
    state = null;
  }

  AppUser? getAppUser()
  {
    return state;
  }
}