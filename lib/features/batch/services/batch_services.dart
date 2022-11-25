import 'package:http/http.dart' as http;
import 'package:instituto/common/utils/error_handler_toaster.dart';
import 'package:instituto/common/utils/request_methods.dart';
import 'package:instituto/common/utils/toaster_message.dart';
import 'package:instituto/models/batch_models.dart';

class BatchServices {
  static var client = http.Client();

  static getBatchDetails(String id) async {
    try {
      final res = await RequestMethods.get_method('batch/$id/', true);

      // await error_handler(res);

      final parsedDetails = SelectedBatchDetailsModel(
          res['data']['institute'].toString(),
          res['data']['id'].toString(),
          res['data']['batch_code'],
          res['data']['batch_name'],
          '${res['data']['teacher']['first_name']} ${res['data']['teacher']['last_name']}',
          res['data']['batch_subject']['subject_name'],
          res['data']['grade'],
          res['data']['messages_list'],
          res['data']['documents_list'],
          [],
          res['data']['students'],
          res['data']['blacklist_students']);

      return parsedDetails;
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
            "batch_name": batchname,
            "batch_subject": batch_subject,
            "institute": institute,
            "grade": grade,
            "batch_code": batchcode
          },
          true);

      print(res);

      await error_handler(res);
    } catch (e) {
      toasterUnknownFailure();
    }
  }

  static Future<List> getBatches() async {
    Map<dynamic, dynamic> res =
        await RequestMethods.get_method('batch/list_batches/', true);

    var data = res['data'] as List;

    return data;
  }
}
