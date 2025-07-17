import 'package:flutter/material.dart';
import 'package:genz_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:genz_store/utils/constants/colors.dart';
import 'package:genz_store/utils/helpers/helper_functions.dart';

/// Most of the Styling is already defined in the Utils -> Themes -> ChipTheme.dart
class SLChoiceChip extends StatelessWidget {
  const SLChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = SLHelperFunctions.getColor(text) != null;

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? SLColors.white : null),
        avatar: isColor
            ? SLCircularContainer(width: 50, height: 50, backgroundColor: SLHelperFunctions.getColor(text)!,)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? SLHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}