// ignore_for_file: deprecated_member_use, unused_import

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SizedBox(
          //show user profile
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).p20(),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.network(
                    "https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_960_720.png"),
              ).p20(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Nikhil Bhandare",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueAccent,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
