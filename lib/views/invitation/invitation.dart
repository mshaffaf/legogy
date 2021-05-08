import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../global_widgets/custom_button.dart';
import '../../services/dialog.service.dart';
import '../../global_widgets/header_text.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../global_widgets/custom_appbar.dart';

class InvitationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final image = SvgPicture.asset(
      AppIll.invite,
      height: 300.0,
    );

    final title = Container(
      margin: EdgeInsets.only(top: 40.0),
      child: HeaderText(text: "Invite your friend"),
    );

    final subtitle = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "You can earn up to ",
          style: TextStyle(
            color: CustomColors.primaryDarkColor,
            fontFamily: AppFonts.primaryFont,
            fontWeight: FontWeight.w600,
            fontSize: 17.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '\$15',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            TextSpan(
              text: ' when you invite 3 friends.',
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );

    final emailField = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "EMAIL ADDRESS",
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
          border: InputBorder.none,
        ),
      ),
    );

    final inviteCode = Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Text(
            "4854WAF",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: CustomColors.primaryDarkColor),
          ),
          Text(
            "Your invite code",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );

    final button = CustomButton(
      text: "Send Invite",
      onPressed: () {
        DialogService().show(
          context: context,
          message: "Invite has been sent",
          type: AlertDialogType.success,
        );
      },
    );

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              image,
              title,
              subtitle,
              emailField,
              inviteCode,
              button,
              Utils.verticalSpacer(space: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
