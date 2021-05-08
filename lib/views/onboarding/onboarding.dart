import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../global_widgets/onboarding/src/page_model.dart';
import '../../router.dart';
import '../../global_widgets/onboarding/onboarding.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
      fontWeight: FontWeight.w900,
      color: Colors.white,
      fontSize: 30.0,
    );

    final TextStyle bodyStyle = TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    );

    final pageList = [
      PageModel(
        color: const Color(0xFF678FB4),
        heroAssetPath: AppIll.slider1,
        title: Text(
          'Find Places to Live',
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
          'Find great verified places and people to share a home with.',
          textAlign: TextAlign.center,
          style: bodyStyle,
        ),
        iconAssetPath: AppIll.slider1,
      ),
      PageModel(
        color: const Color(0xFF65B0B4),
        heroAssetPath: AppIll.slider2,
        title: Text(
          'Match Your Preferences',
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
          'Tell us your preferences and match with the right house.',
          textAlign: TextAlign.center,
          style: bodyStyle,
        ),
        iconAssetPath: AppIll.slider2,
      ),
      PageModel(
        color: const Color(0xFF9B90BC),
        heroAssetPath: AppIll.slider3,
        title: Text(
          'Move In and Enjoy',
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
          'Move into your new place and feel at home',
          textAlign: TextAlign.center,
          style: bodyStyle,
        ),
        iconAssetPath: AppIll.slider3,
      ),
    ];

    return Scaffold(
      body: Onboarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () => Navigator.of(context).pushReplacementNamed(
          loginViewRoute,
        ),
        onSkipButtonPressed: () => Navigator.of(context).pushReplacementNamed(
          loginViewRoute,
        ),
      ),
    );
  }
}
