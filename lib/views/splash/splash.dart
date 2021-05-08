import 'dart:async';

import 'package:flutter/material.dart';
import '../../router.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimer() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    bool showOnboarding = true;
    String viewToShow = loginViewRoute;
    if(showOnboarding){
      viewToShow = onboardingViewRoute;
    }
    Navigator.of(context).pushReplacementNamed(viewToShow);
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.primaryColor,
        child: Center(
          child: Image.asset(
            AppImages.logo,
            height: 120.0,
          ),
        ),
      ),
    );
  }
}
