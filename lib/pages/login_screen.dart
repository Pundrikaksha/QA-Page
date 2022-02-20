import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/widget.dart';
import 'package:frontend/widgets/ShowErrorDialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
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
              child: Container(
                height: _size.height / 1.5,
                width: _size.width / 3,
                //Todo: Make scroll as insta
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFFFFFFF).withOpacity(0.65),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(34))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: AssetImage("images/logo.png"),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      textfield(
                        onPressed: (value) {
                          email = value;
                        },
                        size: _size,
                        icon: Icons.email_outlined,
                        hint: "Enter Email",
                        label: "email",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textfield(
                        onPressed: (value) {
                          password = value;
                        },
                        size: _size,
                        icon: Icons.lock,
                        hint: "Enter Password",
                        label: "Password",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Button(
                        data: "Sign Up",
                        size: _size,
                        onTap: () async {
                          // showLoadingDialog(context: context, value: "HomeScree Loading");
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            //print(newUser.additionalUserInfo);
                            if (newUser != null) {
                              Navigator.pushNamed(context, "/HomeScreen");
                            }
                          } catch (e) {
                            showErrorDialog(
                                context: context, value: e.toString());
                          }
                          // Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Button(
                        data: "Login In",
                        size: _size,
                        onTap: () async {
                          // showLoadingDialog(context: context, value: "HomeScree Loading");
                          try {
                            final newUser =
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);
                            //print(newUser.additionalUserInfo);
                            if (newUser != null) {
                              Navigator.pushNamed(context, "/HomeScreen");
                            }
                          } on FirebaseAuthException catch (e) {
                            showErrorDialog(
                                context: context, value: e.toString());
                          }
                          // Navigator.pop(context);
                        },
                      ),
                    ],
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
