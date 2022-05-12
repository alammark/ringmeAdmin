import 'package:flutter/material.dart';
import 'package:ringme/screens/Buy.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          //  width: 200,
          // height: 300,
          // margin: EdgeInsets.only(left: 15, right: 15, top: 30),
          color: Colors.grey[300],
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/pods.png"),
                      fit: BoxFit.contain,
                    ),
                    // shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product full Name",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      Text(
                        "£" + "3090" + "/-",
                        style: TextStyle(
                            color: Color(0xfffeba02),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('Buy');
                      },
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(fontSize: 10),
                      ),
                      color: Colors.black,
                      textColor: Color(0xfffeba02),
                      shape: StadiumBorder(),
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      splashColor: Color(0xfffeba02),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
