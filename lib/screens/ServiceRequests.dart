import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ringme/screens/Admin/Trackad.dart';
import 'package:ringme/screens/Admin/TrackerAdmin.dart';
import 'package:ringme/screens/Buy.dart';
// import './Widget/post_model.dart';
import 'dart:convert';
import '../../globals.dart' as globals;
import 'Admin/AddEmail.dart';
import 'Admin/Uploadad.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {

  Post({
    required this.id,
    required this.order_date,
    required this.customer,
    required this.mobile_brand,
    required this.model_number,
    required this.mobile_second,
    required this.complaint,
    required this.service_status,
  });

  // String complaint;
  // int id;
  // String title;
  // String body;
  String id;
  String order_date;
  String complaint;
  String customer;
  String mobile_brand;
  String model_number;
  String mobile_second;
  String service_status;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"],
    order_date: json["order_date"],
    customer: json["customer"],
    complaint: json["complaint"],
    model_number: json["model_number"],
    mobile_brand: json["mobile_brand"],
    mobile_second: json["mobile_second"],
    service_status: json["service_status"],
        // id: json["id"],
        // title: json["complaint"],
        // body: json["id"],
      );
}

Future<List<Post>> fetchPost() async {
  final response =
      // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      await http.get(Uri.parse(globals.baseURL + '/services'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    print(json.decode(response.body));

    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

void main() => runApp(ServiceRequests());

class ServiceRequests extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ServiceRequests> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Booked Services'),
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
                title: Text("Add Gadgets", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Click to upload item."),
                onTap: (){
                  // Navigator.of(context).pushNamed('Upload');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Uploadad()));
                },
                leading: Icon(Icons.add),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text("Add e-mail", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Add your e-mail address."),
                onTap: (){
                  // Navigator.of(context).pushNamed('AddEmail');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>AddEmail()));
                },
                leading: Icon(Icons.add),
                trailing: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
        body: FutureBuilder<List<Post>>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                // snapshot.data![index].title
                itemBuilder: (_, index) => Container(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // "order_date":"15",
                              // "complaint":"complaint",
                              // "customer":"customer",
                              // "mobile_brand":"mobile_brand",
                              // "model_number":"model_number",
                              // "mobile_second":"mobile_second",
                              // "service_status":"Taken to Service"
                              children: [
                                Text(
                                  "Order Date :" +snapshot.data![index].order_date,
                                  style: TextStyle(
                                      color: Color(0xfffeba02),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                Text(
                                    "Name :" + snapshot.data![index].customer,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                   "Brand :" +snapshot.data![index].mobile_brand,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Model Number :" + snapshot.data![index].model_number,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Complaint :" + snapshot.data![index].complaint,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Call Number:" + snapshot.data![index].mobile_second,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Service Status :" + snapshot.data![index].service_status,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                              ]),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 60,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TrackerAdmin(service_id: snapshot.data![index].id)));
                            },
                            child: Text(
                              "VIEW MORE DETAILS",
                              style: TextStyle(fontSize: 15),
                            ),
                            color: Colors.black,
                            textColor: Color(0xfffeba02),
                            shape: StadiumBorder(),
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            splashColor: Color(0xfffeba02),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),

      ),
    );
  }
}
