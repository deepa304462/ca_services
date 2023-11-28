// ignore_for_file: library_prefixes

import 'package:ca_services/common/common.dart';
import 'package:ca_services/data/remote_services/models/get_profile_response_model.dart';
import 'package:ca_services/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote_services/models/get_city_list_response_model.dart'
    as city;
import '../../data/remote_services/models/get_state_list_response_model.dart'
    as stateRes;
import '../../data/remote_services/models/user_register_model.dart';
import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_event.dart';
import 'auth_bloc/auth_state.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserRegisterRequestModel userRegisterRequestModel =
      UserRegisterRequestModel();
  final AuthBloc _profileBloc = AuthBloc();
  final AuthBloc _updateProfileBloc = AuthBloc();
  final AuthBloc _stateBloc = AuthBloc();
  final AuthBloc _cityBloc = AuthBloc();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _selectedGender;
  bool _isCitySelected = false;
  bool _isStateSelected = false;
  city.Data? _selectedCity;
  stateRes.Data? _selectedState;

  @override
  void initState() {
    super.initState();
    _profileBloc.add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF1F8),
      appBar: AppBar(
        title:   const Text(" Edit Profile",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        backgroundColor:Color(0xFFEAF1F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF149EEA),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const MyBottomNavigation()));
          },
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _profileBloc,
        listener: (context, state) {
          if (state is GetProfileSuccessState) {
            setValueInController(state.getProfileResponseModel);
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF149EEA),
              ),
            );
          } else if (state is GetProfileSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "   First Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        FilteringTextInputFormatter.allow(RegExp(
                            r'[a-zA-Z\s]')), // Only allow letters and spaces
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
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
                        userRegisterRequestModel.firstName = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "   Last Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        FilteringTextInputFormatter.allow(RegExp(
                            r'[a-zA-Z\s]')), // Only allow letters and spaces
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
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
                        userRegisterRequestModel.lastName = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "   Mobile",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allow only digits
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a phone number.';
                        }
                        final phoneRegex =
                            RegExp(r'^\d{3}-\d{3}-\d{4}$|^\d{10}$');

                        if (!phoneRegex.hasMatch(value)) {
                          return 'Invalid phone number format.';
                        }
                        return null;
                      },
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
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
                        userRegisterRequestModel.mobile = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "   Email",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
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
                      controller: _emailController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
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
                        userRegisterRequestModel.email = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '   Select Gender',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'male',
                              fillColor:
                                  const MaterialStatePropertyAll(Color(0xFF149EEA),),
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
                              style: TextStyle(color: Colors.black),
                            ),
                            Radio<String>(
                              fillColor:
                                  const MaterialStatePropertyAll(Color(0xFF149EEA),),
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
                              style: TextStyle(color: Colors.black),
                            ),
                            Radio<String>(
                              fillColor:
                                  const MaterialStatePropertyAll(Color(0xFF149EEA),),
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
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "   Address",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _addressController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        FilteringTextInputFormatter.allow(RegExp(
                            r'[a-zA-Z\s]')), // Only allow letters and spaces
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
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
                        userRegisterRequestModel.address = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "   State",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      bloc: _stateBloc,
                      listener: (context, state) {
                        if(state is StateSuccessState){
                         //_selectedState = state.getStateListResponseModel.data?.firstWhere((element) => element.id == _selectedState?.id);
                        }
                      },
                      builder: (context, state) {
                        if (state is StateLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        } else if (state is StateSuccessState) {
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                            ),
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
                                    color: Colors.black,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons
                                      .arrow_drop_down, // You can change the icon as needed
                                  color: Colors.black, // Change the color of the dropdown icon here
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedState = newValue!;
                                    userRegisterRequestModel.state =
                                        newValue.id;
                                    _cityBloc
                                        .add(GetCityEvent(_selectedState?.id));
                                    _selectedCity = null;
                                    if (_selectedState != null) {
                                      _isStateSelected = false;
                                    } else {
                                      _isStateSelected = true;
                                    }
                                  });
                                },
                                items: state
                                    .getStateListResponseModel.data?.reversed
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "   City",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      bloc: _cityBloc,
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is StateLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          );
                        } else if (state is CitySuccessState) {
                          return Column(
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                   ),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: DropdownButton<city.Data>(
                                    icon: const Icon(
                                      Icons
                                          .arrow_drop_down, // You can change the icon as needed
                                      color: Colors.black, // Change the color of the dropdown icon here
                                    ),
                                    underline: Container(),
                                    isExpanded: true,
                                    value: _selectedCity,
                                    hint: const Text(
                                      "Select City",
                                      style:
                                          TextStyle(color: Colors.black),
                                    ),
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedCity = newValue!;
                                        userRegisterRequestModel.city =
                                            newValue.id;
                                        if (_selectedCity != null) {
                                          _isCitySelected = false;
                                        } else {
                                          _isCitySelected = true;
                                        }
                                      });
                                    },
                                    items: state.getCityListResponseModel.data
                                        ?.map((value) {
                                      return DropdownMenuItem<city.Data>(
                                        value: value,
                                        child: Text(
                                          value.name ?? "",
                                          style: const TextStyle(
                                            color: Color(
                                                0xFF11323B), // Change the color of the selected value here
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      bloc: _updateProfileBloc,
                      listener: (context, state) {
                        if (state is UpdateProfileSuccessState) {
                           Common.flushBarSuccessMassage(
                              state.updateProfileResponseModel.message
                                  .toString(),
                              context);
                           Future.delayed(const Duration(seconds: 1)).then((value){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const MyBottomNavigation()));
                           });
                        } else if (state is AuthErrorState) {
                           Common.flushBarErrorMassage(
                              state.message.toString(), context);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        return Center(
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  fixedSize:
                                      MaterialStatePropertyAll(Size(200, 50)),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF149EEA),
                                )
                              ),
                              onPressed: () {
                                _updateProfileBloc.add(UpdateProfileEvent(
                                    userRegisterRequestModel));
                              },
                              child: const Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  setValueInController(GetProfileResponseModel getProfileResponseModel) {
    //to show data in text field
    _firstNameController.text = getProfileResponseModel.data?.firstName ?? "";
    _lastNameController.text = getProfileResponseModel.data?.lastName ?? "";
    _emailController.text = getProfileResponseModel.data?.email ?? "";
    _mobileController.text = getProfileResponseModel.data?.mobile ?? "";
    _selectedGender = getProfileResponseModel.data?.gender ?? "";
    _addressController.text = getProfileResponseModel.data?.address ?? "";
    _selectedState?.id = getProfileResponseModel.data?.stateId;
    _selectedCity?.id = getProfileResponseModel.data?.city;
    _stateBloc.add(GetStateEvent());
    // adding to request if field is not update
    userRegisterRequestModel.firstName = getProfileResponseModel.data?.firstName ?? "";
    userRegisterRequestModel.lastName = getProfileResponseModel.data?.lastName ?? "";
    userRegisterRequestModel.mobile = getProfileResponseModel.data?.mobile ?? "";
    userRegisterRequestModel.email = getProfileResponseModel.data?.email ?? "";
    userRegisterRequestModel.address = getProfileResponseModel.data?.address ?? "";
    userRegisterRequestModel.state = getProfileResponseModel.data?.stateName ?? "";
    userRegisterRequestModel.city = getProfileResponseModel.data?.cityName ?? "";
    userRegisterRequestModel.gender = getProfileResponseModel.data?.gender ?? "";
  }
}
