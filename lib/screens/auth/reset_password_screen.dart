import 'package:ca_services/common/common.dart';
import 'package:ca_services/data/remote_services/requests/change_password_request_model.dart';
import 'package:ca_services/screens/auth/auth_bloc/auth_event.dart';
import 'package:ca_services/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_state.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPassword = TextEditingController();
  final AuthBloc _authBloc = AuthBloc();
  ChangePasswordRequestModel changePasswordRequestModel = ChangePasswordRequestModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F8),
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MyBottomNavigation()));
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back,
                          color: Color(0xFF149EEA), size: 20),
                      Text(
                        "Back",
                        style: GoogleFonts.archivo(
                            color: const Color(0xFF149EEA)),
                      )
                    ],
                  )),
              const SizedBox(height: 150,),
              TextFormField(
                controller: _oldPassword,
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your old Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter old password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 6),
                ),
                onChanged: (value) {
                  changePasswordRequestModel.oldPassword = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your new Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter new password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 6),
                ),
                onChanged: (value) {
                  changePasswordRequestModel.newPassword = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your confirm Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter confirm password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 6),
                ),
                onChanged: (value) {
                  changePasswordRequestModel.confirmPassword = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                bloc: _authBloc,
                listener: (context, state) {
                  if(state is AuthErrorState){
                    Common.flushBarErrorMassage(state.message, context);
                  }else if (state is ChangePasswordSuccessState){
                    Common.flushBarSuccessMassage(state.changePasswordResponseModel.message ?? "", context);
                  }
                },
                builder: (context, state) {
                  if(state is AuthLoadingState){
                    return const Center(child: CircularProgressIndicator(color:  Color(0xFF149EEA),),);
                  }
                  return ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF149EEA),
                          ),
                          fixedSize: MaterialStatePropertyAll(Size(200, 40))),
                      onPressed: () {
                        _authBloc.add(
                            ChangePasswordEvent(changePasswordRequestModel));
                      },
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ));
                },
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        )
        ],
      ),
    );
  }
}
