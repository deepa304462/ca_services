import 'dart:async';

import 'package:ca_services/common/common.dart';
import 'package:ca_services/data/remote_services/models/get_service_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/strings.dart';
import '../../utils/messaging_service.dart';
import '../../utils/utils.dart';
import '../auth/edit_profile_screen.dart';
import '../auth/login_screen.dart';
import '../auth/reset_password_screen.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeBloc();
  final HomeBloc _updateFCM = HomeBloc();
  final HomeBloc _serviceRequestBloc = HomeBloc();

  final _messagingService =
  MessagingService(); // Instance of MessagingService for handling notifications


  @override
  void initState() {
    _homeBloc.add(GetServicesListEvent());

    _messagingService
        .init(context).then((value) {
          updateFcmToken();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF149EEA),
        ),
        backgroundColor: const Color(0xFFEAF1F8),
        title: Container(
          height: 50,
            child: Image.asset("assets/logo.png")),
      ),
      backgroundColor: const Color(0xFFEAF1F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              "assets/content_logo.png",
                              fit: BoxFit.fill,
                            ),
                          )),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Task Tally Software Subscription",
                        style: GoogleFonts.aclonica(
                            color: const Color(0xFFFFEC00), fontSize: 18),
                      ),
                      Text(
                        "++",
                        style: GoogleFonts.abel(
                            color: const Color(0xFFFFEC00), fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "GST Registeration",
                            style: GoogleFonts.aclonica(
                                color: const Color(0xFFFFEC00), fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "ITR",
                            style: GoogleFonts.aclonica(
                                color: const Color(0xFFFFEC00), fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "MSME",
                            style: GoogleFonts.aclonica(
                                color: const Color(0xFFFFEC00), fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Insurance Services",
                            style: GoogleFonts.aclonica(
                                color: const Color(0xFFFFEC00), fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "One minute promotion video \nwith editing",
                            style: GoogleFonts.aclonica(
                                color: const Color(0xFFFFEC00), fontSize: 18),
                          ),
                        ],
                      ),
        
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              bloc: _homeBloc,
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ServiceSuccessState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.getServiceResponse.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  state.getServiceResponse.data![index].icon ??
                                      "",
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Text(
                                    state.getServiceResponse.data![index]
                                            .serviceName ??
                                        '',
                                    style: GoogleFonts.archivo(
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                                ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF149EEA)),
                                        fixedSize: MaterialStatePropertyAll(
                                            Size(100, 30))),
                                    onPressed: () {
                                      _openBottomSheet(
                                          context,
                                          state
                                              .getServiceResponse.data![index]);
                                    },
                                    child: Text(
                                      "View",
                                      style: GoogleFonts.archivo(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ))
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                        onTap: () {
                          _openBottomSheet(
                              context, state.getServiceResponse.data![index]);
                        },
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFFEAF1F8),
                  ),
                  child: Image.asset('assets/logo.png')),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const EditProfileScreen()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lock_reset),
              title: const Text('Change Password'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ChangePasswordScreen()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                _showMyDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context, Data data) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    data.description ?? '',
                    style: GoogleFonts.archivo(
                        color: Colors.grey.shade500, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<HomeBloc, HomeState>(
                    bloc: _serviceRequestBloc,
                    listener: (context, state) {
                      if (state is HomeErrorState) {
                        Navigator.of(context).pop();
                        Common.flushBarErrorMassage(
                            state.message ?? "", context);
                      } else if (state is ServiceRequestSuccessState) {
                        Navigator.of(context).pop();
                        Common.flushBarSuccessMassage(
                            "Request send successfully", context);
                      }
                    },
                    builder: (context, state) {
                      if (state is HomeLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFF149EEA)),
                        );
                      }
                      return ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFF149EEA))),
                        onPressed: () {
                          _serviceRequestBloc.add(ServiceRequestEvent(data.id));
                          // Close the bottom sheet
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Request Call Back',
                              style: GoogleFonts.archivo(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure you want to logout'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                deleteFromSharedPreference(isLoggedIn);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LogInScreen()));
              },
              child: const Text('Yes', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void updateFcmToken() {
    _updateFCM.add(UpdateFCMTokenEvent(MessagingService.fcmToken ?? ''));
  }
}
