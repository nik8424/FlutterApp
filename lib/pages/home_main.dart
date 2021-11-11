// ignore_for_file: unused_import
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/category.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/menu.svg"),
                  GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, MyRoutes.profileRoute),
                      child: Image.asset("assets/images/user.png",
                          width: 50, height: 50)),
                ],
              ),
              const SizedBox(height: 40),
              "Hello, Nikhil"
                  .text
                  .color(context.accentColor)
                  .xl5
                  .semiBold
                  .make(),
              "Find a course you want to learn"
                  .text
                  .color(context.accentColor)
                  .caption(context)
                  .make(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Vx.purple200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/search.svg"),
                    const SizedBox(width: 16),
                    const Text("Search for anything",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFA0A5BD),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Fields",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0D1333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0D1333),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  padding: const EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: categories.length,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute,
                            arguments: categories[index]);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          height: index.isEven ? 200 : 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFF6E8AFA),
                            image: DecorationImage(
                              image: AssetImage(categories[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                categories[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF0D1333),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
