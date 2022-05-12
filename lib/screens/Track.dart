import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:localstorage/localstorage.dart';
import 'package:ringme/screens/HomeShop.dart';
import '../../globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'Test.dart';

class Track extends StatefulWidget {
  final String service_id;
  const Track({Key? key, required this.service_id}) : super(key: key);

  @override
  State<Track> createState() => _MyStatefulWidgetState(this.service_id);
}

class _MyStatefulWidgetState extends State<Track> {
  int _index = 0;
  String _issue = '';
  final String service_id;
  _MyStatefulWidgetState(this.service_id);

  final _price = TextEditingController();
  final _details = TextEditingController();
  bool _validate = false;
  String errMsg = '';


  @override
  void initState() {
    getServiceDetails().then((value){
      print(value['id']);
      setState(() {
        _index = int.parse(value['service_status']);
        _issue = value['complaint'];
      });
    });
    super.initState();
  }

  Future getServiceDetails()async{
    final response = await http
        .get(Uri.parse(globals.baseURL+'/getService/'+service_id));
    if (response.statusCode == 200) {
      var vals = json.decode(response.body);
      // print(vals);
      return vals;
      // if (vals['username'] == "_username.text"){

      // }
    }else{

    }
  }

  addPriceAdmin() async {
    var res = await http.post(
      Uri.parse(globals.baseURL + '/updateServiceFee'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'price': _price.text.toString(),
        'details': _details.text,
      }),
    );
    if (res.statusCode == 200) {
      // Navigator.of(context).pushNamed('ServiceRequests')
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>Test()));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Service Status",
      home: Scaffold(
        appBar: AppBar(title:  Text("Service Status")),
        body:  Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ISSUE", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(_issue, style: TextStyle(color: Colors.black, fontSize: 15),),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 50),
                  height: 85,
                  width: 250,
                  color: Colors.red[100],
                ),
                Stepper(
                  currentStep: _index,
                  onStepCancel: () {
                    if (_index > 0) {
                      setState(() {
                        _index -= 1;
                      });
                    }
                  },
                  onStepContinue: () {
                    if (_index <= 0) {
                      setState(() {
                        _index += 1;
                      });
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = index;
                    });
                  },
                  steps: <Step>[
                    Step(
                      title: const Text('Service Booked'),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('Work status Step 1')),
                    ),
                    const Step(
                      title: Text('Taken to Service'),
                      content: Text('Work status Step 2'),
                    ),
                    const Step(
                      title: Text('Service Started'),
                      content: Text('Work status Step 3'),
                    ),
                    const Step(
                      title: Text('Checked Issue'),
                      content: Text('Work status Step 4'),
                    ),
                    const Step(
                      title: Text('Delivered'),
                      content: Text('Work status Step 5'),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(30, 5, 30, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text("TOTAL COST-", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                      ],
                    )
                ),
              ],
            )




        ),
      ),
    );


  }
}
