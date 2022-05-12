import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../globals.dart' as globals;

class CreateLogin extends StatefulWidget {
  const CreateLogin({Key? key}) : super(key: key);
  @override
  State<CreateLogin> createState() => _LoginPageState();
}

class _LoginPageState extends State<CreateLogin> {
  final _fullname = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _mobile = TextEditingController();
  bool _validate = false;
  String errMsg = "";

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _mobile.dispose();
    _fullname.dispose();
    super.dispose();
  }

  createCustomer(String customername, String fullname, String customerPassword,
      String mobile) async {
    var res = await http.post(
      Uri.parse(globals.baseURL + '/addCustomer'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': customername,
        'fullname': fullname,
        'customer_password': customerPassword,
        'mobile': mobile,
      }),
    );
    if (res.statusCode == 200) {
      Navigator.of(context).pushNamed('Login');
    } else {}
  }

  void _submit() {
    setState(() {
      _validate = false;
      errMsg = '';
    });
    if (_fullname.text.isEmpty ||
        _username.text.isEmpty ||
        _password.text.isEmpty ||
        _mobile.text.isEmpty) {
      setState(() {
        _validate = true;
        errMsg = "Value Can\'t Be Empty";
      });
    } else {
      createCustomer(
        _username.text,
        _fullname.text,
        _password.text,
        _mobile.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xffffffff),
          alignment: Alignment.center,
          // padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 30.0),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Image.asset('assets/RingMeLogo.png'),
                height: 150.0,
                width: 150.0,

                /* height: 100.0,
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
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _fullname,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Full Name',
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
              Container(
                //   margin: const EdgeInsets.only(top: 40.0),
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'create username',
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
                margin: const EdgeInsets.only(top: 00.0),
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: TextField(
                  obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'create password',
                    errorText: _validate ? errMsg : null,
                    helperText: "Create a strong password",
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
                margin: const EdgeInsets.only(top: 00.0),
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30.0),
                child: TextField(
                  controller: _mobile,
                  keyboardType: TextInputType.number,
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
              ElevatedButton(
                child: Text('Create Account'),
                onPressed: () {
                  /*  Navigator.of(context).push
                    (MaterialPageRoute(
                    builder: (ctx){
                      return Login();
                      },
                  ),
                  );*/
                  _submit();
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: const Color(0xfffeba02),
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 63, vertical: 11),
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
