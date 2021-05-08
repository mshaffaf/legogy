import 'package:flutter/material.dart';
import '../../../services/alert.service.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../../router.dart';
import '../../../global_widgets/custom_appbar.dart';
import '../../../global_widgets/header_text.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController email = new TextEditingController();
  AlertService alert = new AlertService();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title1 = HeaderText(text: "Forgot Password");
    final title2 = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: HeaderText(
        text:
            "Please enter your email below to recieve your password reset instructions.",
        type: HeaderTextType.small,
      ),
    );

    final spacer = SizedBox(height: 20.0);

    final emailField = CustomFormField(
      labelText: "Email Address",
      icon: LineAwesomeIcons.envelope,
      controller: email,
    );

    final button = CustomButton(
      text: "SEND REQUEST",
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
        } else {
          Navigator.of(context).pushNamed(resetPasswordViewRoute);
        }
      },
    );

    final form = Column(
      children: <Widget>[spacer, spacer, emailField, spacer, button],
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
          ],
        ),
      ),
    );
  }
}
