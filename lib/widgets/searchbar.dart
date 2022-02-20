import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height / 2,
      width: _size.width / 6,
      child: TextField(
        autocorrect: true,
        decoration: InputDecoration(
          hintText: 'Search',
          hoverColor: Colors.grey.shade100,
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFF5CC4EF),
          ),
          hintStyle: TextStyle(color: Color(0xFF5CC4EF)),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
          ),
        ),
      ),
    );
  }
}
