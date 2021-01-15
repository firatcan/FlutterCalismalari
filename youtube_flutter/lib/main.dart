import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Center(child: Text("Hello World!"),);
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Takip Sistemi"),
        backgroundColor: Color.fromARGB(255, 0, 0, 255),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
