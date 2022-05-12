import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../globals.dart' as globals;
import 'package:file_picker/file_picker.dart';

import '../Shop.dart';
import '../Test.dart';

class Uploadad extends StatefulWidget {
  const Uploadad({Key? key}) : super(key: key);
  @override
  State<Uploadad> createState() => _BuyPageState();
}

class _BuyPageState extends State<Uploadad> {
  final _productName = TextEditingController();
  final _productDescription = TextEditingController();
  final _productPrice = TextEditingController();
  bool _validate = false;
  String errMsg = "";

  @override
  void dispose() {
    _productName.dispose();
    _productDescription.dispose();
    _productPrice.dispose();
    super.dispose();
  }

  uploadProduct(String proName, String proDetails, String proPrice) async {
    var res = await http.post(
      Uri.parse(globals.baseURL + '/addProduct'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'pro_name': proName,
        'pro_details': proDetails,
        'pro_price': proPrice,
      }),
    );
    if (res.statusCode == 200) {
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
    if (_productName.text.isEmpty ||
        _productDescription.text.isEmpty ||
        _productPrice.text.isEmpty) {
      setState(() {
        _validate = true;
        errMsg = "Value Can\'t Be Empty";
      });
    } else {
      uploadProduct(
        _productName.text,
        _productDescription.text,
        _productPrice.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      IconButton(
                        icon: Icon(Icons.local_hospital_outlined),
                        color: Colors.blue[200],
                        iconSize: 80,
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          // file = result?.files.single.path;
                          print(result?.files.single.path);
                        },
                      ),
                      Text("Upload Product Photo"),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(40, 40, 40, 10),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: Center(
                    child: TextField(
                      controller: _productName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Product Name",
                        errorText: _validate ? errMsg : null,
                        hintStyle: TextStyle(fontSize: 20),
                        contentPadding:
                            EdgeInsets.only(left: 30, top: 15, bottom: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black45,
                            width: 2.3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        helperText: "Please enter full name of the product.",
                        helperStyle: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      controller: _productDescription,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Product Description",
                        errorText: _validate ? errMsg : null,
                        hintStyle: TextStyle(fontSize: 20),
                        contentPadding:
                            EdgeInsets.only(left: 30, top: 15, bottom: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.3,
                          ),
                          borderRadius: BorderRadius.circular(20),
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
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _productPrice,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Price",
                        errorText: _validate ? errMsg : null,
                        hintStyle: TextStyle(fontSize: 20),
                        contentPadding:
                            EdgeInsets.only(left: 30, top: 15, bottom: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.3,
                          ),
                          borderRadius: BorderRadius.circular(20),
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
                ),
                SizedBox(
                  height: 60,
                ),
                FlatButton(
                  onPressed: () {
                    _submit();
                  },
                  child: Text(
                    "Add Product",
                    style: TextStyle(fontSize: 18),
                  ),
                  color: Colors.black,
                  textColor: Color(0xfffeba02),
                  shape: StadiumBorder(),
                  splashColor: Color(0xfffeba02),
                  padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                )
              ],
            )),
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(),
      ),
    );
  }
}
