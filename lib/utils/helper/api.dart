import 'dart:convert';

import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> request(String path,
      {Map<String, String>? headers,
      HttpMethod method = HttpMethod.get,
      dynamic data}) async {

    data=_convertBigIntToString(data);//Çok Önemli
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

      debugPrint("////////////////////////////////////////////////////////////START////////////////////////////////////////////////////////////");
      debugPrint('$showInfoRequestInfo');
      debugPrint("/////////////////////////////////////////////////////////////END/////////////////////////////////////////////////////////////");
    }
    return result;
  }

  static Future<dynamic> _get(String path,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic dataResult;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.get(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers);
      dataResult = handleResponse(response);
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
    return dataResult;
  }

  static Future<dynamic> _post(String path, dynamic data,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic dataResult;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.post(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers, body: jsonEncode(data));
      dataResult = handleResponse(response);
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
    return dataResult;
  }

  static Future<dynamic> _put(String path, dynamic data,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic dataResult;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.put(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers, body: jsonEncode(data));
      dataResult = handleResponse(response);
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
    return dataResult;
  }

  static Future<dynamic> _delete(String path,
      {Map<String, String>? headers}) async {
    http.Response response=http.Response('[{}]',501);
    dynamic dataResult;
    try {
      headers ??= _generateBasicAuthHeaders();
      response = await http.delete(Uri.parse(AppConstants.apiBaseUrl + path),
          headers: headers);
      dataResult = handleResponse(response);
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
    return dataResult;
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

  static dynamic _convertBigIntToString(dynamic data) {
    if (data is Map) {
      return data.map((key, value) {
        if (value is BigInt) {
          return MapEntry(key, value.toString());
        } else if (value is Map) {
          return MapEntry(key, _convertBigIntToString(value));
        } else if (value is List) {
          return MapEntry(key, _convertListBigIntToString(value));
        }
        return MapEntry(key, value);
      });
    } else if (data is List) {
      return _convertListBigIntToString(data);
    }
    return data;
  }

  static List _convertListBigIntToString(List list) {
    return list.map((item) {
      if (item is BigInt) {
        return item.toString();
      } else if (item is Map) {
        return _convertBigIntToString(item);
      } else if (item is List) {
        return _convertListBigIntToString(item);
      }
      return item;
    }).toList();
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


