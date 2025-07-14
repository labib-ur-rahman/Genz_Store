import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class SLCurvedEdgeWidget extends StatelessWidget {
  const SLCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SLCustomCurvedEdges(),
      child: child,
    );
  }
}