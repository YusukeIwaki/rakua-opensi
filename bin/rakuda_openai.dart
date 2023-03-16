import 'package:rakuda/rakuda.dart';
import 'dart:io';

Future<Response> auth(PerformRequest performRequest, Request request) async {
  String? apiKey = Platform.environment['OPENAI_API_KEY'];
  if (apiKey == null) {
    throw Exception('OPENAI_API_KEY is not set');
  }
  request.setHeader('Authorization', 'Bearer $apiKey');
  return performRequest(request);
}

Future<void> main(List<String> arguments) async {
  createJSONClient(
    arguments,
    baseURL: 'https://api.openai.com/v1',
    interceptors: [auth],
  );
}
