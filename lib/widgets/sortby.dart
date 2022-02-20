import 'package:flutter/material.dart';

class SortBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      child: Center(
        child: Container(
          height: _size.height / 5,
          width: _size.width / 6,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Color(0xFFB1E8EC),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Text(
                  "Sort By",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                SortButtons(size: _size, T: "Most Recent"),
                SortButtons(size: _size, T: "Most Searched"),
                SortButtons(size: _size, T: "Topics"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SortButtons extends StatelessWidget {
  const SortButtons({
    Key key,
    @required Size size,
    @required this.T,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String T;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size.width / 9,
      child: TextButton(
        child: Container(
            width: _size.width / 10,
            child: Center(
                child: Text(T,
                    style: TextStyle(
                      color: Colors.black,
                    )))),
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
    );
  }
}
