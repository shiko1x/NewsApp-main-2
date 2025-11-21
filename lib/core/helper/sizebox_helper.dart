import 'package:flutter/material.dart';

extension SizedBoxExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;


  SizedBox sizedBoxHelper({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }


}