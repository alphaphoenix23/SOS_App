//Implemented contact picking for 1 contact. DO for 5 contacts and work on its display

import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class contacts extends StatefulWidget {
  const contacts({Key? key}) : super(key: key);

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xffA10C0C),
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          title: Text('Contacts'),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                Contact? contact = await _contactPicker.selectContact();
                setState(() {
                  _contact = contact;
                });
              },
              icon: Icon(
                Icons.add,
              ),
              label: Text(
                'ADD',
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffA10C0C),
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Text(
            _contact.toString(),
            style: TextStyle(color: Colors.white),
          ),
          /*new Text(
          _contact.toString(),
        )*/
        )),
      ),
    );
  }
}
