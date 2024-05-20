import 'package:flutter/material.dart';
import 'package:pageview_and_image_paddnig_align/main.dart';
import 'package:pageview_and_image_paddnig_align/res/app_color.dart';
import 'package:pageview_and_image_paddnig_align/res/app_style.dart';

class ButtonWithCustomTitle extends StatelessWidget {
  const ButtonWithCustomTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: buttonTextStyle),
      width: 317,
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: secondaryColor),
    );
  }
}
