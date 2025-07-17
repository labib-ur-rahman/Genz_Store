import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:genz_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:genz_store/utils/constants/colors.dart';

class SLPrimaryHeaderContainer extends StatelessWidget {
  const SLPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SLCurvedEdgeWidget(
      child: Container(
        color: SLColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(top: -150, right: -250, child: SLCircularContainer(backgroundColor: SLColors.textWhite.withOpacity(0.1),),),
            Positioned(top: 100, right: -300, child: SLCircularContainer(backgroundColor: SLColors.textWhite.withOpacity(0.1),),),
            child,
          ],
        ),
      ),
    );
  }
}