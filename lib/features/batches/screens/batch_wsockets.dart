import 'dart:async';

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:instituto/controller/user_controller.dart';
import 'package:web_socket_channel/io.dart';

class BatchWebSockets {
  static final BatchWebSockets _singleton = BatchWebSockets._internal();

  StreamController<String> streamController =
      StreamController.broadcast(sync: true);

  IOWebSocketChannel? channel;
  late var channelStream = channel?.stream.asBroadcastStream();

  factory BatchWebSockets() {
    return _singleton;
  }

  BatchWebSockets._internal() {
    initWebSocketConnection();
  }

  initWebSocketConnection() async {
    final userController = Get.put(UserController());
    String userID = userController.user.value!.id;

    print("conecting...");

    try {
      channel = IOWebSocketChannel.connect(
        Uri.parse('ws://10.0.2.2:8001/chat/$userID/'),
        pingInterval: const Duration(seconds: 10),
      );
    } on Exception catch (e) {
      print('exeption accured');
      print(e);
      return await initWebSocketConnection();
    }

    print("socket connection initializied");
    channel?.sink.done.then((dynamic _) => _onDisconnected());
  }

  void sendMessage(messageObject, Function messageListener) {
    try {
      channel?.sink.add(json.encode(messageObject));
      channelStream?.listen((data) {
        Map message = json.decode(data);
        messageListener(message);
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void _onDisconnected() {
    initWebSocketConnection();
  }
}
