import 'package:ca_services/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Card(
                color: Colors.white,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/accounting.svg",
                            color:Color(0xFF149EEA),
                            width: 100,
                            height: 100,
                          ),
                          SvgPicture.asset(
                            "assets/gst.svg",
                            color: Color(0xFF149EEA),
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/audit.svg",
                            color: Color(0xFF149EEA),
                            width: 100,
                            height: 100,
                          ),
                          SvgPicture.asset(
                            "assets/incomeTax.svg",
                            color: Color(0xFF149EEA),
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  "Taking care of your Business is easy.",
                  style: GoogleFonts.archivo(
                      color: Color(0xFF149EEA),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "Any Tax related service for your business and your self please connect with us...",
                    style: GoogleFonts.archivo(
                      color: Color(0xFF149EEA),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const LogInScreen()));
              },
              child: Text(
                "Get Started",
                style: GoogleFonts.archivo(
                    color: Color(0xFF149EEA),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFF07229),
                    decorationStyle: TextDecorationStyle.double),
              ))
        ],
      ),
    );
  }
}
