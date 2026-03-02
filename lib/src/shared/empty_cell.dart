import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

class EmptyCell extends StatelessWidget implements Cell {
  const EmptyCell({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand();
  }
}
