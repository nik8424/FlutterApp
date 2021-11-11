import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Vx.purple900),
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
                child: Image.asset("assets/images/user.png"),
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
