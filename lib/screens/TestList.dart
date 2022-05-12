import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../globals.dart' as globals;

Future<List<Data>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
  // await http.get(Uri.parse(globals.baseURL + '/users'));
  if (response.statusCode == 200) {
    // print(json.decode(response.body));
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  final String userId;
  final int id;
  final String title;

  Data({required this.userId, required this.id, required this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => _MyAppState();
}

class _MyAppState extends State<Test> {
  late Future<List<Data>> futureData;

  final _text = TextEditingController();
  bool _validate = false;
  var file;

  void submit() {}

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ListView'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'username',
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
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
                controller: _text,
              ),
              ElevatedButton(
                child: Text('Sign in'),
                onPressed: () {
                  // Navigator.of(context).pushNamed('Shop');
                  submit();
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
              MaterialButton(
                onPressed: () {},
                child: Text('PICK  single FILE'),
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_getFromGallery() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
    print(imageFile);
    uploadFile(imageFile);
  }
}

uploadFile(imageFile) async {
  var postUri = Uri.parse("http://127.0.0.1:4000/uploadImage");
  var request = new http.MultipartRequest("POST", postUri);
  request.fields['user'] = 'blah';
  request.files.add(new http.MultipartFile.fromBytes('file', imageFile,
      filename: basename(imageFile.path)));

  request.send().then((response) {
    if (response.statusCode == 200) print("Uploaded!");
  });
}
