import 'package:flutter/material.dart';
import 'package:paltform_converter_1/views/android/tabpage/addcontactmaterial.dart';
import 'package:provider/provider.dart';

import '../../Provider/platform_provider.dart';
import '../../provider/changepageprovider.dart';
import 'TabPage/contactpage.dart';
import 'TabPage/homepage.dart';
import 'TabPage/settingspage.dart';

class HomePageMaterial extends StatefulWidget {
  const HomePageMaterial({super.key});

  @override
  State<HomePageMaterial> createState() => _HomePageMaterialState();
}

class _HomePageMaterialState extends State<HomePageMaterial> {
  List<Widget> pageList = [
    AddContactMat(),
    HomePage(),
    ContactPage(),
    SettingPage(),
  ];
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lightBlue,
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: Provider.of<ChangeIndexProvider>(context, listen: true)
              .changePageIndex
              .index,
          onTap: (val) {
            Provider.of<ChangeIndexProvider>(context, listen: false)
                .ChangeIndex(val: val);
            pageController.animateToPage(val,
                duration: Duration(microseconds: 150), curve: Curves.linear);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_1),
              label: "Add Contact",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat Page",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Contact",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
        appBar: AppBar(
          title: Text("Platform Converter"),
          actions: [
            Switch(
              value: Provider.of<PlatformProvider>(context, listen: true)
                  .changePlatform
                  .isios,
              onChanged: (val) {
                Provider.of<PlatformProvider>(context, listen: false)
                    .ConvertPlatform();
              },
            )
          ],
        ),
        body: PageView(
          onPageChanged: (val) {
            Provider.of<ChangeIndexProvider>(context, listen: false)
                .ChangeIndex(val: val);
          },
          controller: pageController,
          children: pageList,
        ));
  }
}