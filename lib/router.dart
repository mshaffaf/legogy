import 'package:flutter/material.dart';
import 'package:hommie/global_widgets/image_viewer.dart';
import 'views/property_details/property_details.dart';
import 'views/create_ad/create_ad.dart';
import 'views/your_ads/your_ads.dart';
import 'views/tabs/messages/message_details.dart';
import 'views/settings/settings.dart';
import 'views/invitation/invitation.dart';
import 'views/auth/reset_password/reset_password.dart';
import 'views/auth/forgot_password/forgot_password.dart';
import 'views/auth/login/login.dart';
import 'views/auth/register/register.dart';
import 'views/splash/splash.dart';
import 'views/tabs/tabs.dart';
import 'views/onboarding/onboarding.dart';
import 'views/help/help.dart';

const String homeViewRoute = '/';
const String splashViewRoute = 'splash_screen';
const String onboardingViewRoute = 'onboarding';
const String loginViewRoute = 'login';
const String registerViewRoute = 'register';
const String forgotPasswordViewRoute = 'forgot_password';
const String resetPasswordViewRoute = 'reset_password';
const String tabsViewRoute = 'tabs';
const String invitationViewRoute = 'invitations';
const String settingsViewRoute = 'settings';
const String helpViewRoute = 'help';
const String addHomeViewRoute = 'add_home';
const String viewHomeViewRoute = 'view_home';
const String messageDetailsViewRoute = 'message_details';
const String yourAdsViewRoute = 'your_ads';
const String createAdViewRoute = 'create_ad';
const String propertyDetailsViewRoute = 'property_details';
const String imageViewerViewRoute = 'image_viewer';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashViewRoute:
      return MaterialPageRoute(builder: (_) => SplashPage());
      break;
    case homeViewRoute:
      return MaterialPageRoute(builder: (_) => TabsPage());
      break;
    case onboardingViewRoute:
      return MaterialPageRoute(builder: (_) => OnboardingPage());
      break;
    case loginViewRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
      break;
    case registerViewRoute:
      return MaterialPageRoute(builder: (_) => RegisterPage());
      break;
    case forgotPasswordViewRoute:
      return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      break;
    case resetPasswordViewRoute:
      return MaterialPageRoute(builder: (_) => ResetPasswordPage());
      break;
    case tabsViewRoute:
      return MaterialPageRoute(builder: (_) => TabsPage());
      break;
    case invitationViewRoute:
      return MaterialPageRoute(builder: (_) => InvitationPage());
      break;
    case settingsViewRoute:
      return MaterialPageRoute(builder: (_) => SettingsPage());
      break;
    case helpViewRoute:
      return MaterialPageRoute(builder: (_) => HelpPage());
      break;
    case messageDetailsViewRoute:
      return MaterialPageRoute(
        builder: (_) => MessageDetailsPage(
          messageListItem: settings.arguments,
        ),
      );
      break;
    case yourAdsViewRoute:
      return MaterialPageRoute(builder: (_) => YourAdsPage());
      break;
    case createAdViewRoute:
      return MaterialPageRoute(builder: (_) => CreateAdPage());
      break;
    case propertyDetailsViewRoute:
      return MaterialPageRoute(
        builder: (_) => PropertyDetails(
          property: settings.arguments,
        ),
      );
      break;
    case imageViewerViewRoute:
      return MaterialPageRoute(
        builder: (_) => ImageViewer(
          photos: settings.arguments,
        ),
      );
      break;
    default:
      return MaterialPageRoute(builder: (_) => TabsPage());
  }
}
