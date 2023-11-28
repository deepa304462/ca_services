
import 'package:ca_services/data/remote_services/requests/change_password_request_model.dart';
import 'package:ca_services/data/remote_services/requests/log_in_with_google_request_model.dart';
import 'package:ca_services/data/remote_services/requests/sign_in_request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../business_logic/use_case/auth_use_case/auth_use_case.dart';
import '../../../data/remote_services/models/user_register_model.dart';
import '../../../data/repository/auth_repo_imp/auth_repo_imp.dart';
import '../../../res/strings.dart';
import '../../../utils/utils.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase = AuthUseCase(authRepoImp: AuthRepoImp());
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<SignUpSubmitEvent>((event, emit) async {
      await signUpUser(event.registerRequestModel);
    });

    on<SignInSubmitEvent>((event, emit) async {
      await signInUser(event.signInRequestModel);
    });

    on<GoogleSignInSubmitEvent>((event, emit) async {
      await googleLogin();
    });

    on<GetStateEvent>((event, emit) async {
      await getStates();
    });


    on<GetCityEvent>((event, emit) async {
      await getCities(event.stateId);
    });

    on<GetProfileEvent>((event, emit) async {
      await getProfile();
    });

    on<UpdateProfileEvent>((event, emit) async {
      await updateProfile(event.updateProfileRequestModel);
    });

    on<ChangePasswordEvent>((event, emit) async {
      await changePassword(event.changePasswordRequestModel);
    });



  }


  signUpUser(UserRegisterRequestModel registerRequestModel) async{
    emit(AuthLoadingState());

    try{
      var data = await _authUseCase.signUpUser(registerRequestModel);
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            emit(AuthSuccessState(data));
          } else {
            emit(AuthErrorState(data.message));
          }
        } else {
          emit(AuthErrorState(data.message));
        }
      } else {
        emit(AuthErrorState("Server error !!!"));
      }

    }catch(e){
      emit(AuthErrorState("Something went wrong !"));
    }
  }

  signInUser(SignInRequestModel signInRequestModel) async{
    emit(AuthLoadingState());

    try{
      var data = await _authUseCase.signInUser(signInRequestModel);
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            saveToSharedPreference(userToken, data.data?.token ?? '');
            saveToSharedPreference(isLoggedIn, true);
            emit(AuthSignInSuccessState(data));
          } else {
            emit(AuthErrorState(data.message));
          }
        } else {
          emit(AuthErrorState(data.message));
        }
      } else {
        emit(AuthErrorState("Server error !!!"));
      }

    }catch(e){
      emit(AuthErrorState("Something went wrong !"));
    }
  }
  Future googleLogin() async {
    emit(AuthLoadingState());

    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      emit(AuthInitial());

      if (user != null) {
        LogInWithGoogleRequestModel logInWithGoogleRequestModel = LogInWithGoogleRequestModel(
            authFrom: "google",
            email: user.email,
            name: user.displayName,
            profilePic: user.photoURL,
            authId: user.uid);
        socialLogin(logInWithGoogleRequestModel);
      } else {
        emit(AuthInitial());
      }
      // for go to the HomePage screen
    } else {
      emit(AuthInitial());
    }
  }

  socialLogin(LogInWithGoogleRequestModel logInWithGoogleRequestModel) async{
    emit(AuthLoadingState());

    try{
      var data = await _authUseCase.logInWithGoogle(logInWithGoogleRequestModel);
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            saveToSharedPreference(userToken, data.data?.token ?? '');
            saveToSharedPreference(isLoggedIn, true);
            emit(AuthGoogleSignInSuccessState(data));
          } else {
            emit(AuthErrorState(data.message));
          }
        } else {
          emit(AuthErrorState(data.message));
        }
      } else {
        emit(AuthErrorState("Server error !!!"));
      }

    }catch(e){
      emit(AuthErrorState("Something went wrong !"));
    }
  }


    getStates() async{
    emit(StateLoadingState());

    try{
      var data = await _authUseCase.getStates();
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            emit(StateSuccessState(data));
          } else {
            emit(StateErrorState(data.message));
          }
        } else {
          emit(StateErrorState(data.message));
        }
      } else {
        emit(StateErrorState("Server error !!!"));
      }

    }catch(e){
      emit(StateErrorState("Something went wrong !"));
    }


  }


  getCities(String stateId) async{
    emit(StateLoadingState());

    try{
      var data = await _authUseCase.getCities(stateId);
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            emit(CitySuccessState(data));
          } else {
            emit(StateErrorState(data.message));
          }
        } else {
          emit(StateErrorState(data.message));
        }
      } else {
        emit(StateErrorState("Server error !!!"));
      }

    }catch(e){
      emit(StateErrorState("Something went wrong !"));
    }
  }


  getProfile() async{
    emit(AuthLoadingState());
    try{
      var data = await _authUseCase.getProfile();
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            emit(GetProfileSuccessState(data));
          } else {
            emit(StateErrorState(data.message));
          }
        } else {
          emit(StateErrorState(data.message));
        }
      } else {
        emit(StateErrorState("Server error !!!"));
      }

    }catch(e){
      emit(StateErrorState("Something went wrong !"));
    }
  }


  updateProfile(UserRegisterRequestModel updateProfileRequestModel) async{
    emit(AuthLoadingState());

    try{
      var data = await _authUseCase.updateProfile(updateProfileRequestModel);
      if (data.status != null) {
        if (data.status!) {
          if (data.data != null) {
            emit(UpdateProfileSuccessState(data));
          } else {
            emit(AuthErrorState(data.message));
          }
        } else {
          emit(AuthErrorState(data.message));
        }
      } else {
        emit(AuthErrorState("Server error !!!"));
      }

    }catch(e){
      emit(AuthErrorState("Something went wrong !"));
    }
  }

  changePassword(ChangePasswordRequestModel changePasswordRequestModel) async{
    emit(AuthLoadingState());

    try{
      var data = await _authUseCase.changePassword(changePasswordRequestModel);
      if (data.status != null) {
        if (data.status!) {
          if (data.message != null) {
            emit(ChangePasswordSuccessState(data));
          } else {
            emit(AuthErrorState(data.message));
          }
        } else {
          emit(AuthErrorState(data.message));
        }
      } else {
        emit(AuthErrorState("Server error !!!"));
      }

    }catch(e){
      emit(AuthErrorState("Something went wrong !"));
    }
  }
}
