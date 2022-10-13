import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BatchScreen extends StatefulWidget {
  final String id;
  const BatchScreen({
    super.key,
    required this.id,
  });
  static const String routeName = '/batch/';

  @override
  State<BatchScreen> createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('id: ${widget.id}'),
      ),
    );
  }
}
