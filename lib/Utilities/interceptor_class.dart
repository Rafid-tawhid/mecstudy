import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../DashboardScreen.dart';
import 'Colors.dart';



class ApiService {

  // Create the client with the interceptor
  final client = InterceptedClient.build(interceptors: [
    CustomInterceptor(),
  ]);

  // Method to perform GET request
  Future<dynamic> getData(String endpoint) async {
    try {
      // Perform the GET request
      final response = await client.get(Uri.parse('${AppConstant.BaseUrl}$endpoint'));

      // Handle response based on status code
      if (response.statusCode == 200) {
        // Parse the response body
        final jsonData = jsonDecode(response.body);
        print('Data received: $jsonData');

        return jsonData;
      } else {
        _handleError(response.statusCode, response.body);
        return null;
      }
    } catch (e) {
      // Handle network errors
      print('An error occurred: $e');
      Fluttertoast.showToast(msg: 'Network Error: $e');
      return null;
    }
  }

  Future<dynamic> postData(String endpoint, dynamic body, {Map<String, String>? mainHeader}) async {
    try {
      // Perform the POST request
      debugPrint('URL: ${AppConstant.BaseUrl}$endpoint');

      final response = await client.post(
        Uri.parse('${AppConstant.BaseUrl}$endpoint'),
        headers: (mainHeader==null) ? {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${MainHeaders.token}', // Optional
        }:mainHeader,
        body: jsonEncode(body),
      );

      // Handle response based on status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response body
        final jsonData = jsonDecode(response.body);
        print('Data posted successfully: $jsonData');
        return jsonData;
      } else {
        // Handle non-200 responses
        _handleError(response.statusCode, response.body);
        debugPrint('ERROR : ${response.body}');
        return null;
      }
    } catch (e) {
      // Handle network or other errors
      print('An error occurred: $e');
      Fluttertoast.showToast(msg: 'Network Error: $e');
      return null;
    }
  }

  Future<dynamic> putData(String endpoint, dynamic body) async {
    debugPrint('SEND DATA $body');
    try {
      // Perform the POST request
      debugPrint('URL: ${AppConstant.BaseUrl}$endpoint');

      final response = await client.put(
        Uri.parse('${AppConstant.BaseUrl}$endpoint/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${{MainHeaders.token}}', // Optional
        },
        body: jsonEncode(body),
      );

      // Handle response based on status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response body
        final jsonData = jsonDecode(response.body);
        print('Data posted successfully: $jsonData');
        return jsonData;
      } else {
        // Handle non-200 responses
        _handleError(response.statusCode, response.body);
        return null;
      }
    } catch (e) {
      // Handle network or other errors
      print('An error occurred: $e');
      Fluttertoast.showToast(msg: 'Network Error: $e');
      return null;
    }
  }



  // Error handling based on status code
  void _handleError(int statusCode, String responseBody) {
    switch (statusCode) {
      case 400:
        print("Bad Request: $responseBody");
        Fluttertoast.showToast(msg: "Bad Request: $responseBody");
        break;
      case 401:
        print("Unauthorized Access: $responseBody");
        Fluttertoast.showToast(msg: "Unauthorized Access");
        break;
      case 403:
        print("Forbidden: $responseBody");
        Fluttertoast.showToast(msg: "Forbidden Access");
        break;
      case 404:
        print("Not Found: $responseBody");
        Fluttertoast.showToast(msg: "Resource Not Found");
        break;
      case 500:
        print("Internal Server Error: $responseBody");
        Fluttertoast.showToast(msg: "Internal Server Error");
        break;
      default:
        print("Unhandled Error: $responseBody");
        Fluttertoast.showToast(msg: "Error $statusCode: $responseBody");
        break;
    }
  }
}


class CustomInterceptor implements InterceptorContract {

  @override
  FutureOr<bool> shouldInterceptRequest() {
    // This method indicates whether the request should be intercepted.
    // In most cases, you'd return `true` to always intercept.
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    // This method indicates whether the response should be intercepted.
    // In most cases, you'd return `true` to always intercept.
    return true;
  }

  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    // Add Bearer {MainHeaders.token} to the headers
    request.headers["Authorization"] = "Bearer ${MainHeaders.token}";

    // Optionally log the request for debugging
    print("Request URL: ${request.url}");
    print("Request Headers: ${request.headers}");

    // Return the request after modification
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    // Optionally log the response for debugging
    print("Response Status Code: ${response.statusCode}");
    print("Response Headers: ${response.headers}");

    // You can handle specific status codes here (e.g., token expiration, errors)

    // Return the response after processing
    return response;
  }
}
