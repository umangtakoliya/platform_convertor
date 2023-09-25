import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../Provider/platform_provider.dart';

import '../../../Utils/Globals.dart';
import '../../../provider/theme_provider.dart';

class SettingsIos extends StatefulWidget {
  const SettingsIos({super.key});

  @override
  State<SettingsIos> createState() => _SettingsIosState();
}

class _SettingsIosState extends State<SettingsIos> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Platefrom Converter"),
        trailing: CupertinoSwitch(
          value: Provider.of<PlatformProvider>(context, listen: true)
              .changePlatform
              .isios,
          onChanged: (val) {
            Provider.of<PlatformProvider>(context, listen: false)
                .ConvertPlatform();
          },
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                    value: Provider.of<switchprovider>(context, listen: true)
                        .isprofile,
                    onChanged: (val) {
                      Provider.of<switchprovider>(context, listen: false)
                          .changeprofile(val);
                    }),
              ],
            ),
          ),
          (Provider.of<profileprovider>(context, listen: true).hasListeners ==
              true)
              ? Column(
            children: [

              const SizedBox(height: 10),
              CupertinoButton(

                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.camera,
                ),
              ),
              CupertinoTextField()
            ],
          )
              : Container(),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Theme",
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                  value: Provider.of<TheamProvider>(context, listen: true)
                      .theamChange
                      .isDark,
                  onChanged: (val) {
                    Provider.of<TheamProvider>(context, listen: false)
                        .ChangeTheam();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}