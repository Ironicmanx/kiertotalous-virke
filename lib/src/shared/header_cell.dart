import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

/// Meant to use in top left cell of a form.
class HeaderCell extends StatelessWidget implements Cell {
  const HeaderCell({super.key, required this.initialValue, this.iconButton});

  final Widget? iconButton;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Expands to fill available width
      height: double.infinity, // Expands to fill available height
      decoration: BoxDecoration(border: Border.all(width: 1)), // Main border
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Ensures full height is used
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft, // Align text to the left
                child: Text(
                  initialValue.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            if (iconButton != null) iconButton!,
          ],
        ),
      ),
    );
  }
}
