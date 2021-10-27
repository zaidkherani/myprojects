import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:db_merchant_app/screens/DBWalkThroughScreen.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:page_transition/page_transition.dart';

class DBSplashScreen extends StatefulWidget {
  const DBSplashScreen({Key? key}) : super(key: key);

  @override
  _DBSplashScreenState createState() => _DBSplashScreenState();
}

class _DBSplashScreenState extends State<DBSplashScreen> {

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgColor);
    return AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 120,
        splash: Image.asset(DBSplashImage),
        nextScreen: DBWalkThroughScreen(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: bgColor,
    );
  }
}
