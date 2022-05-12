import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ringme/screens/Buy.dart';
import './Widget/post_model.dart';
import 'dart:convert';
import '../../globals.dart' as globals;

Future<List<Post>> fetchPost() async {
  final response =
  await http.get(Uri.parse(globals.baseURL+'/products'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

void main() => runApp(Test());

class Test extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Test> {
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
          title: Text('Home Admin'),
          backgroundColor: Colors.black,
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
                          // width: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width / 4,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              // image: AssetImage("assets/pods.png"),
                              image: NetworkImage(snapshot.data![index].pro_pic),
                              fit: BoxFit.contain,
                            ),
                            // shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0),
                          width: MediaQuery.of(context).size.width / 3,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index].pro_name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                Text(
                                  "Rs" +   snapshot.data![index].pro_price + "/-",
                                  style: TextStyle(
                                      color: Color(0xfffeba02),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
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
                                          Buy(product_id: snapshot.data![index].id)));
                            },
                            child: Text(
                              "BUY NOW",
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
