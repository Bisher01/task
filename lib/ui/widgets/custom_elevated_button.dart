import 'package:flutter/material.dart';
import '../../utilities/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  const CustomElevatedButton(
      {Key? key, required this.onPressed, required this.title, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(1),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(55))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: MyColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
