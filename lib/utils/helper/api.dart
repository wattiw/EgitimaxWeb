import 'dart:convert';

import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> request(String path,
      {Map<String, String>? headers,
      HttpMethod method = HttpMethod.get,
      dynamic data}) async {
    dynamic result;

    try {
      switch (method) {
        case HttpMethod.get:
          result = await _get(path, headers: headers);
          break;
        case HttpMethod.post:
          result = await _post(path, data, headers: headers);
          break;
        case HttpMethod.put:
          result = await _put(path, data, headers: headers);
          break;
        case HttpMethod.delete:
          result = await _delete(path, headers: headers);
          break;
      }
    } catch (e) {
      if (AppConstants.apiDebugPrintExceptionActive == 1) {
        debugPrint('Error: $e');
      }
      result = null;
    }

    if (AppConstants.apiDebugPrintActive == 1) {
      Map<String, dynamic> showInfoRequestInfo = {};

      showInfoRequestInfo['Path'] = path;
      showInfoRequestInfo['Headers'] = headers;
      showInfoRequestInfo['HttpMethod'] = method;
      showInfoRequestInfo['Data'] = data;
      showInfoRequestInfo['Response'] = result;

      debugPrint('$showInfoRequestInfo');
    }
    return result;
  }

  static Future<dynamic> _get(String path,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic data;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.get(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers);
      data = handleResponse(response);
    } catch (e) {
      if (e is HttpException) {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('HttpException: Code ${e.statusCode} - ${e.message}');
        }
        if (AppConstants.apiDebugPrintActive == 1) {
          debugPrint('Data: ${response.body}');
        }
      } else {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('An unexpected error occurred: $e');
        }
      }
    } finally {}
    return data;
  }

  static Future<dynamic> _post(String path, dynamic data,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic data;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.post(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers, body: jsonEncode(data));
      data = handleResponse(response);
    } catch (e) {
      if (e is HttpException) {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('HttpException: Code ${e.statusCode} - ${e.message}');
        }
        if (AppConstants.apiDebugPrintActive == 1) {
          debugPrint('Data: ${response.body}');
        }
      } else {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('An unexpected error occurred: $e');
        }
      }
    } finally {}
    return data;
  }

  static Future<dynamic> _put(String path, dynamic data,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic data;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.put(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers, body: jsonEncode(data));
      data = handleResponse(response);
    } catch (e) {
      if (e is HttpException) {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('HttpException: Code ${e.statusCode} - ${e.message}');
        }
        if (AppConstants.apiDebugPrintActive == 1) {
          debugPrint('Data: ${response.body}');
        }
      } else {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('An unexpected error occurred: $e');
        }
      }
    } finally {}
    return data;
  }

  static Future<dynamic> _delete(String path,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic data;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.delete(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers);
      data = handleResponse(response);
    } catch (e) {
      if (e is HttpException) {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('HttpException: Code ${e.statusCode} - ${e.message}');
        }
        if (AppConstants.apiDebugPrintActive == 1) {
          debugPrint('Data: ${response.body}');
        }
      } else {
        if (AppConstants.apiDebugPrintExceptionActive == 1) {
          debugPrint('An unexpected error occurred: $e');
        }
      }
    } finally {}
    return data;
  }

  static Map<String, String> _generateBasicAuthHeaders() {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('${AppConstants.apiUsername}:${AppConstants.apiPassword}'))}';
    return {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': basicAuth
    };
  }
}

enum HttpMethod { get, post, put, delete }

class HttpException implements Exception {
  final int statusCode;
  final String message;

  HttpException(this.statusCode, this.message);

  @override
  String toString() {
    return 'HttpException: $statusCode - $message';
  }
}

dynamic handleResponse(http.Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw HttpException(response.statusCode, response.body);
  }
}
