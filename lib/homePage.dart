import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xffA10C0C),
          title: Text("Home"),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xffA10C0C),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Manas Chaturvedi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '+91-xxxxxxxxxx',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Message',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.contacts,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Contacts',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
