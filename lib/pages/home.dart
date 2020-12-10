
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  var dataJSON;

  getData()async{
    http.Response hasil  = await http.get("http://192.168.100.15:8000/api/?format=json", headers: {"Accept": "application/json"});
    setState(() {
      dataJSON = json.decode(hasil.body);
      print(dataJSON);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          FlatButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder : (BuildContext context)=> Detail()));
            },
            child: Icon(Icons.add, color: Colors.white)),
            FlatButton(
            onPressed: (){
              getData();
            },
            child: Icon(Icons.refresh, color: Colors.white)),
        ],
      ),
      body: ListView.builder(
        itemCount: dataJSON == null ? 0 : dataJSON.length,
        // ignore: missing_return
        itemBuilder: (context, i){
          if(dataJSON.length > 0 ){
            return Container(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
              child: Card(
                child: ListTile(
                  title: Text(dataJSON[i]['title']),
                  subtitle: Text(dataJSON[i]['content']),
                ),
              ),
            );
          }
        }
        ),
      
    );
  }
}