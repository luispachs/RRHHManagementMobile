import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({super.key});


  @override
  State<Dashboard> createState() => _Dashboard();
}


class _Dashboard extends State<Dashboard>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: Column(
        children: [ const Text("hi")],
      ),
    );
  }
}