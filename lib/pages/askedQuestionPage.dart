import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/provider/dataProvider.dart';
import 'package:frontend/pages/homeScreen.dart';
import 'package:frontend/widgets/widget.dart';
import 'package:frontend/widgets/askPopup.dart';
import 'package:provider/provider.dart';

import 'homeScreen.dart';

class AskQuesPage extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  String Question;
  String Uid;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImg1(),
          BackgroundImg2(),
          Positioned(
            top: _size.height / 5,
            left: _size.width / 3.5,
            right: _size.width / 3.5,
            bottom: _size.height / 3.5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  textfieldQA(
                      onPressed: (value) {
                        Question = value;
                      },
                      size: _size,
                      hint: "Enter Question",
                      label: "Enter Question"),
                  SizedBox(
                    height: _size.height / 40,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Flexible(
                          child: Button(
                        size: _size * .8,
                        onTap: () {
                          count++;
                          _firestore.collection('Question').add({
                            'Uid': context.read<DataProvider>().uid,
                            'Question': Question,
                          });
                          Navigator.pushNamed(context, "/HomeScreen");
                        },
                        data: "post",
                        color: Color(0XFFBCE7F5),
                      )),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Flexible(
                      //     child: Button(
                      //   size: _size * .8,
                      //   onTap: () {
                      //     Navigator.pushNamed(context, "/HomeScreen");
                      //   },
                      //   data: "close",
                      //   color: Color(0XFFCEF8C8),
                      // ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
