import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:typed_data';
import '../../globals.dart' as globals;

class Loginad extends StatefulWidget {
  const Loginad({Key? key}) : super(key: key);
  @override
  State<Loginad> createState() => _LoginadPageState();
}

class _LoginadPageState extends State<Loginad> {
  final _mobile = TextEditingController();
  final _password = TextEditingController();
  bool _validate = false;
  String errMsg = 'Value Can\'t Be Empty';

  @override
  void dispose() {
    _mobile.dispose();
    super.dispose();
  }

  void _submit() async {
    bool err = false;
    if (!_mobile.text.isEmpty) {
      final response = await http
          .get(Uri.parse(globals.baseURL + '/getAdmin/' + _mobile.text));
      if (response.statusCode == 200) {
        var vals = json.decode(response.body);
        if (vals['mobile'] == _mobile.text &&
            vals['admin_password'] == _password.text) {
          print(vals['mobile'] == _mobile.text);
          print(vals['admin_password'] == _password.text);
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
              ),
              Container(
                margin: const EdgeInsets.only(top: 60.0),
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _mobile,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Number',
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
                    border: OutlineInputBorder(),
                    errorText: _validate ? errMsg : null,
                    hintText: 'password',
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
              ElevatedButton(
                child: Text('Sign in'),
                onPressed: () {
                  _submit();
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
                    Navigator.of(context).pushNamed('CreateLoginad');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
