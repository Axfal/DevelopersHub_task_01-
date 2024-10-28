import '../components/api_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.authUrl, data);
      return response;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          ApiUrl.registerApiEndPoint, data);
      return response;
    } catch (error) {
      throw error;
    }
  }
}
