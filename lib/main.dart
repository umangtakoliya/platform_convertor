import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paltform_converter_1/provider/changepageprovider.dart';
import 'package:paltform_converter_1/provider/theme_provider.dart';
import 'package:paltform_converter_1/utils/mytheam.dart';
import 'package:paltform_converter_1/views/android/homeandroid.dart';
import 'package:paltform_converter_1/views/ios/homepageios.dart';
import 'package:provider/provider.dart';

import 'Provider/contact_provider.dart';
import 'Provider/datetimeprovider.dart';
import 'Provider/platform_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<profileprovider>(
          create: (context) => profileprovider(),
        ),
        ListenableProvider<profileprovider2>(
          create: (context) => profileprovider2(),
        ),
        ListenableProvider<switchprovider>(
          create: (context) => switchprovider(),
        ),
        ListenableProvider<datetimeprovider>(
          create: (context) => datetimeprovider(),
        ),
        ListenableProvider<ContactProvider>(
          create: (context) => ContactProvider(),
        ),
        ListenableProvider<TheamProvider>(
          create: (context) => TheamProvider(),
        ),
        ListenableProvider<PlatformProvider>(
          create: (context) => PlatformProvider(),
        ),
        ListenableProvider<ChangeIndexProvider>(
          create: (context) => ChangeIndexProvider(),
        ),
      ],
      builder: (context, child) =>
      (Provider.of<PlatformProvider>(context).changePlatform.isios == false)
          ? MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme.lightTheme,
        darkTheme: myTheme.darkTheme,
        themeMode:
        (Provider.of<TheamProvider>(context).theamChange.isDark ==
            false)
            ? ThemeMode.light
            : ThemeMode.dark,
        routes: {
          '/': (context) => HomePageMaterial(),
        },
      )
          : CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: MaterialBasedCupertinoThemeData(
          materialTheme: (Provider.of<TheamProvider>(context)
              .theamChange
              .isDark ==
              false)
              ? ThemeData(
            brightness: Brightness.light,
          )
              : ThemeData(
            brightness: Brightness.dark,
          ),
        ),
        routes: {
          '/': (ctx) => HomeIos(),
        },
      ),
    ),
  );
}

class AppTheme {}