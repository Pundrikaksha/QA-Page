import 'dart:async';

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, "/loginScreen"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/backgroundimage.png"),
                  fit: BoxFit.fill)),
          //Todo: placed image in place of  color
        ),
        Center(
          child: CircleAvatar(
            maxRadius: 50,
            backgroundImage: AssetImage("images/logo.png"),
          ),
        )
      ],
    );
  }
}
