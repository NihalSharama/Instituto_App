import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TeachersSlide extends StatelessWidget {
  const TeachersSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Teachers are not found',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Text("Invite Your Teachers Via"),
        ElevatedButton(
            style:
                ElevatedButton.styleFrom(elevation: 1, shape: StadiumBorder()),
            onPressed: () {
              Fluttertoast.showToast(
                msg: 'Link Copied to Clipboard',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
              );
            },
            child: const Text(
              'Invitation Link',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )),
      ],
    );
  }
}
