import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final double width, height, radius;
  final Color? backgroundColor, borderColor, titleColor;
  final EdgeInsetsGeometry? padding;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.width = 200,
    this.height = 50,
    this.backgroundColor,
    required this.borderColor,
    this.radius = 10,
    this.titleColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            Size(width, height),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: borderColor!),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
