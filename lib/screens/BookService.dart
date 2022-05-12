import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:ringme/screens/Admin/AddEmail.dart';
import 'package:ringme/screens/Admin/Uploadad.dart';
import 'package:ringme/screens/Shop.dart';
import 'package:ringme/screens/Test.dart';
import 'dart:convert';
import 'dart:typed_data';
import '../../globals.dart' as globals;
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddAddress.dart';
import 'Track.dart';

class BookService extends StatefulWidget {
  const BookService({Key? key}) : super(key: key);
  @override
  State<BookService> createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookService> {
  final _mobile_brand = TextEditingController();
  final _modelNumber = TextEditingController();
  final _complaint = TextEditingController();
  final _mobileNumber = TextEditingController();
  String userName = "";

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('displayName');
  }

  bool _validate = false;
  String errMsg = "";

  @override
  void dispose() {
    _mobile_brand.dispose();
    _modelNumber.dispose();
    _complaint.dispose();
    _mobileNumber.dispose();
    super.dispose();
  }

  bookService(String complaint, String mobile_brand, String model_number,
      String mobile_second) async {
    var res = await http.post(
      Uri.parse(globals.baseURL + '/bookService'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'complaint': complaint,
        'mobile_brand': mobile_brand,
        'model_number': model_number,
        'mobile_second': mobile_second,
        'customer': mobile_second,
        'service_status': '0',
      }),
    );
    if (res.statusCode == 200) {
      // Navigator.of(context).pushNamed('Test');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>Shop()));
    } else {}

  }

  void _submit() {
    setState(() {
      _validate = false;
      errMsg = '';
    });
    if (_mobile_brand.text.isEmpty ||
        _modelNumber.text.isEmpty ||
        _complaint.text.isEmpty ||
        _mobileNumber.text.isEmpty) {
      setState(() {
        _validate = true;
        errMsg = "Value Can\'t Be Empty";
      });
    } else {
      bookService(
        _mobile_brand.text,
        _modelNumber.text,
        _complaint.text,
        _mobileNumber.text,
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
                  controller: _mobile_brand,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Brand',
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
                  controller: _modelNumber,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Model Number',
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
                  keyboardType: TextInputType.text,
                  controller: _complaint,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    hintText: 'Complaint',
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
                  controller: _mobileNumber,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(),
                    errorText: _validate ? errMsg : null,
                    hintText: 'Mobile Number',
                    helperText:
                        "Please enter Active mobile number to cantact you anytime.",
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
                child: Text('SUBMIT'),
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
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Text("MENU"),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
              ),
              ListTile(
                title: Text("Service Status", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("See your mobile status."),
                onTap: (){
                  // Navigator.of(context).pushNamed('Track');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Track(service_id: 'e6u3kwl0rqkncq')));
                },

                leading: Icon(Icons.add),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text("Add Address", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Add your proper address."),
                onTap: (){
                  // Navigator.of(context).pushNamed('AddAddress');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddAddress()));
                },
                leading: Icon(Icons.add),
                trailing: Icon(Icons.arrow_forward),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

