import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class RemoteServices {
  static var client = http.Client();

  // Login
  static void request_login_otp(int mobile) async {
    var response = await client.post(
      Uri.parse('${dotenv.env['SERVER']}auth/get_login_otp/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'mobile': mobile,
      }),
    );
    Map mapRes = json.decode(response.body);
    print(mapRes['status_code']);
    if (mapRes['status_code'] == 200) {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
      );
    } else {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  static verify_login_otp(int mobile, int otp) async {
    var response = await client.post(
      Uri.parse('${dotenv.env['SERVER']}auth/login_otp_verify/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'mobile': mobile,
        'otp': otp,
      }),
    );
    Map mapRes = json.decode(response.body);

    if (mapRes['status_code'] == 200) {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
      );

      // saving token to chache
      await saveToken(mapRes['token']);
    } else {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
    }
  }

  // Signup
  static void request_signup_otp(
      int mobile, String firstname, String lastname) async {
    var response = await client.post(
      Uri.parse('${dotenv.env['SERVER']}auth/send_otp/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'mobile': mobile,
        'first_name': firstname,
        'last_name': lastname
      }),
    );
    Map mapRes = json.decode(response.body);

    print(mapRes);
    if (mapRes['status_code'] == 200) {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
      );
    } else {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  static verify_signup_otp(int mobile, int otp, String role) async {
    var response = await client.post(
      Uri.parse('${dotenv.env['SERVER']}auth/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{'mobile': mobile, 'otp': otp, 'role': role}),
    );
    Map mapRes = json.decode(response.body);
    print(mapRes);
    if (mapRes['status_code'] == 200) {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
      );

      // saving token to chache
      await saveToken(mapRes['token']);
    } else {
      Fluttertoast.showToast(
        msg: mapRes['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
