import 'package:flutter/material.dart';

showErrorDialog({String value, BuildContext context}) async {
  await Future.delayed(Duration.zero);
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
          title: Container(
              color: Color(0XFFBCE7F5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Error Message")),
              )),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(value)),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0XFFBCE7F5)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("close"),
                        ))
                  ],
                ),
              ))));
}
