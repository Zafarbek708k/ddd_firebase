import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class HttpService {
  static const HttpService _service = HttpService._internal();

  const HttpService._internal();

  factory HttpService() {
    return _service;
  }

  static const String baseUrl = "api.api-ninjas.com";
  static const String apiQrCode = "/v1/qrcode";
  static const String apiAnimal = "/v1/animals";



  // header
  static const Map<String, String> headers = {"x-api-key": "n9Q2Rw3jvtqd2zIskqjSnQ==VaVRlsKdBASzv2eM", "Content-Type": "application/json"};

  /// params
  static Map<String, Object?> paramEmpty() => const <String, Object?>{};


  static Map<String, Object?> paramAnimal({required String name}) => <String, Object?>{
        "name": name,
      };

  /// Methods

  static Future<String?> create({required String baseUrl, required String api, required Map<String, Object?> data}) async {
    Uri url = Uri.https(baseUrl, api);
    Response response = await post(url, body: jsonEncode(data), headers: headers);
    if (response.statusCode >= 200 && response.statusCode <= 202) {
      final result = response.body;
      log("Http create func response: $result");
      return result;
    } else {
      return null;
    }
  }

  static Future<String?> read({required String baseUrl, required String api, required Map<String, Object?> param}) async {
    Uri url = Uri.https(baseUrl, api, param);
    log(url.toString());
    Response response = await get(url, headers: headers);
    if (response.statusCode <= 201) {
      final result = response.body;
      log("Http read func response: $result");
      return result;
    } else {
      return null;
    }
  }

  static Future<String?> update({required String baseUrl, required String api, required String id, required Map<String, Object?> data}) async {
    Uri url = Uri.https(baseUrl, "$api/$id");
    Response response = await put(url, body: jsonEncode(data), headers: headers);
    if (response.statusCode <= 201) {
      final result = response.body;
      log("Http update func response: $result");
      return result;
    } else {
      return null;
    }
  }

  static Future<String?> deleteData(
      {required String baseUrl, required String api, required Map<String, Object?> param, required Map<String, Object?> data}) async {
    Uri url = Uri.https(baseUrl, api, param);
    Response response = await delete(url, body: jsonEncode(data), headers: headers);
    if (response.statusCode <= 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
