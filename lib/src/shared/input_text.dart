import 'package:flutter/material.dart';

import '../../log.dart';

class InputText extends StatefulWidget {
  const InputText(
      {super.key,
      required this.label,
      this.initialValue,
      this.width,
      this.setter});

  final String label;
  final String? initialValue;
  final num? width;
  final Function? setter;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? '';
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _controller.text = widget.initialValue ?? '';
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void setValue(String value) {
    if (widget.setter == null) {
      return;
    }

    widget.setter!(value);
    logger.d(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Täytä kenttä";
        }
        return null;
      },
      onChanged: (value) => setValue(value),
    );
  }
}
