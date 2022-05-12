import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:typed_data';
import '../../globals.dart' as globals;

class CreateLoginad extends StatefulWidget {
  const CreateLoginad({Key? key}) : super(key: key);
  @override
  State<CreateLoginad> createState() => _CreateLoginadPageState();
}

class _CreateLoginadPageState extends State<CreateLoginad> {
  final _shopNameAd = TextEditingController();
  final _mobileAd = TextEditingController();
  final _passwordAd = TextEditingController();
  final _ownernameAd = TextEditingController();
  final _streetAd = TextEditingController();
  final _addressAd = TextEditingController();

  bool _validate = false;
  String errMsg = "";

  @override
  void dispose() {
    _shopNameAd.dispose();
    _mobileAd.dispose();
    _passwordAd.dispose();
    _ownernameAd.dispose();
    _streetAd.dispose();
    _addressAd.dispose();
    super.dispose();
  }

  createCustomer(String shopname, String mobile, String admin_password,
      String fullname, String street, String admin_address) async {
    var res = await http.post(
      Uri.parse(globals.baseURL + '/addAdmin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'shopname': shopname,
        'mobile': mobile,
        'fullname': fullname,
        'admin_password': admin_password,
        'street': street,
        'admin_address': admin_address
      }),
    );
    if (res.statusCode == 200) {
      Navigator.of(context).pushNamed('Loginad');
    } else {}
  }

  void _submit() {
    setState(() {
      _validate = false;
      errMsg = '';
    });
    if (_shopNameAd.text.isEmpty ||
        _mobileAd.text.isEmpty ||
        _passwordAd.text.isEmpty ||
        _ownernameAd.text.isEmpty ||
        _streetAd.text.isEmpty ||
        _addressAd.text.isEmpty) {
      setState(() {
        _validate = true;
        errMsg = "Value Can\'t Be Empty";
      });
    } else {
      createCustomer(
        _shopNameAd.text,
        _mobileAd.text,
        _passwordAd.text,
        _ownernameAd.text,
        _streetAd.text,
        _addressAd.text,
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
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/RingMeLogo.png'),
                height: 150.0,
                width: 150.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _shopNameAd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Shop Name',
                    errorText: _validate ? errMsg : null,
                    hintStyle: TextStyle(fontSize: 20),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 15, bottom: 15),
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
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _mobileAd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Number',
                    errorText: _validate ? errMsg : null,
                    hintStyle: TextStyle(fontSize: 20),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 15, bottom: 15),
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
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: _passwordAd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    errorText: _validate ? errMsg : null,
                    hintStyle: TextStyle(fontSize: 20),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 15, bottom: 15),
                    helperText: "Create a strong password",
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
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _ownernameAd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    errorText: _validate ? errMsg : null,
                    hintText: 'Owner Name',
                    hintStyle: TextStyle(fontSize: 20),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 15, bottom: 15),
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
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _streetAd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Street and Town',
                    errorText: _validate ? errMsg : null,
                    hintStyle: TextStyle(fontSize: 20),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 15, bottom: 15),
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
                margin: const EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 50.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  controller: _addressAd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Address',
                    errorText: _validate ? errMsg : null,
                    hintStyle: TextStyle(fontSize: 20),
                    contentPadding:
                        EdgeInsets.only(left: 30, top: 15, bottom: 15),
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
