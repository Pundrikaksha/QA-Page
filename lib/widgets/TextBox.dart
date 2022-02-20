import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/provider/dataProvider.dart';
import 'package:provider/provider.dart';

class TextBox extends StatelessWidget {
  TextBox({this.size, this.data, this.isVisible: true});
  final Size size;
  String data;
  bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2,
        child: Container(
          constraints: BoxConstraints(
            minWidth: size.width / 2,
            minHeight: size.height / 5,
            maxHeight: size.height / 3,
          ),
          height: size.height / 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        data,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 75,
                      child: TextButton(
                        onPressed: () {
                          context.read<DataProvider>().question = data;
                          Navigator.pushNamed(context, "/AskAnsPage");
                        },
                        child: Center(
                          child: Text(
                            "Answer",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          shadowColor: Colors.black.withOpacity(0.16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
