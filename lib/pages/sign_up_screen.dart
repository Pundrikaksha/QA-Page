import 'package:flutter/material.dart';
import 'package:frontend/widgets/widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/backgroundimage.png"),
                      fit: BoxFit.fill)),
              //Todo: placed image in place of  color
            ),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: _size.height / 1.5,
                  width: _size.width / 4,
                  //Todo: Make scroll as insta
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Color(0xFFFFFFFF).withOpacity(0.65),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(34))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 75,
                        ),
                        CircleAvatar(
                          maxRadius: 36,
                          backgroundImage: AssetImage("images/logo.png"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textfield(
                          size: _size,
                          icon: Icons.email_outlined,
                          hint: "Enter Email",
                          label: "email",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textfield(
                          size: _size,
                          icon: Icons.lock,
                          hint: "Enter Password",
                          label: "Password",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        textfield(
                          size: _size,
                          icon: Icons.lock,
                          hint: "Enter Confirm Password",
                          label: "Confirm Password",
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Button(
                          data: "submit",
                          size: _size,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
