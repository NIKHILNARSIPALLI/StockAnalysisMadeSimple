// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stock_analysis/pages/HomePage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const myHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Here we are creating a Scaffold to order the logo in the splash screen
      // In this splash screen there contains a body (not app bar as spash screen does not need one)
      // Now, let's set background color to black
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 185, // This box is used to create space above logo
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/bull_logo_full.png',
                  height: 347,
                  width: 327,
                  scale: 2.5,
                ),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.green,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
