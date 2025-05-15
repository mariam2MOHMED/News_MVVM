import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newshttp/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName="/SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      duration: Duration(
        seconds: 5
      ),
      // animationCurve: Curves.easeInOut,
      // animationDuration: Duration(
      //   seconds: 5
      // ),
      childWidget: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: HomePage(),
    );;
  }
}
