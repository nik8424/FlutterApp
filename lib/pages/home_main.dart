import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/category.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/star.svg").continuousRectangle(
                  height: 30,
                  width: 30,
                  backgroundColor: context.canvasColor,
                ),
                GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, MyRoutes.profileRoute),
                    child: Hero(
                      tag: "tag",
                      child: Image.asset("assets/images/user.png",
                          width: 50, height: 50),
                    )),
              ],
            ),
            const SizedBox(height: 40),
            "Hello, Nikhil".text.color(context.accentColor).xl5.semiBold.make(),
            "Find a course you want to learn"
                .text
                .color(context.accentColor)
                .caption(context)
                .make(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                "Fields".text.color(context.accentColor).semiBold.xl2.make(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
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
                          border: Border.all(
                            color: context.accentColor,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(20),
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
    );
  }
}
