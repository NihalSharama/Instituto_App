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
      var res = await RequestMethods.get_method('api/batch/$id', true);

      bool isNoserverError = await error_handler(res);
      return res['data']['data'];
    } catch (e) {
      toasterUnknownFailure();
    }
  }
}
