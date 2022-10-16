import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class messageScreen extends StatefulWidget {
  const messageScreen({Key? key}) : super(key: key);

  @override
  State<messageScreen> createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xffA10C0C),
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text("SOS Message"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  // minWidth: MediaQuery.of(context).size.width,
                  // minHeight: MediaQuery.of(context).size.height,
                  ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Row(
                    //   children: [
                    //     Container(
                    //       padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                    //       child: Text(
                    //         'Message',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 35.0,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      height: 200,
                      child: Expanded(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '  Your message goes here.',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: " Help! Reach my location ASAP",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color(0xffA10C0C)),
                      child: TextButton(
                          child: Text(
                            'Confirm',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // child: Container(
          //   color: Colors.black,
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.max,
          //       children: [
          //         SizedBox(
          //           width: double.infinity,
          //           height: 125,
          //         ),
          //         SingleChildScrollView(
          //           child: Expanded(
          //             child: Container(
          //               color: Colors.grey,
          //               child: TextField(
          //                 keyboardType: TextInputType.multiline,
          //                 maxLines: null,
          //                 decoration: InputDecoration(
          //                   labelText: 'Your message goes here.',
          //                   labelStyle: TextStyle(
          //                     color: Colors.white,
          //                   ),
          //                   hintText: "Help! Reach my location ASAP",
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: double.infinity,
          //           height: 100,
          //         ),
          //         Container(
          //           // padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          //           /*decoration: BoxDecoration(
          //               border: Border.all(),
          //               borderRadius: BorderRadius.all(Radius.circular(25.0))),*/
          //           child: Container(
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //                 border: Border.all(),
          //                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //                 color: Color(0xffA10C0C)),
          //             child: TextButton(
          //               child: Text(
          //                 'Confirm',
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(color: Colors.white, fontSize: 15.0),
          //               ),
          //               onPressed: () {},
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
