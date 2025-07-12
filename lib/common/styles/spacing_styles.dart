import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/sizes.dart';

class SLSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: SLSizes.appBarHeight,
    left: SLSizes.defaultSpace,
    right: SLSizes.defaultSpace,
    bottom: SLSizes.defaultSpace,
  );
}