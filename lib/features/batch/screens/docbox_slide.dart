import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instituto/constants/global_variables.dart';

class DocBoxSlide extends StatefulWidget {
  final List documents;
  const DocBoxSlide({super.key, required this.documents});

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
