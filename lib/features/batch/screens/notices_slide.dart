import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoticesSlide extends StatefulWidget {
  const NoticesSlide({super.key});

  @override
  State<NoticesSlide> createState() => NoticesSlideState();
}

class NoticesSlideState extends State<NoticesSlide> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Notice Board Is Empty!'),
      ),
    );
  }
}
