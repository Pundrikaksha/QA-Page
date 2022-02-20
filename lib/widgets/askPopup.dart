import 'package:flutter/material.dart';

class textfieldQA extends StatelessWidget {
  const textfieldQA({
    Key key,
    @required Size size,
    @required String hint,
    @required String label,
    Function onPressed,
  })  : _size = size,
        _hint = hint,
        _label = label,
        _onPressed = onPressed,
        super(key: key);

  final String _hint;
  final String _label;
  final Size _size;

  final Function _onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size.height / 3,
      width: _size.width / 2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          maxLines: 9,
          onChanged: _onPressed,
          decoration: InputDecoration(
              // prefixIcon: Icon(
              //   _icon,
              // ),

              hintText: _hint,
              // labelText: _label,
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  // width: 2,
                ),
              )),
        ),
      ),
    );
  }
}
