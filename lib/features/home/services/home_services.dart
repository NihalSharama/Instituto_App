import 'package:http/http.dart' as http;
import 'package:instituto/common/utils/request_methods.dart';
import 'package:instituto/common/utils/toaster_message.dart';

class HomeServices {
  static var client = http.Client();

  static createSubject(String subject, String user) async {
    print(subject);
    try {
      var res = await RequestMethods.post_method(
          'api/batch/', {"subject": subject, "user": user});

      print('res: ');
      print(res);
    } catch (e) {
      toasterUnknownFailure();
    }
  }
}
