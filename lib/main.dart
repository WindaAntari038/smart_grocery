import 'package:apk1/page/dashboard.dart';
import 'package:apk1/page/home.dart';
import 'package:apk1/page/login.dart';
import 'package:apk1/page/register.dart';
import 'package:apk1/utils/constants.dart';
import 'package:apk1/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Smart Grocery',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          initialRoute: "/",
          onGenerateRoute: _onGenerateRoute,
        );
      },
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/":
       return MaterialPageRoute(builder: (BuildContext context) {
        return RegisterPage();
       });  
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const login();
      });
    case "/forgotpin":
      return MaterialPageRoute(builder: (BuildContext context) {
        return ForgotPinScreen();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        // ignore: prefer_const_constructors
        return Dashboard();
      });
    default : 
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
