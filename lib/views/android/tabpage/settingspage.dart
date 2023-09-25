import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../Provider/platform_provider.dart';
import '../../../provider/theme_provider.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (Provider.of<profileprovider>(context, listen: true).Plat1.isios1 ==
          false)
          ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Text(
                    " Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                Switch(
                    value: Provider.of<profileprovider>(context,
                        listen: true)
                        .Plat1
                        .isios1,
                    onChanged: (val) {
                      Provider.of<profileprovider>(context, listen: false)
                          .changeprofile1(val);
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Text(
                    " Theam",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                Switch(
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
          )
        ],
      )
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: Text(
                    " Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                Switch(
                    value: Provider.of<profileprovider>(context,
                        listen: true)
                        .Plat1
                        .isios1,
                    onChanged: (val) {
                      Provider.of<profileprovider>(context, listen: false)
                          .changeprofile1(val);
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
              ),
            ),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "enter your name...",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(0))),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "enter your bio...",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(0))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.only(right: 40.0, top: 10),
                  child: Text(
                    "save",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "cancel",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            height: 29,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      (Provider.of<TheamProvider>(context, listen: true)
                          .theamChange
                          .isDark ==
                          false)
                          ? Icons.dark_mode
                          : Icons.sunny,
                      color: Colors.grey,
                      size: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        (Provider.of<TheamProvider>(context, listen: true)
                            .theamChange
                            .isDark ==
                            false)
                            ? "Theme sunny"
                            : "Theme dark",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                    Switch(
                      value: Provider.of<TheamProvider>(context,
                          listen: true)
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
          )
        ],
      ),
    );
  }
}