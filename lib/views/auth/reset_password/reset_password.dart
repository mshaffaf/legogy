import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../services/alert.service.dart';
import '../../../services/dialog.service.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../../global_widgets/custom_appbar.dart';
import '../../../global_widgets/header_text.dart';
import '../../../global_widgets/custom_button.dart';
import '../../../global_widgets/custom_form_field.dart';
import '../../../router.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController code = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  AlertService alert = new AlertService();

  @override
  void dispose() {
    code.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title1 = HeaderText(text: "Reset Password");
    final title2 = Container(
      margin: EdgeInsets.only(top: 10.0),
      child: HeaderText(
        text:
            "Reset code was sent to your email. Please enter the code and create a new password.",
        type: HeaderTextType.small,
      ),
    );

    final spacer = SizedBox(height: 20.0);

    final codeField = CustomFormField(
      labelText: "Reset Code",
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      icon: LineAwesomeIcons.key,
      controller: code,
    );

    final newPasswordField = CustomFormField(
      labelText: "New Password",
      isPasswordField: true,
      icon: LineAwesomeIcons.unlock,
      controller: password,
    );

    final confirmPasswordField = CustomFormField(
      labelText: "Confirm Password",
      isPasswordField: true,
      icon: LineAwesomeIcons.unlock_alt,
      controller: confirmPassword,
    );

    final button = CustomButton(
      text: "CHANGE PASSWORD",
      onPressed: () async {
        if (code.text.isEmpty) {
          alert.show(
            context: context,
            message: "Code is required!",
            type: AlertType.error,
          );
        } else if (password.text.isEmpty) {
          alert.show(
            context: context,
            message: "Password is required!",
            type: AlertType.error,
          );
        } else if (confirmPassword.text.isEmpty) {
          alert.show(
            context: context,
            message: "Confirm Password is required!",
            type: AlertType.error,
          );
        } else if (password.text != confirmPassword.text) {
          alert.show(
            context: context,
            message: "Passwords do not match!",
            type: AlertType.error,
          );
        } else {
          await DialogService().show(
            context: context,
            message: "You password was changed successfully.",
            type: AlertDialogType.success,
          );
          Navigator.of(context).pushNamed(loginViewRoute);
        }
      },
    );

    final form = Column(
      children: <Widget>[
        spacer,
        spacer,
        codeField,
        spacer,
        newPasswordField,
        spacer,
        confirmPasswordField,
        spacer,
        button,
      ],
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
