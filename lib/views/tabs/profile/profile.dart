import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/profile_tab_option.dart';
import '../../../router.dart';
import '../../../utils/utils.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final List<ProfileTabOption> options = [
      ProfileTabOption(
        name: "Post New Ads",
        icon: AppIll.addHome,
        onPressed: () => Navigator.of(context).pushNamed(createAdViewRoute),
      ),
      ProfileTabOption(
        name: "View Your Ads",
        icon: AppIll.viewHome,
        iconSize: 50.0,
        onPressed: () => Navigator.of(context).pushNamed(yourAdsViewRoute),
      ),
      ProfileTabOption(
        name: "Invite Friends & Family",
        icon: AppIll.invitation,
        onPressed: () => Navigator.of(context).pushNamed(invitationViewRoute),
      ),
      ProfileTabOption(
        name: "Help",
        icon: AppIll.lifeRing,
        onPressed: () => Navigator.of(context).pushNamed(helpViewRoute),
      ),
      ProfileTabOption(
        name: "Logout",
        icon: AppIll.logout,
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context,
          loginViewRoute,
          (Route<dynamic> route) => false,
        ),
      ),
      ProfileTabOption(
        name: "Settings",
        icon: AppIll.settings,
        onPressed: () => Navigator.of(context).pushNamed(settingsViewRoute),
      ),
    ];

    final userImage = Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.woman),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );

    final userNameAndLocation = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Jane Olson",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          ],
        ),
        SizedBox(
          height: 1.0,
        ),
        Text(
          "NY, USA",
          style: TextStyle(
            color: Colors.grey.withOpacity(0.9),
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
        ),
      ],
    );

    final top = Container(
      height: screenHeight * 0.3,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userImage,
          userNameAndLocation,
        ],
      ),
    );

    final bottom = Expanded(
      child: Container(
        child: GridView.count(
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 2,
          children: options.map((option) {
            return _buildOption(
              context: context,
              option: option,
            );
          }).toList(),
        ),
      ),
    );

    return Container(
      child: Column(children: <Widget>[top, bottom]),
    );
  }

  Widget _buildOption({
    BuildContext context,
    ProfileTabOption option,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        elevation: 0,
        onPressed: option.onPressed,
        color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                option.icon,
                height: option.iconSize,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                option.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
