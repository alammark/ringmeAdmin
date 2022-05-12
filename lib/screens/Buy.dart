import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:ringme/screens/HomeShop.dart';
import 'package:ringme/screens/Widget/payment.dart';
import '../../globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

class Buy extends StatefulWidget {
  final String product_id;
  const Buy({Key? key, required this.product_id}) : super(key: key);
  @override
  State<Buy> createState() => _BuyPageState(this.product_id);
}

class _BuyPageState extends State<Buy> {
  final String product_id;
  _BuyPageState(this.product_id);

  String pro_name = '';
  String pro_details = '';
  String pro_pic = '';
  String pro_price = '';

  @override
  void initState() {
    getServiceDetails().then((value) {
      print(value['id']);
      setState(() {
        pro_name = value['pro_name'];
        pro_details = value['pro_details'];
        pro_pic = value['pro_pic'];
        pro_price = value['pro_price'];
      });
    });
    super.initState();
  }

  Future getServiceDetails() async {
    final response = await http
        .get(Uri.parse(globals.baseURL + '/getProductDetail/' + product_id));
    if (response.statusCode == 200) {
      var vals = json.decode(response.body);
      return vals;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: AssetImage("assets/pods.png"),
                    image: NetworkImage(pro_pic),
                    fit: BoxFit.contain,
                  ),
                  // shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pro_name,
                    maxLines: 3,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Rs" + pro_price + "/-",
                    maxLines: 3,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return payment();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "BUY NOW",
                      style: TextStyle(fontSize: 18),
                    ),
                    color: Colors.black,
                    textColor: Color(0xfffeba02),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    splashColor: Color(0xfffeba02),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    pro_details,
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(),
      ),
    );
  }
}
