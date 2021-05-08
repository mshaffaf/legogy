import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../services/alert.service.dart';
import '../../../router.dart';
import '../../../utils/utils.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../../global_widgets/custom_appbar.dart';
import '../../../global_widgets/header_text.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_form_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  AlertService alert = new AlertService();

  @override
  void dispose() {
    email.dispose();
    name.dispose();
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

    final title1 = HeaderText(text: "Create Account");
    final title2 = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: HeaderText(
        text: "Thousands of homes waiting for you.",
        type: HeaderTextType.small,
      ),
    );

    final spacer = SizedBox(height: 20.0);

    final nameField = CustomFormField(
      labelText: "Full name",
      icon: LineAwesomeIcons.user,
      controller: name,
    );

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

    final button = CustomButton(
      text: "Sign Up",
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
        } else if (name.text.isEmpty) {
          alert.show(
            context: context,
            message: "Name is required!",
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

    final form = Column(
      children: <Widget>[
        spacer,
        spacer,
        nameField,
        spacer,
        emailField,
        spacer,
        passwordField,
        spacer,
        button,
      ],
    );

    final alredyHaveAnAccount = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40.0),
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: defaultTextStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'Login',
              style: linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(loginViewRoute);
                },
            ),
          ],
        ),
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
          children: <Widget>[title1, title2, form, alredyHaveAnAccount],
        ),
      ),
    );
  }
}
