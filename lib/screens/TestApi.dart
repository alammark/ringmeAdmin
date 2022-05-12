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
      // await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
      await http.get(Uri.parse(globals.baseURL + '/users'));
  if (response.statusCode == 200) {
    // print(json.decode(response.body));
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<http.Response> postApi(String title) {
  return http.post(
    Uri.parse('http://127.0.0.1:4000/addUser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
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

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void submit() {
    setState(() {
      _text.text.isEmpty ? _validate = true : _validate = false;
    });

    if (!_validate) {
      postApi(_text.text);
    }
  }

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  void _uploadImg() async {
    var postUri = Uri.parse("http://127.0.0.1:4000/uploadImage");

    String base64Image = base64Encode(file.readAsBytesSync());

    String fileName = file.path.split('/').last;
    print(fileName);
    await http.post(postUri, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res);
    }).catchError((err) {
      print(err);
    });
  }

  Future<String?> uploadImage(filename) async {
    var url = Uri.parse('http://localhost:4000/uploads');
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    return res.reasonPhrase;
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
                onPressed: () async {
                  // var file = await ImagePicker.pickImage(source: ImageSource.gallery);
                  // file = (await ImagePicker().pickImage(
                  //    source: ImageSource.gallery,
                  //    maxWidth: 1800,
                  //    maxHeight: 1800,
                  //  ));

                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  file = result?.files.single.path;
                  print(result?.files.single.path);

                  // _getFromGallery();

                  // FilePickerResult? result = await FilePicker.platform.pickFiles();
                  //
                  // if(result != null) {
                  //   File file = File(result.files.single.path);
                  // } else {
                  //   // User canceled the picker
                  // }
                  // print(result.files.single.path);
                  // print(file.name);
                  //  print(file.bytes);
                  //  print(file.size);
                  //  print(file.extension);
                  //  print(file.path);
                },
                child: Text('PICK  single FILE'),
                color: Colors.blueAccent,
              ),
              MaterialButton(
                onPressed: () => uploadImage(file),
                child: Text('Upload single file'),
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
