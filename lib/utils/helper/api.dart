import 'dart:convert';
import 'package:egitimax/utils/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {

  static Future<dynamic> request(String path,
      {Map<String, String>? headers, HttpMethod method = HttpMethod.get, dynamic data}) async {
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
      if (Constants.apiDebugPrintExceptionActive == 1) {
        debugPrint('Error: $e');
      }
      result = null;
    }

    if(Constants.apiDebugPrintActive==1)
      {
        Map<String,dynamic> showInfoRequestInfo={};

        showInfoRequestInfo['Path']=path;
        showInfoRequestInfo['Headers']=headers;
        showInfoRequestInfo['HttpMethod']=method;
        showInfoRequestInfo['Data']=data;
        showInfoRequestInfo['Response']=result;

        debugPrint('$showInfoRequestInfo');
      }
    return result;
  }

  static Future<dynamic> _get(String path, {Map<String, String>? headers}) async {
    headers ??= _generateBasicAuthHeaders();
    final response = await http.get(Uri.parse(Constants.apiBaseUrl + path), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if(Constants.apiDebugPrintExceptionActive==1)
      {
        final errorMessage = 'Failed to get data - ${response.statusCode}: ${response.body}';
        debugPrint(errorMessage);
      }
      return null;
    }
  }

  static Future<dynamic> _post(String path, dynamic data, {Map<String, String>? headers}) async {
    headers ??= _generateBasicAuthHeaders();
    final response = await http.post(Uri.parse(Constants.apiBaseUrl + path), headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if(Constants.apiDebugPrintExceptionActive==1)
      {
        final errorMessage = 'Failed to post data - ${response.statusCode}: ${response.body}';
        debugPrint(errorMessage);
      }
      return null;
    }
  }

  static Future<dynamic> _put(String path, dynamic data, {Map<String, String>? headers}) async {
    headers ??= _generateBasicAuthHeaders();
    final response = await http.put(Uri.parse(Constants.apiBaseUrl + path), headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if(Constants.apiDebugPrintExceptionActive==1)
      {
        final errorMessage = 'Failed to put data - ${response.statusCode}: ${response.body}';
        debugPrint(errorMessage);
      }
      return null;
    }
  }

  static Future<dynamic> _delete(String path, {Map<String, String>? headers}) async {
    headers ??= _generateBasicAuthHeaders();
    final response = await http.delete(Uri.parse(Constants.apiBaseUrl + path), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if(Constants.apiDebugPrintExceptionActive==1)
      {
        final errorMessage = 'Failed to delete data - ${response.statusCode}: ${response.body}';
        debugPrint(errorMessage);
      }
      return null;
    }
  }

  static Map<String, String> _generateBasicAuthHeaders() {
    String basicAuth = 'Basic ${base64Encode(utf8.encode('${Constants.apiUsername}:${Constants.apiPassword}'))}';
    return {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': basicAuth
    };
  }
}

enum HttpMethod { get, post, put, delete }
