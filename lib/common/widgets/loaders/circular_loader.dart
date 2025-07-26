import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class SLCircularLoader extends StatelessWidget {
  final double size;

  const SLCircularLoader({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [SLColors.success, Color(0xFF81C784)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}