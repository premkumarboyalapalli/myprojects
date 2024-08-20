import 'package:flutter/material.dart';
import 'package:jetbulksmsservices/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _forgotPassword() async {
    const url =
        'https://example.com/forgot-password'; // Replace with your password reset URL
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30.0,
              width: 20.0,
            ),
            Text(
              'DEMO ERP SYSTEM',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
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
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'Please enter minimum 8 character in your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                } else {
                  // Process data
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Enter valid user credentials')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                // Color of the text and icon
                elevation: 5,
                // Shadow elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
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
