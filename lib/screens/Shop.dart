import 'package:flutter/material.dart';
import 'package:ringme/screens/Admin/CreateLoginad.dart';
import 'package:ringme/screens/Admin/Trackad.dart';
import 'package:ringme/screens/Admin/Uploadad.dart';
import 'package:ringme/screens/HomeShop.dart';
import 'package:ringme/screens/ServiceRequests.dart';
import 'package:ringme/screens/Splash.dart';
import 'package:ringme/screens/Test.dart';
import 'package:ringme/screens/Track.dart';

import 'About.dart';
import 'Admin/Loginad.dart';
import 'Admin/Splashad.dart';
import 'BookService.dart';
import 'Buy.dart';
import 'Widget/Items.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);
  @override
  State<Shop> createState() => _ShopPageState();
}

class _ShopPageState extends State<Shop> {
  int _counter = 0;

  final List<Widget> _pages = <Widget>[
    /*const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),*/
    ServiceRequests(),
    Test(),
    About(),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _currentNav = 1;
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _pages.elementAt(_currentNav),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentNav,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service_rounded),
              label: 'Book Service',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About',
            ),
          ],
          selectedFontSize: 15,
          selectedItemColor: const Color(0xfffeba02),
          unselectedItemColor: const Color(0xff717171),
          onTap: (index) {
            setState(() {
              _currentNav = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushNamed('chat');
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),

        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   //elevation: 0,
        //   actions: <Widget>[
        //
        //     IconButton(
        //         onPressed: (){},
        //         icon: Icon(Icons.search)
        //     ),
        //   ],
        // ),
        // drawer: Drawer(),
      ),
    );
  }
}
