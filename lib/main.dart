import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/askedAnswerPage.dart';
import 'package:frontend/pages/askedQuestionPage.dart';
import 'package:frontend/provider/dataProvider.dart';
import 'package:frontend/pages/homeScreen.dart';
import 'package:frontend/pages/loading_screen.dart';
import 'package:frontend/pages/login_screen.dart';
import 'package:frontend/pages/qa_page.dart';
import 'package:frontend/pages/sign_up_screen.dart';
import 'package:frontend/widgets/loadingDialog.dart';
import 'package:provider/provider.dart';

import 'pages/UserProfile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/loadingScreen',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/loadingScreen': (context) => MyApp(),
          '/loginScreen': (context) => LoginScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/SignUpScreen': (context) => SignUpScreen(),
          '/HomeScreen': (context) => HomeScreen(),
          '/UserScreen': (context) => UserScreen(),
          '/AskQuesPage': (context) => AskQuesPage(),
          '/AskAnsPage': (context) => AskAnsPage(),
          '/QAPage': (context) => QAPage(),
        },
      )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return error(context);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return showLoadingDialog(context: context, value: "Firebase Initilizing");
    }

    return LoadingScreen();
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircularProgressIndicator(),
    );
  }
}

error(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: new Text("Error"),
            content: new Text("Something went wrong please try again"),
          ));
}
