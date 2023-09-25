import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Provider/contact_provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                setState(() {
                  BottomSheet(
                    onClosing: () {},
                    builder: (BuildContext context) {
                      return Container(
                        child: Text("Hello"),
                      );
                    },
                  );
                });
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
              subtitle: Text("${ContactProvider.ContactList[i].phonenumber}"),
              trailing: IconButton(
                onPressed: () async {
                  await launchUrl(
                    Uri.parse(
                        "tel:+91${ContactProvider.ContactList[i].phonenumber}"),
                  );
                },
                icon: Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}