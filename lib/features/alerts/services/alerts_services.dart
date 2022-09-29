import 'dart:convert';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/common/utils/error_handler_toaster.dart';
import 'package:instituto/common/utils/request_methods.dart';
import 'package:instituto/common/utils/toaster_message.dart';

class AlertsServices {
  static var client = http.Client();

  static Future<List> getTeacheresRequest() async {
    Map<dynamic, dynamic> res =
        await RequestMethods.get_method('institute/teacher_requests/', true);
    var data = res['data']['data'] as List;

    return data;
  }

  static assignSubjectsClassesService(
      String teacherid, List<String> subjects, List<String> grades) async {
    try {
      var res = await RequestMethods.post_method(
          'api/institute/assign_subjects/',
          {"teacher_id": teacherid, "grades": grades, "subjects": subjects});

      print(res);
      bool isNoserverError = await error_handler(res);
    } catch (e) {
      toasterUnknownFailure();
    }
  }
}
