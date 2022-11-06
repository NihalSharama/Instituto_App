import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:instituto/common/utils/error_handler_toaster.dart';
import 'package:instituto/common/utils/request_methods.dart';
import 'package:instituto/common/utils/toaster_message.dart';

class BatchServices {
  static var client = http.Client();

  static getBatchDetails(String id) async {
    try {
      var res = await RequestMethods.get_method('batch/$id', true);

      bool isNoserverError = await error_handler(res);
      return res['data']['data'];
    } catch (e) {
      toasterUnknownFailure();
    }
  }

  static createBatchService(String batchname, String batch_subject,
      String institute, String grade, String batchcode) async {
    try {
      var res = await RequestMethods.post_method(
          'batch/',
          {
            "batchname": batchname,
            "batch_subject": batch_subject,
            "institute": institute,
            "grade": grade,
            "batchcode": batchcode
          },
          false);

      await error_handler(res);
    } catch (e) {
      toasterUnknownFailure();
    }
  }

  static Future<List> getBatches() async {
    Map<dynamic, dynamic> res = await RequestMethods.get_method(
        'common/get_institute_batches', true); // route to fetch batches
    var data = res['data']['data'] as List;

    return data;
  }
}
