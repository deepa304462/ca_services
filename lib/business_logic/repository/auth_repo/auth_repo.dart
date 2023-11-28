
import 'package:ca_services/data/remote_services/models/change_password_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_city_list_response_model.dart';
import 'package:ca_services/data/remote_services/models/get_profile_response_model.dart';
import 'package:ca_services/data/remote_services/models/update_profile_response_model.dart';
import 'package:ca_services/data/remote_services/requests/change_password_request_model.dart';
import 'package:ca_services/data/remote_services/requests/log_in_with_google_request_model.dart';
import 'package:ca_services/data/remote_services/models/log_in_with_google_response_model.dart';
import 'package:ca_services/data/remote_services/requests/sign_in_request_model.dart';
import 'package:ca_services/data/remote_services/models/sign_in_response_model.dart';
import 'package:ca_services/data/remote_services/models/user_register_model.dart';

import '../../../data/remote_services/models/get_state_list_response_model.dart';
import '../../../data/remote_services/models/register_response.dart';

abstract class AuthRepo{

  Future<UserRegisterResponseModel> signUpUser(UserRegisterRequestModel registerRequestModel);
  Future<SignInResponseModel> signInUser(SignInRequestModel signInRequestModel);
  Future<LogInWithGoogleResponseModel> logInWithGoogle(LogInWithGoogleRequestModel logInWithGoogleRequestModel);
  Future<GetStateListResponseModel> getStates();

  Future<GetCityListResponseModel> getCities(String stateId);
  Future<GetProfileResponseModel> getProfile();
  Future<UpdateProfileResponseModel> updateProfile(UserRegisterRequestModel updateProfileRequestModel);
  Future<ChangePasswordResponseModel> changePassword(ChangePasswordRequestModel changePasswordRequestModel);
}