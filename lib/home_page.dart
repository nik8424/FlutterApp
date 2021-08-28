import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
     const HomePage({ Key? key }) : super(key: key);
  final int days = 31;
  final String name = "codepur";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        body: Center(
          child: Container(
            child: Text("welcome to  $days days flutter by $name"),
          ),
        ),
        drawer: Drawer(), 
      ); 
  }
}