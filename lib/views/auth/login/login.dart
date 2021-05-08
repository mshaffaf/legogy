import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../services/alert.service.dart';
import '../../../utils/colors.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:lottie/lottie.dart';
import '../../../global_widgets/custom_appbar.dart';
import '../../../global_widgets/header_text.dart';
import '../../../utils/utils.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

   AlertService alert = new AlertService();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.primaryFont,
    );

    final linkTextStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
    );

    final title1 = HeaderText(text: "Hi,");
    final title2 = HeaderText(text: "Welcome back!");

    final spacer = SizedBox(height: 20.0);

    final emailField = CustomFormField(
      labelText: "Email Address",
      icon: LineAwesomeIcons.envelope_o,
      controller: email,
    );

    final passwordField = CustomFormField(
      labelText: "Password",
      isPasswordField: true,
      icon: LineAwesomeIcons.lock,
      controller: password,
    );

    final forgotPassword = Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(forgotPasswordViewRoute),
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

    final button = CustomButton(
      text: "LOG IN",
      onPressed: () {
        if (email.text.isEmpty) {
          alert.show(
            context: context,
            message: "Email is required!",
            type: AlertType.error,
          );
        } else if (!email.text.contains('@')) {
          alert.show(
            context: context,
            message: "Email is invalid",
            type: AlertType.error,
          );
        } else if (password.text.isEmpty) {
          alert.show(
            context: context,
            message: "Password is required!",
            type: AlertType.error,
          );
        } else {
          Navigator.of(context).pushNamed(tabsViewRoute);
        }
      },
    );

    final quickLogin = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
      child: RichText(
        text: TextSpan(
          text: "New! ",
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.w600,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Quick login, use fingerprint',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );

    final dontHaveAnAccount = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0),
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: defaultTextStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'Sign Up',
              style: linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(registerViewRoute);
                },
            ),
          ],
        ),
      ),
    );

    final fingerprint = Container(
      height: 80.0,
      alignment: Alignment.center,
      child: Lottie.asset(
        AppAnim.fingerprint,
      ),
    );

    final form = Form(
      child: Column(
        children: <Widget>[
          spacer,
          spacer,
          spacer,
          emailField,
          spacer,
          passwordField,
          forgotPassword,
          spacer,
          spacer,
          button
        ],
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 40.0,
          bottom: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title1,
            title2,
            form,
            quickLogin,
            fingerprint,
            dontHaveAnAccount,
          ],
        ),
      ),
    );
  }
}
