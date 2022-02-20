import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key key,
      @required Size size,
      @required Function onTap,
      @required this.data,
      this.color})
      : _size = size,
        _onTap = onTap,
        super(key: key);
  final Color color;
  final Size _size;
  final Function _onTap;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size.height * 0.05,
      width: _size.width * 0.1,
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 10,
          backgroundColor: color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          shadowColor: Colors.black.withOpacity(0.16),
        ),
        onPressed: _onTap,
        child: Text(
          data,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class textfield extends StatelessWidget {
  const textfield(
      {Key key,
      @required Size size,
      @required String hint,
      @required String label,
      Function onPressed,
      @required IconData icon})
      : _size = size,
        _hint = hint,
        _label = label,
        _icon = icon,
        _onPressed = onPressed,
        super(key: key);

  final String _hint;
  final String _label;
  final Size _size;
  final IconData _icon;
  final Function _onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: _size.height * 0.045,
      width: _size.width * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: TextField(
          onChanged: _onPressed,
          decoration: InputDecoration(
              prefixIcon: Icon(
                _icon,
              ),
              hintText: _hint,
              // labelText: ,
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  // width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              )),
        ),
      ),
    );
  }
}
