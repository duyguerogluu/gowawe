import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AppBar(
                  backgroundColor: Colors.grey[800],
                  title: Image.asset('assets/images/gowawe.png',
                      fit: BoxFit.contain),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(Icons.notifications),
                    )
                  ]),
            ),
          ),
          backgroundColor: Colors.grey[800],
          //hamburger menu
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(
                  //       begin: Alignment.topRight,
                  //       end: Alignment.bottomLeft,
                  //       colors: [Colors.yellowAccent, Colors.black]),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
