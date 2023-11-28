
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

import '../../repository/auth_repo/auth_repo.dart';

class AuthUseCase {
  final AuthRepo _authRepoImp;

  AuthUseCase({required AuthRepo authRepoImp}) : _authRepoImp = authRepoImp;

  Future<UserRegisterResponseModel> signUpUser(UserRegisterRequestModel registerFormModel) {
    return _authRepoImp.signUpUser(registerFormModel);
  }

  Future<SignInResponseModel> signInUser(SignInRequestModel signInRequestModel) {
    return _authRepoImp.signInUser(signInRequestModel);
  }

  Future<LogInWithGoogleResponseModel> logInWithGoogle(LogInWithGoogleRequestModel logInWithGoogleRequestModel) {
    return _authRepoImp.logInWithGoogle(logInWithGoogleRequestModel);
  }

  Future<GetStateListResponseModel> getStates() {
    return _authRepoImp.getStates();
  }

  Future<GetCityListResponseModel> getCities(String stateId) {
    return _authRepoImp.getCities(stateId);
  }

  Future<GetProfileResponseModel> getProfile() {
    return _authRepoImp.getProfile();
  }

  Future<UpdateProfileResponseModel> updateProfile(UserRegisterRequestModel updateProfileRequestModel) {
    return _authRepoImp.updateProfile(updateProfileRequestModel);
  }

  Future<ChangePasswordResponseModel> changePassword(ChangePasswordRequestModel changePasswordRequestModel) {
    return _authRepoImp.changePassword(changePasswordRequestModel);
  }
}
