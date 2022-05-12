import 'package:flutter/material.dart';

class Splashad extends StatefulWidget {
  const Splashad({Key? key}) : super(key: key);
  @override
  State<Splashad> createState() => _SplashadPageState();
}

class _SplashadPageState extends State<Splashad> {
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child:  Image.asset('assets/RingMeLogo.png', color: Color(0xfffeba02),),
                height: 150.0,
                width: 150.0,

              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0,110.0,0.0,30.0),
                child:  Text('Version 1.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Aleo',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

        ),

      ),
    );
  }
}