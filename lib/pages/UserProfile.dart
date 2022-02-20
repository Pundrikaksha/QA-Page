import 'package:flutter/material.dart';
import 'package:frontend/pages/homeScreen.dart';
import 'package:frontend/widgets/TextBox.dart';
import 'package:frontend/widgets/UserIcon.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImg1(),
          BackgroundImg2(),
          Positioned(
            left: 25,
            top: 25,
            child: UserIcon(
              s: "U",
            ),
          ),
          Positioned(
            left: 25,
            top: 25,
            child: Text(
              "UserName",
              style: TextStyle(color: Colors.green),
            ),
          ),
          Positioned(
            top: _size.height / 3,
            left: _size.width / 4,
            right: _size.width / 4,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextBox(
                          size: _size,
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 5),
            ),
          ),
          // Positioned(
          //        top: 120,
          //        child: Divider(
          //          color: Colors.red,
          //          thickness: 50,
          //        ))
          // Positioned(
          //   left: 25,
          //   top: 25,
          //   child: CircleAvatar(
          //     maxRadius: 35,
          //     backgroundImage: AssetImage("images/logo.png"),
          //   ),
          // ),
        ],
      ),
    );
  }
}
