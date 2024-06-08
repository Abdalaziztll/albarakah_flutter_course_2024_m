

import 'package:flutter/material.dart';

mixin SharedMethod {
  
showSnackBar(
    {required BuildContext context,
    required String title,
    required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
}
