import 'package:flutter/material.dart';

class LightGreyCell extends StatelessWidget {
  const LightGreyCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 231, 228, 228),
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: const Center(),
    );
  }
}
