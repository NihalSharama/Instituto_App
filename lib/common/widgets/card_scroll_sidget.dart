import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/global_variables.dart';
import '../../controller/dashboard_controllers.dart';

var cardAspectRatio = 12.0 / 16.0;
var WidgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  CardScrollWidget(this.currentPage);
  final storiesController = Get.put((StoriesController()));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storiesController.featchStoriesDetails('1'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
            width: 400,
            height: 300,
            child: AspectRatio(
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
                List<Widget> cardList = [];

                for (var i = 0;
                    i < storiesController.storiesDetails.value!.images.length;
                    i++) {
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
                          // Image.asset(
                          //   images[i],
                          //   fit: BoxFit.cover,
                          // ),
                          GestureDetector(
                            onTap: () => print("Stories Clicked"),
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.5),
                                          BlendMode.srcOver),
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        storiesController
                                            .storiesDetails.value!.images[i]
                                            .toString(),
                                      ))),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  storiesController
                                      .storiesDetails.value!.title[i]
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  storiesController
                                      .storiesDetails.value!.name[i]
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 15,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.storyViewButtonColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "VIEW",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontSize: 6,
                                            fontWeight: FontWeight.w600),
                                      )),
                                )
                              ],
                            ),
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
            ),
          );
        });
  }
}
