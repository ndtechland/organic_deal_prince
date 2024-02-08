
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:organic_deal/Home_page/home_page.dart';
import 'package:organic_deal/intro_page/intro_page.dart';
import 'package:page_transition/page_transition.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/images/logo1.png',scale: 10,)
          //Image.asset("assets/intro.webp",height: 90,)
        ],
      ),
      nextScreen: const HomePage(),
     // const IntroPage(),
      splashIconSize: 150,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: Duration(seconds: 1),
    );
  }
}
