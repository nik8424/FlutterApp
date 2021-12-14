import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const darkColor = Color(0xFF49535C);
    var montserrat = TextStyle(
      fontSize: 14,
      color: context.accentColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: Title(
          color: Colors.black,
          child: Text(
            "My Profile",
            style: TextStyle(
              // ignore: deprecated_member_use
              color: context.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Material(
        child: Container(
          color: context.canvasColor,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
              alignment: Alignment.topCenter,
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: AvatarClipper(),
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              color: darkColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11,
                          top: 50,
                          child: Row(
                            children: [
                              const Hero(
                                tag: "tag",
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("assets/images/user.png"),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Nikhil Bhandare",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "ECS Academy",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: darkColor,
                                    ),
                                  ),
                                  SizedBox(height: 8)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email: \nNumber: ",
                              style: montserrat,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Official Start: \nOccupation: ",
                              style: montserrat,
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("nik@gmail.com", style: montserrat),
                            Text("7776669990", style: montserrat),
                            const SizedBox(height: 16),
                            Text("28.01.2020", style: montserrat),
                            Text("student", style: montserrat),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8)
                ],
              ),
            ).pOnly(top: 32, left: 10, right: 10, bottom: 300),
          ),
        ),
      ),
    );
  }

  TextStyle buildMontserrat(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: 18,
      color: color,
      fontWeight: fontWeight,
    );
  }
}

class AvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(8, size.height)
      ..arcToPoint(Offset(114, size.height), radius: const Radius.circular(1))
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
