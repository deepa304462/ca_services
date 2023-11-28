

import 'package:ca_services/data/remote_services/models/change_password_response_model.dart';
import 'package:ca_services/data/remote_services/models/update_profile_response_model.dart';

import '../../../data/remote_services/models/get_city_list_response_model.dart';
import '../../../data/remote_services/models/get_profile_response_model.dart';
import '../../../data/remote_services/models/get_state_list_response_model.dart';
import '../../../data/remote_services/models/log_in_with_google_response_model.dart';
import '../../../data/remote_services/models/register_response.dart';
import '../../../data/remote_services/models/sign_in_response_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState{}

class StateLoadingState extends AuthState{}

class AuthErrorState extends AuthState {
  final message;

  AuthErrorState(this.message);
}

class StateErrorState extends AuthState {
  final message;

  StateErrorState(this.message);
}




class AuthSuccessState extends AuthState {
  final UserRegisterResponseModel userRegisterResponseModel;

  AuthSuccessState(this.userRegisterResponseModel);
}

class AuthSignInSuccessState extends AuthState {
  final SignInResponseModel signInResponseModel;

  AuthSignInSuccessState(this.signInResponseModel);
}


class AuthGoogleSignInSuccessState extends AuthState {
  final LogInWithGoogleResponseModel logInWithGoogleResponseModel;

  AuthGoogleSignInSuccessState(this.logInWithGoogleResponseModel);
}

class StateSuccessState extends AuthState {
  final GetStateListResponseModel getStateListResponseModel;

  StateSuccessState(this.getStateListResponseModel);
}


class CitySuccessState extends AuthState {
  final GetCityListResponseModel getCityListResponseModel;

  CitySuccessState(this.getCityListResponseModel);
}


class GetProfileSuccessState extends AuthState {
  final GetProfileResponseModel getProfileResponseModel;

  GetProfileSuccessState(this.getProfileResponseModel);
}

class UpdateProfileSuccessState extends AuthState {
  final UpdateProfileResponseModel updateProfileResponseModel;

  UpdateProfileSuccessState(this.updateProfileResponseModel);
}

class ChangePasswordSuccessState extends AuthState {
  final ChangePasswordResponseModel changePasswordResponseModel;

  ChangePasswordSuccessState(this.changePasswordResponseModel);
}