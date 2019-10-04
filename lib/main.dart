import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyDemo();
  }
}

class MyDemo extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mera app",
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Cloud firestore demo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new RaisedButton(
                  onPressed: _add,
                  child: Text("Add"),
                  color: Colors.green,
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(
                  onPressed: _update,
                  child: Text("Update"),
                  color: Colors.yellow,
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(
                  onPressed: _delete,
                  child: Text("Delete"),
                  color: Colors.blue,
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new RaisedButton(
                  onPressed: _fetch,
                  child: Text("Fetch"),
                  color: Colors.red,
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
              ]),
        ),
      ),
    );
  }

  void _update() {
    Map<String, String> data = <String, String>{"Name": "Ravi", "City": "ICE"};
    DocumentReference documentReference =
    Firestore.instance.collection("users").document("info");
    documentReference.setData(data).whenComplete(() {
      print("Data Updated");
    }).catchError((e)=>print(e));
  }

  void _delete() {  }

  void _add() {
    Map<String, String> data = <String, String>{"Name": "Virus", "City": "ICE"};
    DocumentReference documentReference =
        Firestore.instance.collection("users").document("info");
    documentReference.setData(data).whenComplete(() {
      print("Data Inserted");
    }).catchError((e)=>print(e));
  }

  void _fetch() {Map<String, String> data = <String, String>{"Name": "Virus", "City": "ICE"};
  DocumentReference documentReference =
  Firestore.instance.collection("users").document("info");
  documentReference.setData(data).whenComplete(() {
    print("Data Inserted");
  }).catchError((e)=>print(e));}
}
