import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
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
          title: Text('Login',
          style: TextStyle(color: Colors.white),)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _forgotPassword() async {
    const url = 'https://example.com/forgot-password'; // Replace with your password reset URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child:Form(
key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            SizedBox(height:30.0),
            Image.asset('assets/1000006217-1721038677.jpg'),
            Text('DEMO ERP SYSTEM',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 30.0,),
          TextFormField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.person,
            color: Colors.red,),
            border: OutlineInputBorder(),
          ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty ||  !value.contains('@') || !value.contains('.')) {
                return 'Please enter email';
              }
              return null;
            },
          ),
      SizedBox(height: 16),
      TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock,
          color: Colors.red,),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    SizedBox(height: 16),
    TextButton(
    onPressed: _forgotPassword,
    child: Text(
    'Forgot Password?',
    style: TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
    ),
    ),
    ),
      
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            // Process data
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Processing Data...')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Color of the text and icon
          elevation: 5, // Shadow elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
        Text(
          'Login',
        style: TextStyle(color:Colors.white),),
            Icon(Icons.arrow_forward_sharp)
          ],
        ),
      ),
          ],
        ),
      ),
    );
  }
}
