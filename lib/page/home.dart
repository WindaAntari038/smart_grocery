// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/helper.dart';
import '../widgets/app_button.dart';
import '../page/register.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 100, 166, 247),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 100, 166, 247),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/shop.png",
                      fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -145.0,
                    top: 50.0,
                    child: Opacity(opacity: 0.2,
                    child: Image.asset("assets/images/toko.png",
                    ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Constants.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                 ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                  Text(
                    "Selamat Datang di Smart Grocery!",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(19, 22, 33, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Sudah punya akun?",
                    style: TextStyle(
                      color: Color.fromRGBO(74, 77, 84, 1),
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Let's create a generic button widget
                  AppButton(
                    text: "Masuk",
                    type: ButtonType.PLAIN,
                    onPressed: () {
                      nextScreen(context, "/login");
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  AppButton(
                    text: "Buat Akun",
                    type: ButtonType.PRIMARY,
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                    },
                  ),
                  ],), 
                )
              ],
            ),
          ),
        ] // Children
      ),
    );
  }
}
