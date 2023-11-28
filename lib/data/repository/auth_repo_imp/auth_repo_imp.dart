
import 'package:ca_services/data/remote_services/models/change_password_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_city_list_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_profile_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_state_list_response_model.dart';
import 'package:ca_services/data/remote_services/models/update_profile_response_model.dart';
import 'package:ca_services/data/remote_services/requests/change_password_request_model.dart';
import 'package:ca_services/data/remote_services/requests/log_in_with_google_request_model.dart';
import 'package:ca_services/data/remote_services/models/log_in_with_google_response_model.dart';
import 'package:ca_services/data/remote_services/models/register_response.dart';
import 'package:ca_services/data/remote_services/requests/sign_in_request_model.dart';
import 'package:ca_services/data/remote_services/models/sign_in_response_model.dart';

import 'package:ca_services/data/remote_services/models/user_register_model.dart';

import '../../../business_logic/repository/auth_repo/auth_repo.dart';
import '../../adstract_services/remote_services.dart';
import '../../api_services.dart';

class AuthRepoImp extends AuthRepo{
  final RemoteDataService _service = ApiService();

  @override
  Future<UserRegisterResponseModel> signUpUser(UserRegisterRequestModel registerRequestModel) {
    return _service.signUpUser(registerRequestModel);
  }

  @override
  Future<SignInResponseModel> signInUser(SignInRequestModel signInRequestModel) {
    return _service.signInUser(signInRequestModel);
  }

  @override
  Future<LogInWithGoogleResponseModel> logInWithGoogle(LogInWithGoogleRequestModel logInWithGoogleRequestModel) {
    return _service.logInWithGoogle(logInWithGoogleRequestModel);
  }

  @override
  Future<GetStateListResponseModel> getStates() {
   return _service.getStates();
  }

  @override
  Future<GetCityListResponseModel> getCities(String stateId) {
    return _service.getCities(stateId);
  }

  @override
  Future<GetProfileResponseModel> getProfile() {
    return _service.getProfile();
  }

  @override
  Future<UpdateProfileResponseModel> updateProfile(UserRegisterRequestModel updateProfileRequestModel) {
    return _service.updateProfile(updateProfileRequestModel);
  }

  @override
  Future<ChangePasswordResponseModel> changePassword(ChangePasswordRequestModel changePasswordRequestModel) {
    return _service.changePassword(changePasswordRequestModel);
  }



}