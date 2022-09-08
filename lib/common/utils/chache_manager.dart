import 'package:flutter_secure_storage/flutter_secure_storage.dart';

saveToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'token', value: token);
}

getToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'token');
}

Future<void> removeToken() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'token');
}