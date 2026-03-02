import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

/// Meant to be above a form and its related guidance text or images.
class FormHeader extends StatelessWidget implements Cell {
  const FormHeader({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    );
  }
}
