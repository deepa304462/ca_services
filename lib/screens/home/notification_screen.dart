import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/home_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetNotificationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           SizedBox(
            height: MediaQuery.of(context).size.height/20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.notifications_active,
                size: 40,
                color: Color(0xFF149EEA),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                "Notifications",
                style: GoogleFonts.archivo(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color:  const Color(0xFF149EEA),
                    fontStyle: FontStyle.italic),
              )
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NotificationSuccess) {
                return  Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: state.notificationResponse.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.only(bottom: 8, right: 8, left: 8),
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.notificationResponse.data![index].addon ?? '',
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  state.notificationResponse.data![index].message ?? '',
                                  style: GoogleFonts.archivo(
                                      color: Colors.grey.shade700),
                                ),
                              ],
                            ),
                            onTap: () {
                              // Handle tapping on the ListTile
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
