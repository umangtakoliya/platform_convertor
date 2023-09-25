import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../Provider/contact_provider.dart';
import '../../../Provider/datetimeprovider.dart';
import '../../../Provider/platform_provider.dart';
import '../../../Utils/Globals.dart';
import '../../../model/contact_model.dart';

class AddContactIos extends StatefulWidget {
  const AddContactIos({super.key});

  @override
  State<AddContactIos> createState() => _AddContactIosState();
}

class _AddContactIosState extends State<AddContactIos> {
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
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      image = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      setState(() {
                        Global.imagePath = image!.path;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              foregroundImage:
                              FileImage(File(Global.imagePath)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Transform.scale(
                    scale: 1.08,
                    child: CupertinoTextFormFieldRow(
                      onSaved: (val) {
                        setState(() {
                          fullname = val!;
                        });
                      },
                      controller: fullnamec,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      placeholder: "Full Name",
                      prefix: const Icon(
                        CupertinoIcons.person,
                        size: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Transform.scale(
                    scale: 1.08,
                    child: CupertinoTextFormFieldRow(
                      onSaved: (val) {
                        setState(() {
                          phonenumber = val!;
                        });
                      },
                      controller: phonenumberc,
                      keyboardType: TextInputType.number,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      placeholder: "Phone Number",
                      prefix: const Icon(
                        CupertinoIcons.phone,
                        size: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Transform.scale(
                    scale: 1.08,
                    child: CupertinoTextFormFieldRow(
                      onSaved: (val) {
                        setState(() {
                          chat = val!;
                        });
                      },
                      controller: chatc,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      placeholder: "Chat Conversation",
                      prefix: const Icon(
                        CupertinoIcons.chat_bubble_text,
                        size: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {});
                      DateTime? Pickedate = await showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 350,
                          color: CupertinoColors.white,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            minimumYear: 2000,
                            maximumYear: 2100,
                            onDateTimeChanged: (val) {
                              Provider.of<datetimeprovider>(context,
                                  listen: false)
                                  .dateTimeModel
                                  .initialdate = val;
                            },
                          ),
                        ),
                      );
                      Provider.of<datetimeprovider>(context, listen: false)
                          .pickdate(Pickedate!);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          CupertinoIcons.calendar,
                          size: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            "${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.day}/${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.month}/${Provider.of<datetimeprovider>(context, listen: true).dateTimeModel.initialdate.year}")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      TimeOfDay? Picketime = await showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 350,
                          color: Colors.white,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            minimumYear: 2000,
                            maximumYear: 2100,
                            onDateTimeChanged: (val) {
                              Provider.of<datetimeprovider>(context,
                                  listen: false)
                                  .Timemodal
                                  .initialtime;
                            },
                          ),
                        ),
                      );
                      Provider.of<datetimeprovider>(context, listen: false)
                          .picktime(Picketime!);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          CupertinoIcons.time,
                          size: 35,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            "${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.hour}:${Provider.of<datetimeprovider>(context, listen: true).Timemodal.initialtime.minute}")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                      Contact c1 = Contact(
                        chat: chat,
                        fullname: fullname,
                        phonenumber: phonenumber,
                      );
                      Provider.of<ContactProvider>(context, listen: false)
                          .AddContact(add_contact: c1);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}