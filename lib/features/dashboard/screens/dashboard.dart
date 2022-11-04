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

class _DashboardScreenState extends State<DashboardScreen> {
  var currentPage = images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Scaffold(
      body: Padding(
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
                      child: Icon(Icons.document_scanner, color: Colors.white),
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
                    Positioned.fill(CardScrollWeidget(currentPage),
                        child: PageView.builder(
                            itemCount: images.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return Container();
                            }))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardScrollWeidget extends StatelessWidget {
  CardScrollWeidget({super.key});

  var currentPage;
  CardScrollWeidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
