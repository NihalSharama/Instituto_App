import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instituto/data.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = 'dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

var cardAspectRatio = 12.0 / 16.0;
var WidgetAspectRatio = cardAspectRatio * 1.2;

class _DashboardScreenState extends State<DashboardScreen> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page as double;
      });
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stories"),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.add, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.blue, // <-- Button color
                          foregroundColor: Colors.red, // <-- Splash color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child:
                            Icon(Icons.document_scanner, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.blue, // <-- Button color
                          foregroundColor: Colors.red, // <-- Splash color
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.note, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.blue, // <-- Button color
                          foregroundColor: Colors.red, // <-- Splash color
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                          child: PageView.builder(
                              itemCount: images.length,
                              reverse: true,
                              controller: controller,
                              itemBuilder: (context, index) {
                                return Container();
                              }))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: WidgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;
        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;
        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;
        List<Widget> cardList =  List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);
          var CardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: Container(
                child: AspectRatio(
              aspectRatio: cardAspectRatio,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[i],
                    fit: BoxFit.cover,
                  )
                ],
              ),
            )),
          );
          cardList.add(CardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
