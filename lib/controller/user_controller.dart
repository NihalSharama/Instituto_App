import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/models/user.dart';

class UserController extends GetxController {
  var user = Rxn<UserModel>();

  loadUser() async {
    final UserModel? laodedUser = await UserStorage().getUser();

    if (laodedUser == null) {
      return;
    }
    user.value = laodedUser;
  }

  @override
  void onInit() {
    // featchTacherRequest();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
