import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paltform_converter_1/views/ios/tabios/addcontactpage.dart';
import 'package:paltform_converter_1/views/ios/tabios/contactpage.dart';
import 'package:paltform_converter_1/views/ios/tabios/myhomepage.dart';
import 'package:paltform_converter_1/views/ios/tabios/settingpage.dart';
import 'package:provider/provider.dart';

class HomeIos extends StatefulWidget {
  const HomeIos({super.key});

  @override
  State<HomeIos> createState() => _HomeIosState();
}

class _HomeIosState extends State<HomeIos> {
  List<Widget> pageListIos = [
    AddContactIos(),
    myiospage(),
    ContactIos(),
    SettingsIos(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_add_solid,
            ),
            label: "Add Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
            ),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.settings,
            ),
            label: "Settings",
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return pageListIos[i];
      },
    );
  }
}