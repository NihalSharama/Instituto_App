import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toasterSuccessMsg(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
  );
}

toasterFailureMsg(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
  );
}

toasterUnknownFailure() {
  Fluttertoast.showToast(
    msg: 'Something went wrong',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
  );

  return false;
}
