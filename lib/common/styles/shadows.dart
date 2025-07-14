import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';

class SLShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: SLColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: SLColors.darkGrey.withOpacity(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

}