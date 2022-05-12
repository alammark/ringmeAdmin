import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash> {
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(

        body:  Container(
          color: Color(0xfffeba02),
          alignment: Alignment.center,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [


              Container(
                child:  Image.asset('assets/RingMeLogo.png'),
               height: 150.0,
               width: 150.0,
              ),

          /* new Container(
                height: 200.0,
                width: 200.0,
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: new NetworkImage('https://i.stack.imgur.com/agMKZ.png'),
                        fit: BoxFit.fill
                    ),
                    shape: BoxShape.circle
                ),
              ),*/
               Container(
                padding: EdgeInsets.fromLTRB(0.0,110.0,0.0,30.0),
                child:  Text('Version 1.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Aleo',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                      color: Colors.black
                  ),
                ),
              ),
            /*new Container(
              child:TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}