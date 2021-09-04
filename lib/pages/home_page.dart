// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "NAB";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.Items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Catalog App"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
