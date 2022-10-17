import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instituto/constants/global_variables.dart';

class DocBoxSlide extends StatefulWidget {
  const DocBoxSlide({super.key});

  @override
  State<DocBoxSlide> createState() => _DocBoxSlideState();
}

class _DocBoxSlideState extends State<DocBoxSlide> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'DocBox Is Empty!',
        ),
      ),
    );
  }
}
