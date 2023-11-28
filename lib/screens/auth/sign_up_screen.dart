import 'package:ca_services/common/common.dart';
import 'package:ca_services/data/remote_services/models/user_register_model.dart';
import 'package:ca_services/screens/auth/auth_bloc/auth_event.dart';
import 'package:ca_services/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/remote_services/models/get_city_list_response_model.dart';
import '../../data/remote_services/models/get_state_list_response_model.dart' as stateRes;
import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  UserRegisterRequestModel userRegisterRequestModel =
      UserRegisterRequestModel();
  final AuthBloc _authBloc = AuthBloc();
  final AuthBloc _stateBloc = AuthBloc();
  final AuthBloc _cityBloc = AuthBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _isCitySelected = false;
  bool _isStateSelected = false;
  Data? _selectedCity;
  stateRes.Data? _selectedState;
  List<String> cityList = ["Select", "Test"];
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _stateBloc.add(GetStateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Text("Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 36)),
                      TextButton(
                          onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LogInScreen()));
                      }, child:  Row(
                        children: [
                          const Icon(Icons.arrow_back,color: Color(0xFF149EEA),size: 20),
                          Text("Back",style: GoogleFonts.archivo(color: const Color(0xFF149EEA)),)
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z\s]')), // Only allow letters and spaces
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "First name",
                      hintStyle: const TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled:
                          true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    ),
                    onChanged: (value) {
                      userRegisterRequestModel.firstName = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z\s]')), // Only allow letters and spaces
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Last name",
                      hintStyle: const TextStyle(color:  Colors.black54),
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
                      userRegisterRequestModel.lastName = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r'\s')), // Disallow spaces
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(color:  Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled:
                          true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    ),
                    onChanged: (value) {
                      userRegisterRequestModel.email = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
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
                      hintStyle: const TextStyle(color:  Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled:
                          true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    ),
                    onChanged: (value) {
                      userRegisterRequestModel.mobile = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Gender',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:  Colors.black),
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'male',
                            fillColor: const MaterialStatePropertyAll(Color(0xFF149EEA),),
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              userRegisterRequestModel.gender = value;
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          const Text(
                            'Male',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Radio<String>(
                            fillColor: const MaterialStatePropertyAll(Color(0xFF149EEA),),
                            value: 'female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              userRegisterRequestModel.gender = value;
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          const Text(
                            'Female',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Radio<String>(
                            fillColor: const MaterialStatePropertyAll(Color(0xFF149EEA),),
                            value: 'other',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              userRegisterRequestModel.gender = value;
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          const Text(
                            'Other',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: const TextStyle(color: Colors.black54),
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
                      userRegisterRequestModel.address = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    bloc: _stateBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is StateLoadingState) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Color(0xFF149EEA),
                        ));
                      } else if (state is StateSuccessState) {
                        return Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: DropdownButton<stateRes.Data>(
                              underline: Container(),
                              isExpanded: true,
                              value: _selectedState,
                              hint: const Text(
                                "Select State",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              icon: const Icon(
                                Icons
                                    .arrow_drop_down, // You can change the icon as needed
                                color: Colors.black54, // Change the color of the dropdown icon here
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedState = newValue!;
                                  userRegisterRequestModel.state = newValue.id;
                                  _cityBloc.add(GetCityEvent(_selectedState?.id));
                                  _selectedCity = null;
                                  if (_selectedState != null) {
                                    _isStateSelected = false;
                                  } else {
                                    _isStateSelected = true;
                                  }
                                });
                              },
                              items: state.getStateListResponseModel.data?.reversed
                                  .map((value) {
                                return DropdownMenuItem<stateRes.Data>(
                                  value: value,
                                  child: Text(
                                    value.name ?? '',
                                    style: const TextStyle(
                                      color: Colors.black, // Change the color of the selected value here
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Visibility(
                      visible: _isStateSelected,
                      child: const Text(
                        "Please select state",
                        style: TextStyle(color: Colors.red),
                      )),

                  BlocConsumer<AuthBloc, AuthState>(
                    bloc: _cityBloc,
                    listener: (context, state) {
                    },
                    builder: (context, state) {
                      if(state is StateLoadingState){
                        return const Center(child: CircularProgressIndicator(color: Color(0xFF149EEA)),);
                      }else if(state is CitySuccessState){
                        return Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: DropdownButton<Data>(
                                  icon: const Icon(
                                    Icons
                                        .arrow_drop_down, // You can change the icon as needed
                                    color: Colors.black54, // Change the color of the dropdown icon here
                                  ),
                                  underline: Container(),
                                  isExpanded: true,
                                  value: _selectedCity,
                                  hint: const Text("Select City",style: TextStyle(color:Colors.black54),),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedCity = newValue!;
                                      userRegisterRequestModel.city = newValue.id;
                                      if (_selectedCity != null) {
                                        _isCitySelected = false;
                                      } else {
                                        _isCitySelected = true;
                                      }

                                    });
                                  },
                                  items: state.getCityListResponseModel.data?.map((value) {
                                    return DropdownMenuItem<Data>(
                                      value: value,
                                      child: Text(
                                        value.name ?? "",
                                        style: const TextStyle(
                                          color: Colors.black, // Change the color of the selected value here
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),

                          ],
                        );
                      }else{
                    return Container();}
                    },
                  ),

                  Visibility(
                      visible: _isCitySelected,
                      child: const Text(
                        "Please select city",
                        style: TextStyle(color: Colors.red),
                      )),
                  const SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      hintStyle: const TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
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
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      userRegisterRequestModel.password = value;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter confirm password';
                      }
                      if(userRegisterRequestModel.password != null){
                        if(value != userRegisterRequestModel.password){
                          return 'Confirm password not match';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    bloc: _authBloc,
                    listener: (context, state) {
                     if(state is AuthErrorState){
                       Common.flushBarErrorMassage(state.message, context);
                     }
                     if(state is AuthSuccessState){
                       Common.flushBarSuccessMassage(state.userRegisterResponseModel.message ?? "", context);

                       Future.delayed(const Duration(seconds: 2)).then((value){
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LogInScreen()));
                       });
                     }
                    },
                    builder: (context, state) {
                      if(state is AuthLoadingState){
                        return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
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
                                if(_selectedGender == null){
                                  Common.flushBarErrorMassage("Please Select Gender", context);
                                  return;
                                }
                                if(_selectedState == null){
                                  Common.flushBarErrorMassage("Please Select State", context);
                                  return;
                                }
                                if(_selectedCity == null){
                                  Common.flushBarErrorMassage("Please Select City", context);
                                  return;
                                }
                                _authBloc.add(
                                    SignUpSubmitEvent(userRegisterRequestModel));
                              }
                            },
                            child: const Text("Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20))),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const LogInScreen()));
                      },
                      child: const Row(
                        children: [
                          Text("If you already have account please",
                              style: TextStyle(color: Colors.black, fontSize: 16)),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            " Sign In.",
                            style: TextStyle(
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
