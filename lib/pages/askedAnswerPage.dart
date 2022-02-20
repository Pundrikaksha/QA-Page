import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/provider/dataProvider.dart';
import 'package:frontend/pages/homeScreen.dart';
import 'package:frontend/widgets/widget.dart';
import 'package:frontend/widgets/askPopup.dart';
import 'package:provider/provider.dart';

class AskAnsPage extends StatelessWidget {
  String Answer;
  String Uid;
  String Question;
  final _firestore = FirebaseFirestore.instance;
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
                        Answer = value;
                      },
                      size: _size,
                      hint: "Enter Answer",
                      label: "Enter Answer"),
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
                          _firestore.collection('Answer').add({
                            'Uid': context.read<DataProvider>().uid,
                            'Question': context.read<DataProvider>().question,
                            'Answer': Answer,
                          });
                          Navigator.pushNamed(context, "/HomeScreen");
                        },
                        data: "post",
                        color: Color(0XFFBCE7F5),
                      )),
                      // SizedBox(
                      //  width: 10,
                      // ),
                      //Flexible(
                      //  child: Button(
                      //size: _size * .8,
                      //onTap: () {},
                      //data: "close",
                      //color: Color(0XFFCEF8C8),
                      //))
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
