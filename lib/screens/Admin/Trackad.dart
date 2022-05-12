import 'package:flutter/material.dart';

class Trackad extends StatefulWidget {
  final int service_id;
  const Trackad({Key? key, required this.service_id}) : super(key: key);
  @override
  State<Trackad> createState() => _TrackadPageState(this.service_id);
}

class _TrackadPageState extends State<Trackad> {
  final int service_id;
  _TrackadPageState(this.service_id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ISSUE", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Display Cracked", style: TextStyle(color: Colors.black, fontSize: 15),),
                  ],
                ),
                margin: EdgeInsets.only(left: 50),
                height: 85,
                width: 250,
                color: Colors.red[100],
              ),
              Row(
                children: [

                  Container(
                    margin: EdgeInsets.only(left: 30,),
                    width: 10,
                    height: 300,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[500],
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Text("Take for Service"),
                      Text("Checked Issue"),
                      Text("Packed"),
                      Text("Delivered"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Tick one"),
                      Text("Tick two"),
                      Text("Tick three"),
                      Text("Tick four"),
                    ],
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(bottom: 5),
                     // margin: EdgeInsets.only(left: 30),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Total Fee",
                          hintStyle: TextStyle(fontSize: 20),

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

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(bottom: 10),
                      // margin: EdgeInsets.only(left: 30),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Details",
                          hintStyle: TextStyle(fontSize: 20),

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
                    Container(
                      child: Center(
                          child: FlatButton(
                            onPressed: (){

                            },
                            child: Text("SUBMIT",
                              style: TextStyle(fontSize: 18),
                            ),
                            color: Color(0xfffeba02),
                            textColor: Colors.black,
                            shape: StadiumBorder(),
                            splashColor: Colors.black,
                            padding: EdgeInsets.fromLTRB(85, 15, 85, 15),
                          )
                      ),
                    ),

                  ],
                ),
              ),
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