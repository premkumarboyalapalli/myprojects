import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jetbulksmsservices/login_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: null,
            flexibleSpace: Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}
