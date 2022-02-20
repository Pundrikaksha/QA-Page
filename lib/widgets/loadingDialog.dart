import 'package:flutter/material.dart';

showLoadingDialog({String value, BuildContext context}) async {
  await Future.delayed(Duration.zero);
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                CircularProgressIndicator(),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(value))
              ], mainAxisSize: MainAxisSize.min))));
}
