import 'package:ca_services/common/common.dart';
import 'package:ca_services/data/remote_services/requests/sign_in_request_model.dart';
import 'package:ca_services/screens/bottom_navigation.dart';
import 'package:ca_services/screens/home/home_page_screen.dart';
import 'package:ca_services/screens/auth/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_event.dart';
import 'auth_bloc/auth_state.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  SignInRequestModel signInRequestModel = SignInRequestModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  final AuthBloc _authBloc = AuthBloc();
  final AuthBloc _googleSignInBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:  Colors.transparent,
      body: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        child: Padding(
          padding: const EdgeInsets.all(  12.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 200),
                  Text("Sign In",
                      style: GoogleFonts.archivo(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 36)),
                  const SizedBox(height: 30),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a phone number.';
                      }
                      final phoneRegex = RegExp(r'^\d{3}-\d{3}-\d{4}$|^\d{10}$');

                      if (!phoneRegex.hasMatch(value!)) {
                        return 'Invalid phone number format.';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Phone No",
                      hintStyle:
                          GoogleFonts.archivo(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled:
                          true, // Set to true to make the background color appear
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    ),
                    onChanged: (value) {
                      signInRequestModel.mobile = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText:
                        !_showPassword, // Toggle the visibility of the password
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle:
                          GoogleFonts.archivo(color:Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled:
                          true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword =
                                !_showPassword; // Toggle the password visibility
                          });
                        },
                        icon: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,
                          color:Colors.black,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      signInRequestModel.password = value;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    bloc: _authBloc,
                    listener: (context, state) {
                      if (state is AuthErrorState) {
                        Common.flushBarErrorMassage(state.message, context);
                      }
                      if (state is AuthSignInSuccessState) {
                        Common.flushBarSuccessMassage(
                            state.signInResponseModel.message ?? "", context);

                        Future.delayed(const Duration(seconds: 2)).then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MyBottomNavigation()));
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF149EEA),
                          ),
                        );
                      }
                      return Center(
                        child: ElevatedButton(
                          style:const ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(
                              Size(200,50)
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF149EEA)
                            )
                          ) ,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _authBloc
                                    .add(SignInSubmitEvent(signInRequestModel));
                              }
                            },
                            child: Text("Login",
                                style: GoogleFonts.archivo(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20))),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Column(
                    children: [
                      BlocConsumer<AuthBloc, AuthState>(
                        bloc: _googleSignInBloc,
                        listener: (context, state) {
                          if (state is AuthErrorState) {
                            Common.flushBarErrorMassage(state.message, context);
                          }
                          if (state is AuthGoogleSignInSuccessState) {
                            Common.flushBarSuccessMassage(
                                state.logInWithGoogleResponseModel.message ?? "", context);

                            Future.delayed(const Duration(seconds: 2)).then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const MyBottomNavigation()));
                            });
                          }
                        },
                        builder: (context, state) {
                          if(state is AuthLoadingState){
                            return const Center(child: CircularProgressIndicator(color:  Color(0xFF149EEA)),);
                          }
                          return Center(
                            child: TextButton(
                              onPressed: () {
                                _googleSignInBloc.add(GoogleSignInSubmitEvent());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/google_icon.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Log in with Google",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignUpScreen()));
                          },
                          child: Row(
                            children: [
                              Text("If you don't have account please",
                                  style: GoogleFonts.archivo(
                                      color: Colors.black, fontSize: 16)),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                " Sign Up.",
                                style: GoogleFonts.archivo(
                                    color: Color(0xFF149EEA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                    decorationColor:  Color(0xFFF07229),
                                    decorationThickness: 1.5,
                                    decorationStyle: TextDecorationStyle.double),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
