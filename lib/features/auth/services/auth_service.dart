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

  // ignore: non_constant_identifier_names
  static verify_login_otp(int mobile, int otp) async {
    try {
      var response = await RequestMethods.post_method(
          'auth/login_otp_verify/',
          {
            'mobile': mobile,
            'otp': otp,
          },
          false);

      bool isNoServerError = await error_handler(response);
      if (isNoServerError) {
        print(response['data']['token']);
        await saveToken(response['data']['token']);
        await saveRefresh(response['data']['refresh']);
      }

      return response['data']['user'];
    } catch (e) {
      toasterUnknownFailure();
      return;
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

  static Future<bool> student_step3_4_endpoint(String instituteCode,
      List batches, String fatherName, String motherName, String gender) async {
    final token = await getToken();
    try {
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}initial/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'insitute_code': instituteCode.toString(),
          'batches': batches,
          'father_name': fatherName,
          'mother_name': motherName,
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

  static Future<bool> teacher_step3_4_endpoint(
      String instituteCode, String aboutMe, String email, String gender) async {
    try {
      var token = await getToken();
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}initial/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': instituteCode,
          'about_me': aboutMe,
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
      String instituteCode,
      String instituteName,
      String instituteDesc,
      String maxStudents,
      String email,
      String aboutMe,
      String gender,
      String location) async {
    try {
      final token = await getToken();
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}initial/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': instituteCode,
          'institute_name': instituteName,
          'institute_desc': instituteDesc,
          'max_students': maxStudents,
          'email': email,
          'about_me': aboutMe,
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

  static Future<List<String>> fetch_subjects_list(String instituteCode) async {
    try {
      var response = await RequestMethods.post_method(
          'common/get_institute_subjects/',
          {'institute_code': instituteCode},
          true);

      var subjects = <String>[];

      response['data']['subjects'].forEach((dynamic subject) {
        subjects.add(subject['subject_name']);
      });

      return subjects;
    } catch (e) {
      print('something went wrong');
      return [];
    }
  }

  static Future<List<String>> fetch_batches_list(
      String instituteCode, List subjects, String grade) async {
    try {
      String token = await getToken();
      var response = await client.post(
        Uri.parse('${dotenv.env['SERVER']}common/get_institute_batches/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'institute_code': instituteCode,
          'subjects': ['MATHS', 'PHYSICS'],
          'grade': grade
        }),
      );
      Map mapRes = json.decode(response.body);

      var batches_name = <String>[];

      mapRes['data']['batches'].forEach((batch) {
        batches_name.add(batch['batch_name']);
      });
      return batches_name;
    } catch (e) {
      print('something went wrong f');
      return [];
    }
  }

  static featch_token() async {
    try {
      final refresh = await getRefresh();
      Map res = await RequestMethods.post_method(
          'auth/token/refresh/', {'refresh': refresh}, false);

      print(res['access']);
      return res['access'];
    } catch (e) {
      toasterUnknownFailure();
    }
  }
}
