import 'package:flutter/material.dart';
import 'package:farmify_app/widgets/tabs.dart';
import 'package:google_fonts/google_fonts.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds, then navigate
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => TabsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // vertically center both
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 200, // reduced size
            ),
            const SizedBox(height: 16),
            Text(
              'FARMIFY',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22, // slightly bigger for balance
                  letterSpacing: 2, // spacing to look cleaner
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
