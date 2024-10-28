// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../model/AuthModel.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  // URL will be the endpoint for the API

  // For GET API => This function handles the request of all GET APIs
  @override
  Future<AuthModel> getGetApiResponse(String url) async {
    // You provide this String URL and the rest is handled by this function

    dynamic responseJson; // Local variable for the response
    try {
      // Send the GET request and await the response
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));

      // Handle the response using returnResponse
      responseJson = returnResponse(response);

      // Parse the response into an AuthModel
      Map<String, dynamic> jsonMap = responseJson;
      AuthModel authModel = AuthModel.fromJson(jsonMap);
      if (authModel.data != null) {
        for (var messageData in authModel.data!) {
          print('ID: ${messageData.id}');
          print('Message: ${messageData.message}');
          print('Time: ${messageData.time}');
          print('------------------------');
        }
      }

      // Return the parsed model
      return authModel;
    } on SocketException {
      // Handle no internet scenario
      throw FetchDataException("No Internet Connection");
    }
  }

  // For POST API => In POST, we send data to the server
  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      // Send POST request with body data
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(data), // Convert data to JSON
        headers: {"Content-Type": "application/json"}, // Set headers
      ).timeout(Duration(seconds: 10));

      // Handle the response using returnResponse
      responseJson = returnResponse(response);
    } on SocketException {
      // Handle no internet scenario
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  // This function handles various status codes and returns appropriate responses
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      // If status code is 200, return the decoded response
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      // Handle bad request (status code 400)
        throw BadRequestException(response.body.toString());
      case 404:
      // Handle unauthorized (status code 404)
        throw UnauthorisedException(response.body.toString());
      default:
      // Handle any other status code
        throw FetchDataException(
            "Error occurred while communicating with server, status code: ${response.statusCode}");
    }
  }
}
