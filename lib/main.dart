import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ringme/screens/About.dart';
import 'package:ringme/screens/AddAddress.dart';
import 'package:ringme/screens/Admin/AddEmail.dart';
import 'package:ringme/screens/Admin/CreateLoginad.dart';
import 'package:ringme/screens/Admin/Loginad.dart';
import 'package:ringme/screens/Admin/TrackerAdmin.dart';
import 'package:ringme/screens/HomeShop.dart';
import 'package:ringme/screens/ServiceRequests.dart';
import 'package:ringme/screens/Admin/Splashad.dart';
import 'package:ringme/screens/Admin/Trackad.dart';
import 'package:ringme/screens/Admin/Uploadad.dart';
import 'package:ringme/screens/Buy.dart';
import 'package:ringme/screens/Shop.dart';
import 'package:ringme/screens/Track.dart';
import 'package:ringme/screens/Widget/Chat.dart';
import 'package:ringme/screens/Widget/Items.dart';
import 'pages.dart';
import 'screens/Splash.dart';
import 'screens/Login.dart';
import 'screens/CreateLogin.dart';
import 'screens/Test.dart';
import 'screens/BookService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
//for routing function
      //for login page routing
      routes: {
        'Login': (ctx) {
          return Login();
        },
        //for CreateLogin page routing
        'CreateLogin': (ctx) {
          return CreateLogin();
        },
        //for buy page routing
        'Buy': (ctx) {
          return Buy(product_id: '');
        },
        'chat': (ctx) {
          return chat();
        },
        'Shop': (ctx) {
          return Shop();
        },
        'HomeShop': (ctx) {
          return HomeShop();
        },
        'Track': (ctx) {
          return Track(service_id: '');
        },
        'CreateLoginad': (ctx) {
          return CreateLoginad();
        },
        'Loginad': (ctx) {
          return Loginad();
        },
        'Uploadad': (ctx) {
          return Uploadad();
        },
        'Test': (ctx) {
          return Test();
        },
        'BookService': (ctx) {
          return BookService();
        },
        'ServiceRequests': (ctx) {
          return ServiceRequests();
        },
        'AddEmail': (ctx) {
          return AddEmail();
        },
        'AddAddress': (ctx) {
          return AddAddress();
        },
        'TrackerAdmin': (ctx) {
          return TrackerAdmin(service_id: '');
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Loginad())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Image.asset(
              'assets/RingMeLogo.png',
              color: Color(0xfffeba02),
            ),
            height: 150.0,
            width: 150.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 110.0, 0.0, 30.0),
            child: Text(
              'Version 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Aleo',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
