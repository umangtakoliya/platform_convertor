import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Provider/contact_provider.dart';
import '../../../Provider/datetimeprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ContactProvider.ContactList.length,
        itemBuilder: (ctx, i) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'detail',
                    arguments: ContactProvider.ContactList[i]);
              },
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue.withOpacity(.5),
                child: Text(
                  "${ContactProvider.ContactList[i].fullname[0]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text("${ContactProvider.ContactList[i].fullname}"),
              subtitle: Text("${ContactProvider.ContactList[i].chat}"),
              trailing: Text(
                "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}",
              ),
            ),
          );
        },
      ),
    );
  }
}