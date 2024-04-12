import 'package:flutter/material.dart';
import 'package:apk1/widgets/input_widget.dart';
import 'package:apk1/widgets/app_button.dart';
import 'package:apk1/utils/constants.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 100, 166, 247),
      body: SafeArea(
        bottom: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 10.0,
              top: -60.0,
              child: Opacity(
                opacity: 0.15,
                child: Image.asset(
                  "assets/images/groceries.png",
                  width: 350.0,
                  height: 350.0,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16.0,
                        top: 15.0,
                        end: 16.0,
                        bottom: 100.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            "Login sesuai akunmu ya",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1 langkah lagi untuk menikmati semua fitur",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 100.0,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Lets make a generic input widget
                          InputWidget(
                            topLabel: "Email",
                            hintText: "contoh : winda@gmail.com",
                            topLabelStyle: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          InputWidget(
                            topLabel: "Pin",
                            obscureText: true,
                            hintText: "contoh : 12345",
                            topLabelStyle: TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/forgotpin');
                            },
                            child: const Text(
                              "Lupa Pin?",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          AppButton(
                            type: ButtonType.PRIMARY,
                            text: "Log In",
                            onPressed: () {
                              Navigator.pushNamed(context, '/dashboard');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
