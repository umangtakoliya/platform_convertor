import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Provider/contact_provider.dart';
import '../../../Provider/datetimeprovider.dart';
import '../../../Provider/platform_provider.dart';

class myiospage extends StatefulWidget {
  const myiospage({super.key});

  @override
  State<myiospage> createState() => _myiospageState();
}

class _myiospageState extends State<myiospage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Platform Converter"),
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
      child: Padding(
        padding: EdgeInsets.only(top: 18.0),
        child: ListView.builder(
          itemCount: ContactProvider.ContactList.length,
          itemBuilder: (BuildContext context, int i) {
            return CupertinoListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              title: Text("${ContactProvider.ContactList[i].fullname}"),
              subtitle: Text("${ContactProvider.ContactList[i].phonenumber}"),
              trailing: Row(
                children: [
                  Text(
                    "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}",
                  ),
                  Text(
                    "${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}",
                  )
                ],
              ),

            );
          },
        ),
      ),
    );
  }
}