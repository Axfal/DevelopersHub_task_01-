// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/state_model.dart';
import 'app_url.dart';

class FetchServices {
  Future<StatesModel> fetchRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return StatesModel.fromJson(data);
    } else {
      print('error occur');
      throw Exception('error');
    }
  }

  Future<List<dynamic>> fetchCountry() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('error');
    }
  }
}