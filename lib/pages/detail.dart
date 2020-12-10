import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';


class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  var dataJSON;
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();

  postData(){
    var postData = {
      "title": title.text,
      "content": content.text
    };

    dataJSON = json.encode(postData);
    print(dataJSON);
    http.post("http://192.168.100.15:8000/api/?format=json", headers: {"Content-Type": "application/json"}, body: dataJSON).then((response){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder : (BuildContext context)=> Home()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambahkan Data"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(labelText: "judul")
            ),
            
            TextField(
              controller: content,
              decoration: InputDecoration(labelText: "konten")
            ),
            FlatButton(
              color: Colors.blueAccent,
              onPressed: (){
                postData();
              },
              child: Text("Tambah Data", style: TextStyle(color: Colors.white))
              )
          ],
        ),
      ),
    );
  }
}