// ignore_for_file: use_key_in_widget_constructors, unnecessary_this
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:apk1/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: constant_identifier_names
enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;

  const AppButton(
      {required this.type, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(48.0),
        decoration: BoxDecoration(
          color: getButtonColor(type),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            this.text,
            style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 16, 15, 15), 
                          ),
          ),
        ),
      ),
    );
  }
}

Color getButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      return Color.fromARGB(255, 127, 183, 253);
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return const Color.fromARGB(255, 100, 166, 247);
  }
}

Color getTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return const Color.fromARGB(255, 127, 183, 253);
    case ButtonType.PRIMARY:
      return Colors.white;
    default:
      return Colors.white;
  }
}
