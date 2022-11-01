import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/common/utils/error_handler_toaster.dart';
import 'package:instituto/common/utils/request_methods.dart';
import 'package:instituto/common/utils/toaster_message.dart';
import 'package:instituto/constants/global_variables.dart';
import 'package:instituto/controller/auth_controllers.dart';

class AuthServices {
  static var client = http.Client();

  // Login
  static Future<bool> request_login_otp(int mobile) async {
    try {
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
      print('otp: ${mapRes['data']['otp']}');
      bool isNoServerError = await error_handler(mapRes);
      return isNoServerError;
    } catch (_) {
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      return false;
    }
  }

  static verify_login_otp(int mobile, int otp) async {
    try {
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
      bool isNoServerError = await error_handler(mapRes);
      if (isNoServerError) {
        print(mapRes['data']['token']);
        await saveToken(mapRes['data']['token']);
        await saveRefresh(mapRes['data']['refresh']);
      }
      return isNoServerError;
    } catch (e) {
      toasterUnknownFailure();
      return false;
    }
  }

  // Signup
  static Future<bool> request_signup_otp(
      int mobile, String firstname, String lastname) async {
    try {
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}auth/get_signup_otp/'),
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
      bool isNoServerError = await error_handler(mapRes);
      return isNoServerError;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      return false;
    }
  }

  static Future<bool> verify_signup_otp(
      int mobile, int otp, String role) async {
    try {
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}auth/signup_otp_verify/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{'mobile': mobile, 'otp': otp, 'role': role}),
      );
      Map mapRes = json.decode(response.body);
      await saveToken(mapRes['data']['token']);
      await saveRefresh(mapRes['data']['refresh']);

      bool isServerError = await error_handler(mapRes);
      return isServerError;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      return false;
    }
  }

  static Future<bool> student_step3_4_endpoint(
      String institute_code,
      List batches,
      String father_name,
      String mother_name,
      String gender) async {
    try {
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}initial/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $getToken()',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': institute_code,
          'batches': batches,
          'father_name': father_name,
          'mother_name': mother_name,
          'gender': gender
        }),
      );
      Map mapRes = json.decode(response.body);
      bool isNoServerError = await error_handler(mapRes);
      return isNoServerError;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      return false;
    }
  }

  static Future<bool> teacher_step3_4_endpoint(String institute_code,
      String about_me, String email, String gender) async {
    try {
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}initial/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $getToken()',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': institute_code,
          'about_me': about_me,
          'email': email,
          'gender': gender
        }),
      );
      Map mapRes = json.decode(response.body);
      bool isNoServerError = await error_handler(mapRes);
      return isNoServerError;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      return false;
    }
  }

  static Future<bool> owner_step3_4_endpoint(
      String institute_code,
      String institute_name,
      String institute_desc,
      String max_students,
      String email,
      String about_me,
      String gender,
      String location) async {
    try {
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}initial/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $getToken()',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': institute_code,
          'institute_name': institute_name,
          'institute_desc': institute_desc,
          'max_students': max_students,
          'email': email,
          'about_me': about_me,
          'gender': gender,
          'location': location
        }),
      );
      print('token');
      print(getToken());
      Map mapRes = json.decode(response.body);
      bool isNoServerError = await error_handler(mapRes);
      return isNoServerError;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Something went wrong',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      return false;
    }
  }

  static Future<List<String>> fetch_subjects_list(String institute_code) async {
    try {
      String token = await getToken();
      print(token);
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}common/get_institute_subjects/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': institute_code,
        }),
      );
      Map mapRes = json.decode(response.body);
      print(mapRes);

      return mapRes['data']['subjects'];
    } catch (e) {
      print('something went wrong');
      return [];
    }
  }

  static Future<List<String>> fetch_batches_list(
      String institute_code, List subjects, String grade) async {
    try {
      String token = await getToken();
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}common/get_institute_batches/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': institute_code,
          'subjects': subjects,
          'grade': grade
        }),
      );
      print(response.body);
      Map mapRes = json.decode(response.body);

      return mapRes['data']['batches'];
    } catch (e) {
      print('something went wrong');
      return [];
    }
  }

  static featch_token() async {
    try {
      final refresh = await getRefresh();
      Map res = await RequestMethods.post_method(
          'auth/token/refresh/', {'refresh': refresh});

      print(res['access']);
      return res['access'];
    } catch (e) {
      toasterUnknownFailure();
    }
  }
}
