import 'package:flutter/material.dart';
import 'signin.dart'; // Correct the import paths based on your project structure
import 'signup.dart';

void main() {
  runApp(GaragePopoteApp());
}

class GaragePopoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GARAGE POPOTE',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up / Sign In'),
      ),
      body: Container(
        color: Color(0xFF607D8B), // Choose a subtle color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'GARAGE POPOTE',
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Sign-In Page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text('Sign in'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Sign-Up Page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
