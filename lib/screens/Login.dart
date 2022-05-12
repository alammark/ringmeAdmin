import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:localstorage/localstorage.dart';
import '../../globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
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
    bool err = false;
    if (!_username.text.isEmpty) {
      final response = await http
          .get(Uri.parse(globals.baseURL + '/getUser/' + _username.text));
      if (response.statusCode == 200) {
        var vals = json.decode(response.body);
        if (vals['username'] == _username.text &&
            vals['customer_password'] == _password.text) {
          print(vals['username'] == _username.text);
          print(vals['customer_password'] == _password.text);

          storage.setItem('user', vals['username']);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('displayName', vals['username']);
          Navigator.of(context).pushNamed('Shop');
        } else {
          err = true;
        }
      } else {
        err = true;
      }
    } else {
      print("error");
      setState(() {
        _validate = true;
        errMsg = "Value Can\'t Be Empty!";
      });
    }
    if (err) {
      setState(() {
        errMsg = "username or password does not match!";
        _validate = true;
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Sending Message"),
    ));
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
                child: Image.asset('assets/RingMeLogo.png'),
                height: 150.0,
                width: 150.0,

/*   height: 100.0,
                width: 100.0,
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: new NetworkImage('https://i.stack.imgur.com/agMKZ.png'),
                        fit: BoxFit.fill
                    ),
                    shape: BoxShape.circle
                ),*/
              ),

              Container(
                margin: const EdgeInsets.only(top: 60.0),
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'username',
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

              Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: TextField(
                  obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'password',
                    errorText: _validate ? errMsg : null,
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
                child: Text('Sign in'),
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
              Container(
                  margin: const EdgeInsets.only(top: 60.0),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.account_circle_sharp,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Aleo',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('CreateLogin');
                    },
                  )),

//  new Container(

// child: TextButton(
//   child: Text("Create an account",
//
//     style: TextStyle(color: Colors.black,
//             fontFamily: 'Aleo',
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15.0,),
//   ),
//
//   onPressed:() {
//     Navigator.of(context).pushNamed('CreateLogin');
//   },
// )

// child: FlatButton(
//   color: Colors.transparent,
//   splashColor: Colors.black26,
//   onPressed: () {
//     Navigator.of(context).pushNamed('CreateLogin');
//   },
//
//   padding: EdgeInsets.fromLTRB(0.0,50.0,0.0,100.0),
//   child: Text(
//     'Create an account',
//
//     style: TextStyle(color: Colors.black,
//       fontFamily: 'Aleo',
//             fontStyle: FontStyle.normal,
//             fontWeight: FontWeight.bold,
//             fontSize: 15.0,),
//
//   ),
// ),

// margin: const EdgeInsets.only(top: 00.0),
// padding: EdgeInsets.fromLTRB(0.0,50.0,0.0,100.0),
// child: new Text('Create an account',
//
//   textAlign: TextAlign.center,
//   style: TextStyle(
//
//       fontFamily: 'Aleo',
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.bold,
//       fontSize: 15.0,
//       color: Colors.black
//   ),

//  ),
            ],
          ),
        ),
      ),
    );
  }
}
