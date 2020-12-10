import 'package:flutter/material.dart';
import 'pages/home.dart';




void main (){
  runApp(MyApp());
  }


  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Django API ", //nama aplikasi
        home: Home(), //definisikan halaman awal
        theme: ThemeData(
          primaryColor: Colors.purpleAccent,
          accentColor: Colors.greenAccent
        ),
      );
    }
  }