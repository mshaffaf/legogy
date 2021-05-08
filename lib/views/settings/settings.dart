import 'package:flutter/material.dart';
import '../../services/dialog.service.dart';
import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_form_field.dart';
import '../../utils/utils.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../global_widgets/custom_appbar.dart';
import '../../global_widgets/header_text.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController address = new TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  void initState() {
    name.text = "Jane Olson";
    email.text = "jane_olson@mail.com";
    phone.text = "123456789";
    password.text = "password";
    address.text = "A special address";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = HeaderText(text: "Settings");

    final userImage = Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.woman),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                LineAwesomeIcons.camera,
              ),
            ),
          )
        ],
      ),
    );

    final spacer = SizedBox(height: 20.0);

    final nameField = CustomFormField(
      labelText: "Fullname",
      icon: LineAwesomeIcons.user,
      controller: name,
    );

    final emailField = CustomFormField(
      labelText: "Email",
      icon: LineAwesomeIcons.envelope,
      controller: email,
    );

    final phoneField = CustomFormField(
      labelText: "Phone",
      icon: LineAwesomeIcons.mobile,
      controller: phone,
    );

    final passwordField = CustomFormField(
      labelText: "Password",
      icon: LineAwesomeIcons.unlock,
      isPasswordField: true,
      controller: password,
    );

    final addressField = CustomFormField(
      labelText: "Address",
      icon: LineAwesomeIcons.map_marker,
      controller: address,
    );

    final button = CustomButton(
      text: "Update",
      onPressed: () {
        DialogService().show(
          context: context,
          message: "You account has been updated successfully.",
          type: AlertDialogType.success,
        );
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
        phoneField,
        spacer,
        passwordField,
        spacer,
        addressField,
        spacer,
        button
      ],
    );

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 40.0,
          bottom: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[title, userImage, form],
        ),
      ),
    );
  }
}
