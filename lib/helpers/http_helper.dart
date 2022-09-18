import 'dart:developer';

import 'package:http/http.dart' as http;

Future<http.Response> get({
  required Uri uri,
  Map<String, String>? headers,
  bool? showLog,
}) async {
  try {
    final response = await http.get(uri, headers: headers);
    if (showLog ?? false) {
      _showLogs(response);
    }
    return response;
  } catch (error) {
    throw Exception(error);
  }
}

void _showLogs(http.Response response) {
  int statusCode = response.statusCode;
  String url = response.request?.url.toString() ?? '';
  String body = response.body;

  if(statusCode == 200) {
    _showSuccessLogs(statusCode: statusCode, url: url, body: body);
  }else{
    _showFailedLogs(statusCode: statusCode, url: url, body: body);
  }

}

void _showSuccessLogs({
  required int statusCode,
  required String url,
  required String body,
}) {
  log(
    '$statusCode \n$url \n$body',
    name: 'HTTP Helper',
    level: 500,
  );
}

void _showFailedLogs({
  required int statusCode,
  required String url,
  required String body,
}) {
  log(
    '$statusCode \n$url \n$body',
    name: 'HTTP Helper',
    level: 900,
  );
}
