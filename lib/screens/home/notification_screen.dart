import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notification_screen extends StatefulWidget {
  const notification_screen({super.key});

  @override
  State<notification_screen> createState() => _notification_screenState();
}

class _notification_screenState extends State<notification_screen> {
  List<String> notificationList = [
    "07-11-2023    Your Request send Successfully  our company contact you soon",
    "07-11-2023    Your Request send Successfully our company contact you soon",
    "07-11-2023    Your Request send Successfully our company contact you soon",
    "07-11-2023    Your Request send Successfully our company contact you soon",
    "07-11-2023    Your Request send Successfully our company contact you soon",
    "07-11-2023    Your Request send Successfully our company contact you soon",
    "07-11-2023    Your Request send Successfully our company contact you soon",
    "07-11-2023    Your Request send Successfully our company contact you soon",
  ];
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
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child:Center(child: Text("No notifications"))

              /* ListView.builder(
                itemCount: notificationList.length,
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
                              "07-11-2023",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Your Request send Successfully. Our company will contact you soon.",
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
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
