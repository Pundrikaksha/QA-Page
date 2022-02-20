import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/provider/dataProvider.dart';
import 'package:frontend/widgets/TextBox.dart';
import 'package:frontend/widgets/UserIcon.dart';
import 'package:frontend/widgets/searchbar.dart';
import 'package:frontend/widgets/sortby.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  String mailId;
  CollectionReference users = FirebaseFirestore.instance.collection('Question');
  void getCurrentUser() async {
    final user = await _auth.currentUser;
    setState(() {
      mailId = user.email;
    });
  }


  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImg1(),
          BackgroundImg2(),
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
                        return GestureDetector(
                          onTap: () {
                            context.read<DataProvider>().question =
                                document['Question'];
                            Navigator.pushNamed(context, "/QAPage");
                          },
                          child: TextBox(
                            size: _size,
                            data: document['Question'],
                          ),
                        );
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
          Positioned(right: 25, top: _size.height / 3, child: Search()),
          Positioned(left: 25, top: _size.height / 3, child: SortBy()),
          Positioned(
              bottom: 4,
              right: _size.width / 5,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/AskQuesPage"
                    );
                  },
                  child: UserIcon(s: "+")))
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
            image: AssetImage("images/web19207.png"), fit: BoxFit.fill),
      ),
    );
  }
}
