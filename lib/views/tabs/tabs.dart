import 'dart:io';

import 'package:flutter/material.dart';
import '../../views/tabs/explore/explore.dart';
import '../../views/tabs/favorite/favorite.dart';
import '../../views/tabs/messages/messages.dart';
import '../../global_widgets/custom_bottom_nav/custom_bottom_nav.dart';
import '../../views/tabs/profile/profile.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import '../../presentation/custom_icons_icons.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ExploreTab(),
    FavoriteTab(),
    MessagesTab(),
    ProfileTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final bottomNavBar = CustomBottomNav(
      inactiveIconColor: Colors.grey.withOpacity(0.6),
      textColor: Theme.of(context).primaryColor,
      tabs: [
        TabData(iconData: CustomIcons.home, title: 'Explore'),
        TabData(iconData: CustomIcons.heart, title: 'Favorites'),
        TabData(iconData: CustomIcons.chat_3, title: 'Messages'),
        TabData(iconData: LineAwesomeIcons.user, title: 'Profile'),
      ],
      onTabChangedListener: onTabTapped,
    );

    return Scaffold(
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: Platform.isAndroid ? 0 : 5.0,
        ),
        child: bottomNavBar,
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem({
    @required IconData iconData,
    @required String title,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
