import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'const_sizes.dart';

TextStyle mediumStyle() => TextStyle(
    fontFamily: 'Poppins',
    fontSize: height12,
    color: backgroundColor,
    fontWeight: FontWeight.w500);

TextStyle errorStyle() => TextStyle(
    fontFamily: 'Poppins',
    fontSize: height16,
    color: Colors.red,
    fontWeight: FontWeight.w500);

TextStyle largeMediumPrimaryColor2() => TextStyle(
    fontFamily: 'Poppins',
    fontSize: height16,
    color: primaryColor2,
    fontWeight: FontWeight.w500);

TextStyle largePrimaryColor1() => TextStyle(
    fontFamily: 'Poppins',
    fontSize: height14,
    color: primaryColor1,
    fontWeight: FontWeight.w500);

TextStyle smallPrimaryColor2() => TextStyle(
    fontFamily: 'Poppins',
    fontSize: height14,
    color: primaryColor2,
    fontWeight: FontWeight.w500);

TextStyle smallCustomGreyColor() => TextStyle(
    fontFamily: 'Poppins',
    fontSize: height12,
    color: customGreyColor,
    fontWeight: FontWeight.w500);
