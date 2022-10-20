import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:instituto/common/utils/chache_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class RequestMethods {
  static var client = http.Client();

  static Future<bool> featchTokenIfExpired(Map mapRes) async {
    try {
      if (mapRes['messages'][0]['message'].contains('expired')) {
        // check for refresh token expire, if not expired then featch new token
        var refresh = await getRefresh();
        Map<String, dynamic> refreshDecoded = JwtDecoder.decode(refresh);
        bool isRefreshExp = JwtDecoder.isExpired(refresh);

        print(refreshDecoded);
        if (isRefreshExp) {
          // logout
        }

        // get new token and refresh and save it
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  static Future<Map> get_method(String path, bool isAuth) async {
    final token = await getToken();
    var response = await client.get(Uri.parse('${dotenv.env['SERVER']}$path'),
        headers: (isAuth
            ? <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token',
              }
            : <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              }));

    Map mapRes = json.decode(response.body);
    bool wasExpired = await featchTokenIfExpired(mapRes);

    if (wasExpired) {
      // get new token
      // then refeatch the data
    }
    mapRes = json.decode(response.body);

    return mapRes;
  }

  static Future<Map> post_method(String path, Object data) async {
    var response = await client.post(
      Uri.parse('${dotenv.env['SERVER']}$path '),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    return json.decode(response.body);
  }
}
