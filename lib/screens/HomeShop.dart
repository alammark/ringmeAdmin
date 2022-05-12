import 'package:flutter/material.dart';

import 'Widget/Items.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({Key? key}) : super(key: key);
  @override
  State<HomeShop> createState() => _HomeShopPageState();
}

class _HomeShopPageState extends State<HomeShop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            children: [
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
              Items(),
            ],
          ),

//  width: MediaQuery.of(context).size.width,
//  height: MediaQuery.of(context).size.height,
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(),
      ),
    );
  }
}
