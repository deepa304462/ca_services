
import 'package:ca_services/data/remote_services/requests/change_password_request_model.dart';
import 'package:ca_services/data/remote_services/requests/sign_in_request_model.dart';

import '../../../data/remote_services/models/user_register_model.dart';

abstract class AuthEvent {}

class SignUpSubmitEvent extends AuthEvent{
  final UserRegisterRequestModel registerRequestModel;

  SignUpSubmitEvent(this.registerRequestModel);
}

class SignInSubmitEvent extends AuthEvent{
  final SignInRequestModel signInRequestModel;

  SignInSubmitEvent(this.signInRequestModel);
}

class GoogleSignInSubmitEvent extends AuthEvent{


  GoogleSignInSubmitEvent();
}

class GetStateEvent extends AuthEvent{


}


class GetCityEvent extends AuthEvent{
final stateId;

GetCityEvent(this.stateId);

}

class GetProfileEvent extends AuthEvent{


}

class UpdateProfileEvent extends AuthEvent{

  final UserRegisterRequestModel updateProfileRequestModel;
  UpdateProfileEvent(this.updateProfileRequestModel);
}

class ChangePasswordEvent extends AuthEvent{

  final ChangePasswordRequestModel changePasswordRequestModel;
  ChangePasswordEvent(this.changePasswordRequestModel);
}


