import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);
  @override
  State<About> createState() => _AboutPageState();
}

class _AboutPageState extends State<About> {
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(

              children: [
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Text("A4 Mobiles", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                      Text("Cheruvayoor, Calicut", style: TextStyle(fontSize: 20),),
                      Text("AKM Road", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
                SizedBox(height: 70,),

                IconButton(onPressed: (){}, icon: Icon(Icons.phone),
                iconSize: 70,
                color: Colors.grey[300],
                splashColor: Color(0xfffeba02),
                splashRadius: 45,),

                Text("8129173678",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 180,),
                Text("a4service@gmail.com"),

              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('About'),
        ),
      ),
    );
  }
}