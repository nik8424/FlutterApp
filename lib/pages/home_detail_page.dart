import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_watch.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        // ignore: deprecated_member_use
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: <Widget>[
            Hero(
              tag: const HomeScreen(),
              child: ElevatedButton(
                child: const Icon(Icons.play_arrow, size: 40),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(120, 50)),
                  backgroundColor: MaterialStateProperty.all(
                    // ignore: deprecated_member_use
                    context.theme.buttonColor,
                  ),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                ),
              ),
            ),
            AddToCart(
              catalog: catalog,
            ).wh(120, 50)
          ],
        ).pOnly(bottom: 40, left: 25, right: 25, top: 10),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: SingleChildScrollView(
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text.caption(context).xl.make(),
                      10.heightBox,
                      "Labore diam nonumy duo diam et. Sit invidunt invidunt lorem accusam nonumy lorem rebum, diam sanctus dolor amet accusam invidunt est clita tempor, eos lorem ea ipsum kasd diam nonumy diam ea, dolores duo invidunt erat sadipscing sit gubergren amet no justo. Dolor takimata labore diam eirmod nonumy no dolor.."
                          .text
                          .caption(context)
                          .make()
                          .p16(),
                    ],
                  ).p64(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
