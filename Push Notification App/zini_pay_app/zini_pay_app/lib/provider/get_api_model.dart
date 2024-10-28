import 'package:flutter/cupertino.dart';

import '../data/network/network_api_services.dart';
import '../model/AuthModel.dart';

class GetApiModel with ChangeNotifier {
  AuthModel? _authModel;

  AuthModel? get authModel => _authModel;

  Future<void> fetchAuthData(String url) async {
    try {
      _authModel = await NetworkApiServices().getGetApiResponse(url);
      notifyListeners(); // Notifies any listening widgets
    } catch (error) {
      print('Error fetching data: $error');
    }
  }


  Future<void> getApi() async {
    final networkAPiService = NetworkApiServices();
    const String url = 'https://demo.zinipay.com/sms';
    await networkAPiService.getGetApiResponse(url);

    notifyListeners();
  }
}
