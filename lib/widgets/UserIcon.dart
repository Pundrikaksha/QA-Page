import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  UserIcon({this.s});
  final String s;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircleAvatar(
          radius: 31,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Text(
              s,
              style: TextStyle(fontSize: 30, color: Color(0xFF5CC4EF)),
            ),
          ),
        ),
      ),
    );
  }
}
