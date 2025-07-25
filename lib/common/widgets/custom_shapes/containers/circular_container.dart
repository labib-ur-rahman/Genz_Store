import 'package:flutter/material.dart';
import 'package:genz_store/utils/constants/colors.dart';

class SLCircularContainer extends StatelessWidget {

  const SLCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.margin,
    this.padding = 0,
    this.backgroundColor = SLColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build (BuildContext context) {
    return Container (
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular (radius),
        color: backgroundColor,
      ), // BoxDecoration
      child: child,
    ); // Container
  }
}