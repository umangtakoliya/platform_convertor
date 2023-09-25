import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../Provider/contact_provider.dart';
import '../../../Provider/datetimeprovider.dart';
import '../../../Utils/Globals.dart';
import '../../../model/contact_model.dart';

class AddContactMat extends StatefulWidget {
  const AddContactMat({super.key});

  @override
  State<AddContactMat> createState() => _AddContactMatState();
}

class _AddContactMatState extends State<AddContactMat> {
  ImagePicker picker = ImagePicker();

  XFile? image;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int initialIndex = 0;
  String fullname = "";
  String phonenumber = "";
  String chat = "";
  TextEditingController fullnamec = TextEditingController();
  TextEditingController phonenumberc = TextEditingController();
  TextEditingController chatc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (image == null)
                  ? Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
                  : Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(
                      File("${image?.path}"),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      image = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      setState(() {
                        Global.imagePath = image!.path;
                      });
                    },
                    icon: const Icon(
                      Icons.photo,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      setState(() {
                        Global.imagePath = image!.path;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: fullnamec,
                onChanged: (val) {
                  setState(() {
                    fullname = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Full Name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              TextFormField(
                controller: phonenumberc,
                onChanged: (val) {
                  setState(() {
                    phonenumber = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              TextFormField(
                controller: chatc,
                onChanged: (val) {
                  setState(() {
                    chat = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.chat),
                  hintText: "Chat Conversation",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () async {
                    DateTime? Pickedate = await showDatePicker(
                      context: context,
                      initialDate:
                      Provider.of<datetimeprovider>(context, listen: false)
                          .dateTimeModel
                          .initialdate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2050),
                    );
                    Provider.of<datetimeprovider>(context, listen: false)
                        .pickdate(Pickedate!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Pick a date       "),
                        ),
                        Text(
                            "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: false).dateTimeModel.initialdate.year}")
                      ],
                    ),
                  )),
              GestureDetector(
                  onTap: () async {
                    TimeOfDay? Picketime = await showTimePicker(
                        context: context,
                        initialTime: Provider.of<datetimeprovider>(context,
                            listen: false)
                            .Timemodal
                            .initialtime);
                    Provider.of<datetimeprovider>(context, listen: false)
                        .picktime(Picketime!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        const Icon(Icons.watch),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Pick a time       "),
                        ),
                        Text(
                          "${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}",
                        )
                      ],
                    ),
                  )),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(
                          () {
                        Timer(const Duration(seconds: 3), () {
                          Navigator.pop(context);
                        });
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Row(
                              children: [
                                const Icon(Icons.person_pin),
                                Text(
                                  "$fullname Added",
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        );
                      },
                    );

                    Contact c1 = Contact(
                      chat: chat,
                      fullname: fullname,
                      phonenumber: phonenumber,
                    );

                    Provider.of<ContactProvider>(context, listen: false)
                        .AddContact(add_contact: c1);

                    fullnamec.clear();
                    chatc.clear();

                    phonenumberc.clear();

                    Navigator.pushNamed(context, 'home');
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        elevation: 5,
                        title: const Text(
                          "Add info to save as a contact.",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        content: Row(
                          children: [
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("ok"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                child: Text("SAVE"),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}