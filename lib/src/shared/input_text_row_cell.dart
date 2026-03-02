import 'package:flutter/material.dart';

class InputTextRowCell extends StatefulWidget {
  final String label;
  final String? initialValue;
  final void Function(String) setter;

  const InputTextRowCell({
    super.key,
    required this.label,
    this.initialValue,
    required this.setter,
  });

  @override
  State<InputTextRowCell> createState() => _InputRowCellState();
}

class _InputRowCellState extends State<InputTextRowCell> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.label,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
          textAlign: TextAlign.start,
          maxLines: null, // Allows the field to grow vertically
          keyboardType: TextInputType.multiline, // Enables multiline input
          onChanged: widget.setter,
        ),
      ),
    );
  }
}
