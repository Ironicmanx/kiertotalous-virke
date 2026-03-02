import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

class ColumnCell extends StatelessWidget implements Cell {
  const ColumnCell({super.key, required this.initialValue, this.iconButton});

  final String initialValue;
  final Widget? iconButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Expands to fill available width
      height: double.infinity, // Expands to fill available height
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 231, 228, 228),
        border: Border.fromBorderSide(
          BorderSide(width: 1),
        ),
      ),
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
                  initialValue,
                  style: const TextStyle(fontWeight: FontWeight.w400),
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
