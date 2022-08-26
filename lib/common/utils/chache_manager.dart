import 'package:get_storage/get_storage.dart';

Future<void> saveToken(String? token) async {
  final box = GetStorage();
  await box.write('token', token);
}

String? getToken() {
  final box = GetStorage();
  return box.read('token');
}

Future<void> removeToken() async {
  final box = GetStorage();
  await box.remove('token');
}
