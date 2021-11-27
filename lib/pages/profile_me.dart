import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Vx.purple900),
      ),
      body: SingleChildScrollView(
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
                child: Hero(
                    tag: "tag", child: Image.asset("assets/images/user.png")),
              ).p20(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Name: Nikhil Bhandare",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueAccent,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.black,
                thickness: 1.0,
              ).p20(),
              const SizedBox(
                child: Text(
                  "Email: nik@gmail.com",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueAccent,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.black,
                thickness: 1.0,
              ).p20(),
              TextButton(
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.blueAccent,
                    width: 2.0,
                  ),
                  alignment: Alignment.bottomRight,
                  // ignore: deprecated_member_use
                  backgroundColor: context.theme.buttonColor,
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
