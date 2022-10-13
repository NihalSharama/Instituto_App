import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/common/utils/error_handler_toaster.dart';
import 'package:instituto/common/utils/request_methods.dart';
import 'package:instituto/common/utils/toaster_message.dart';

class HomeServices {
  static var client = http.Client();

  static createBatchService(String batchname, String batch_subject,
      String institute, String grade, String batchcode) async {
    try {
      var res = await RequestMethods.post_method('api/batch/', {
        "batchname": batchname,
        "batch_subject": batch_subject,
        "institute": institute,
        "grade": grade,
        "batchcode": batchcode
      });

      bool isNoserverError = await error_handler(res);
    } catch (e) {
      toasterUnknownFailure();
    }
  }

  static Future<List> getBatches() async {
    Map<dynamic, dynamic> res = await RequestMethods.get_method(
        'batch/', true); // route to fetch batches
    var data = res['data']['data'] as List;

    return data;
  }
}
