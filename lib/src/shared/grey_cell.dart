import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

class GreyCell extends StatelessWidget implements Cell {
  const GreyCell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFB9B9B9),
        border: Border.all(
          width: 1,
        ),
      ),
    );
  }
}
