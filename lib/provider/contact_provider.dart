import 'package:flutter/cupertino.dart';


import '../model/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  static List<Contact> ContactList = [];

  void AddContact({required Contact add_contact}) {
    ContactList.add(add_contact);
    notifyListeners();
  }
}