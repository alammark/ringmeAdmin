import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:localstorage/localstorage.dart';
import '../../globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

import 'Shop.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);
  @override
  State<AddAddress> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddress> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _validate = false;
  String errMsg = 'Value Can\'t Be Empty';

  final LocalStorage storage = new LocalStorage('session');

  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  void login() async {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>Shop()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xffffffff),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [


              Container(
                margin: const EdgeInsets.only(top: 60.0),
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: TextField(
                  controller: _username,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Address',
                    helperText: "Please add your communication address.",
                    errorText: _validate ? errMsg : null,
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black45,
                        width: 2.3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),



/*  new Container(
                  padding: const EdgeInsets.only(),
                  child: new RaisedButton(
                    child: const Text('Sign in'),
                    onPressed: null,
                      color: Colors.yellow,
                  )),*/

              ElevatedButton(
                child: Text('Add address'),
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: const Color(0xfffeba02),
                    onPrimary: Colors.black,
                    padding:
                    EdgeInsets.symmetric(horizontal: 110, vertical: 11),
                    textStyle:
                    TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
