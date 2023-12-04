import 'package:ca_services/screens/auth/auth_bloc/auth_event.dart';
import 'package:ca_services/screens/auth/edit_profile_screen.dart';
import 'package:ca_services/screens/auth/login_screen.dart';
import 'package:ca_services/screens/auth/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../res/strings.dart';
import '../../utils/utils.dart';
import 'auth_bloc/auth_bloc.dart';
import 'auth_bloc/auth_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthBloc _profileBloc = AuthBloc();

  @override
  void initState() {
    super.initState();
    _profileBloc.add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F8),
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _profileBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF149EEA),
              ),
            );
          } else if (state is GetProfileSuccessState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 40,
                        color: Color(0xFF149EEA),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text("Profile",
                          style: GoogleFonts.archivo(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: const Color(0xFF149EEA),
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: SizedBox(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Name: ",
                                style: GoogleFonts.archivo(
                                    color: Colors.grey.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${state.getProfileResponseModel.data?.firstName ?? ""} ${state.getProfileResponseModel.data?.lastName ?? ""}",
                                style: GoogleFonts.archivo(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Gender: ",
                                style: GoogleFonts.archivo(
                                    color: Colors.grey.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.getProfileResponseModel.data?.gender ?? '',
                                style: GoogleFonts.archivo(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Mobile no: ",
                                style: GoogleFonts.archivo(
                                    color: Colors.grey.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.getProfileResponseModel.data?.mobile ?? "",
                                style: GoogleFonts.archivo(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Email: ",
                                style: GoogleFonts.archivo(
                                    color: Colors.grey.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                state.getProfileResponseModel.data?.email ?? "",
                                style: GoogleFonts.archivo(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address:  ",
                                style: GoogleFonts.archivo(
                                    color: Colors.grey.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: state.getProfileResponseModel.data?.cityName == null ? Text("") : Text(
                                  "${state.getProfileResponseModel.data?.address ?? ""}, ${state.getProfileResponseModel.data?.cityName ?? ""}, ${state.getProfileResponseModel.data?.stateName ?? ""}",
                                  style: GoogleFonts.archivo(
                                    color: Colors.grey.shade700,
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(),
                          const Expanded(
                            child: SizedBox(
                              height: 10,
                            ),
                          ),
                        ],
                      ),
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
    );
  }
}
