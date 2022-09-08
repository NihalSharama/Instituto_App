import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instituto/common/utils/chache_manager.dart';

Future<bool> error_handler(Map map_res) async {
  if (map_res['status_code'] == 200 || map_res['success'] == true) {
    Fluttertoast.showToast(
      msg: map_res['message'],
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
    );

    return true;
  } else {
    Fluttertoast.showToast(
      msg: map_res['message'],
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
    );
    return false;
  }
}
