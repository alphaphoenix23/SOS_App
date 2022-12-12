import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:safety_app/services/authservice.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
//import 'package:sms/sms.dart';
import 'package:flutter_sms/flutter_sms.dart';
// import 'package:sms_maintained/contact.dart';
// import 'package:sms_maintained/generated/i18n.dart';
// import 'package:sms_maintained/globals.dart';
// import 'package:sms_maintained/sms.dart';
import 'contacts2.dart';
import 'contactModel.dart';
import 'storage.dart';
import 'contacts.dart';
//import './emergency.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var dbHelper = Storage();
  late List<ContactModel> contacts;

  static const platform = const MethodChannel('sendSms');

  Future<Position> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    return position;
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.sms,
    ].request();
    final info = statuses[Permission.sms].toString();
    print(info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffA10C0C),
        title: Text("Home"),
      ),
      // appBar: AppBar(
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.contacts,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => ContactList()),
      //         );
      //       },
      //     )
      //   ],
      // ),
      body: Container(
        width: double.infinity,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/back.jpg'),
        //         fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.4)
          ])),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  // SafeArea(
                  //   child: InkWell(
                  //     onTap: () async {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => EmergencyNumbers()),
                  //       );
                  //     },
                  //     child: Container(
                  //       height: 200,
                  //       width: 200,
                  //       decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //               image: AssetImage('assets/images/button.jpg'),
                  //               fit: BoxFit.cover),
                  //           border: Border.all(color: Colors.white, width: 5),
                  //           borderRadius: BorderRadius.circular(300),
                  //           color: Colors.red),
                  //       child: Column(children: <Widget>[
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Container(
                  //           height: 100,
                  //           decoration: BoxDecoration(
                  //               image: DecorationImage(
                  //                   image:
                  //                       AssetImage('assets/images/cop.png'))),
                  //           // child: Text("SOS",
                  //           //     style: TextStyle(
                  //           //       color: Colors.white,
                  //           //       fontSize: 90,
                  //           //     )),
                  //         ),
                  //         SizedBox(
                  //           height: 2,
                  //         ),
                  //         Container(
                  //           height: 80,
                  //           decoration: BoxDecoration(
                  //               image: DecorationImage(
                  //                   image:
                  //                       AssetImage('assets/images/sos3.png'))),
                  //         )
                  //       ]),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 40),
                  SafeArea(
                    child: InkWell(
                      onTap: () async {
                        _requestPermission();
                        Position position = await getCurrentLocation();
                        print("Pressed");
                        contacts = await dbHelper.getContacts();
                        print(contacts[0].number);
                        //SmsSender sender = new SmsSender();
                        for (int i = 0; i < contacts.length; i++) {
                          print(i);

                          String _result = await sendSMS(
                                  message: 'Help Me ' +
                                      'http://maps.google.com/?q=' +
                                      position.latitude.toString() +
                                      ',' +
                                      position.longitude.toString(),
                                  recipients: [contacts[i].number.trim()],
                                  sendDirect: true)
                              .catchError((onError) {
                            print(onError);
                          });
                          print(_result);
                          print('success');
                          Fluttertoast.showToast(
                              msg: "SOS sent",
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          // await sender.sendSms(new SmsMessage(
                          //     "+917018565855", 'Hello flutter!'));
                          // await sender.sendSms(new SmsMessage(
                          //     contacts[i].number.trim(),
                          //     'Help Me ' +
                          //         'http://maps.google.com/?q=' +
                          //         position.latitude.toString() +
                          //         ',' +
                          //         position.longitude.toString()));
                        }
                        // contacts.map((contact) {
                        //   await sender.sendSms(new SmsMessage(contact.number.trim(), 'Help ME!!'));
                        // });
                        // String address = "+918460729886";
                        //sender.sendSms(new SmsMessage("+917018565855", 'Hello flutter!'));
                        // sendSms();
                        // _sendSMS(message, recipents);
                      },
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/button.jpg'),
                                fit: BoxFit.cover),
                            border: Border.all(color: Colors.white, width: 5),
                            borderRadius: BorderRadius.circular(300),
                            color: Colors.red),
                        child: Center(
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/sos2.png'))),
                            // child: Text("SOS",
                            //     style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 90,
                            //     )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    child: Container(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactList()),
                      );
                    },
                    child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.contacts,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Center(
                                child: Text("Add Contacts",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ],
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                          //color:Colors.white
                        )),
                  ),

                  SizedBox(height: 25),
                  // InkWell(
                  //   onTap: () {
                  //     AuthService().signOut();
                  //   },
                  //   child: Container(
                  //       child: Center(
                  //           child: Text("Sign Out",
                  //               style: TextStyle(
                  //                 // color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ))),
                  //       height: 50,
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border.all(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(50),
                  //         //color:Colors.white
                  //       )),
                  // ),
                  //
                  //
                  //
                  //
                  //
                  //
                  // RaisedButton(
                  //   child: Text("SignOut"),
                  //   onPressed: () {
                  //     AuthService().signOut();
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
