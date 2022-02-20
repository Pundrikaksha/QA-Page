import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/provider/dataProvider.dart';
import 'package:frontend/widgets/TextBox.dart';
import 'package:frontend/widgets/UserIcon.dart';
import 'package:provider/provider.dart';

class QAPage extends StatefulWidget {
  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  CollectionReference users = FirebaseFirestore.instance.collection('Answer');

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImg1(),
          BackgroundImg2(),
          Positioned(
            top: _size.height / 10,
            left: _size.width / 4,
            right: _size.width / 4,
            child: Card(
              child: TextBox(
                size: _size,
                data: context.read<DataProvider>().question ?? "",
              ),
            ),
          ),
          Positioned(
            top: _size.height / 3,
            left: _size.width / 4,
            right: _size.width / 4,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: users.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("Loading");
                    }
                    return ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return document['Question'] ==
                                context.read<DataProvider>().question
                            ? TextBox(
                                size: _size,
                                data: document['Answer'],
                                isVisible: false,
                              )
                            : SizedBox.shrink();
                      }).toList(),
                    );
                  },
                )),
          ),
          Positioned(
            left: 25,
            top: 25,
            child: CircleAvatar(
              maxRadius: 35,
              backgroundImage: AssetImage("images/logo.png"),
            ),
          ),
          Positioned(
            right: 25,
            top: 25,
            child: UserIcon(
              s: "U",
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImg2 extends StatelessWidget {
  const BackgroundImg2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/backgroundimage2.png"),
              fit: BoxFit.fill)),
    );
  }
}

class BackgroundImg1 extends StatelessWidget {
  const BackgroundImg1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/backgroundimage.png"), fit: BoxFit.fill),
      ),
    );
  }
}
