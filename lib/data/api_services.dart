import 'dart:convert';
import 'dart:io';
import 'package:ca_services/data/remote_services/models/change_password_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_city_list_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_profile_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_service_response.dart';
import 'package:ca_services/data/remote_services/models/get_state_list_response_model.dart';
import 'package:ca_services/data/remote_services/models/log_in_with_google_response_model.dart';
import 'package:ca_services/data/remote_services/models/notification_response.dart';
import 'package:ca_services/data/remote_services/models/register_response.dart';
import 'package:ca_services/data/remote_services/models/sign_in_response_model.dart';
import 'package:ca_services/data/remote_services/models/update_profile_response_model.dart';
import 'package:ca_services/data/remote_services/models/user_register_model.dart';
import 'package:ca_services/data/remote_services/requests/change_password_request_model.dart';
import 'package:ca_services/data/remote_services/requests/log_in_with_google_request_model.dart';
import 'package:ca_services/data/remote_services/requests/sign_in_request_model.dart';
import 'package:ca_services/screens/home/bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/strings.dart';
import 'adstract_services/remote_services.dart';
import 'constants/remote_urls.dart';
import 'network_utils.dart';

class ApiService extends RemoteDataService {
  @override
  Future<UserRegisterResponseModel> signUpUser(
      UserRegisterRequestModel registerFormModel) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.signUpUser);
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey
    };
    final requestBody = registerFormModel.toJson();

    final json = await NetworkUtils.post(url, headers: headers, body: requestBody);

    UserRegisterResponseModel model = UserRegisterResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<SignInResponseModel> signInUser(
      SignInRequestModel signInRequestModel) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.signInUser);
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey
    };
    final requestBody = signInRequestModel.toJson();

    final json = await NetworkUtils.post(url, headers: headers, body: requestBody);

    SignInResponseModel model = SignInResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<LogInWithGoogleResponseModel> logInWithGoogle(
      LogInWithGoogleRequestModel logInWithGoogleRequestModel) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.googleSignIn);
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey
    };
    final requestBody = logInWithGoogleRequestModel.toJson();

    final json = await NetworkUtils.post(url, headers: headers, body: requestBody);

    LogInWithGoogleResponseModel model = LogInWithGoogleResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<GetStateListResponseModel> getStates() async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.getState);
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey
    };

    final json = await NetworkUtils.get(url, headers: headers);

    GetStateListResponseModel model = GetStateListResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<GetCityListResponseModel> getCities(String stateId) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.getCity+stateId);
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey
    };

    final json = await NetworkUtils.get(url, headers: headers);

    GetCityListResponseModel model = GetCityListResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<GetProfileResponseModel> getProfile() async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.getProfile);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey,
      'Authorization': 'Bearer ${preferences.getString(userToken)}',
    };

    final json = await NetworkUtils.get(url, headers: headers);

    GetProfileResponseModel model = GetProfileResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<UpdateProfileResponseModel> updateProfile(
      UserRegisterRequestModel updateProfileRequestModel) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.updateProfile);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey,
      'Authorization': 'Bearer ${preferences.getString(userToken)}',
    };
    final requestBody = updateProfileRequestModel.toJson();

    final json = await NetworkUtils.post(url, headers: headers, body: requestBody);

    UpdateProfileResponseModel model = UpdateProfileResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<GetServiceResponse> getServices() async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.getServices);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey,
      'Authorization': 'Bearer ${preferences.getString(userToken)}',
    };

    final json = await NetworkUtils.get(url, headers: headers);

    GetServiceResponse model = GetServiceResponse.fromJson(json);

    return model;
  }

  @override
  Future<ChangePasswordResponseModel> changePassword(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.changePassword);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey,
      'Authorization': 'Bearer ${preferences.getString(userToken)}',
    };
    final requestBody = changePasswordRequestModel.toJson();

    final json = await NetworkUtils.post(url, headers: headers, body: requestBody);

    ChangePasswordResponseModel model = ChangePasswordResponseModel.fromJson(json);

    return model;
  }

  @override
  Future<dynamic> serviceRequest(String serviceId) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.serviceRequest);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey,
      'Authorization': 'Bearer ${preferences.getString(userToken)}',
    };
    Map<String, String> data = {
      "service_id" : serviceId
    };

    final json = await NetworkUtils.post(url, headers: headers, body: data);
    return json;
  }

  @override
  Future<NotificationResponse> getNotification() async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.getNotification);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey,
      'Authorization': 'Bearer ${preferences.getString(userToken)}',
    };

    final json = await NetworkUtils.get(url, headers: headers);

    NotificationResponse model = NotificationResponse.fromJson(json);

    return model;
  }

  @override
  Future<dynamic> updateFCM(String fcmToken) async {
    final url = Uri.https(RemoteUrls.baseURL, RemoteUrls.updateFCM);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final headers = {
      HttpHeaders.contentTypeHeader: contentType,
      "x-api-key": xApiKey,
      'Authorization': 'Bearer ${preferences.getString(userToken)}',
    };
    Map<String, String> data = {
      "token" : fcmToken
    };

    final json = await NetworkUtils.post(url, headers: headers, body: data);
    return json;
  }


}


