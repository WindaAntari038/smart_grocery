// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void nextScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

class ForgotPinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa PIN'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock_outline,
                size: 100.0,
                color: Colors.grey,
              ),
              SizedBox(height: 20.0),
              Text(
                'Lupa Pin?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Jangan khawatir! Anda dapat mengatur ulang PIN Anda dengan mengikuti petunjuk yang dikirimkan ke alamat email kamu yang telah terdaftar di aplikasi ini',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => nextScreen(context, 'ResetPinScreen'),
                child: Text('Reset PIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
