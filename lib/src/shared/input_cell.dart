import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/shared/cell.dart';

class InputCell extends StatefulWidget implements Cell {
  const InputCell({
    super.key,
    required this.initialValue,
    required this.setter,
    this.integer = false,
    this.percentage = false,
    this.enabled = true,
  });

  final num? initialValue;
  final Function setter;
  final bool integer;
  final bool percentage;
  final bool enabled;

  @override
  State<InputCell> createState() => _InputCellState();
}

class _InputCellState extends State<InputCell> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  void setIntValue(String value) {
    int? number = int.tryParse(value);
    widget.setter(number ?? 0);
  }

  /// Changes TextController's text to double format that dart understands
  /// and sets it via callback setter.
  void setDoubleValue(String value) {
    logger.d('Controller value: ${_controller.text}');
    var formattedValue = '0';
    // replace comma with period
    if (value.isNotEmpty) {
      formattedValue = value.replaceFirst(RegExp(','), '.');
      // add a trailing zero if it is missing
      if (formattedValue[formattedValue.length - 1] == '.') {
        formattedValue = '${formattedValue}0';
      }
    }

    // cast to double
    num castedValue = double.parse(formattedValue);
    // set new value to form
    widget.setter(castedValue);
    logger.d(castedValue);
  }

  List<TextInputFormatter> formatters() {
    if (widget.integer) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    return [
      FilteringTextInputFormatter.allow(RegExp(widget.percentage
          ? r'([0-9]+([,][0-9]*)?)'
          : r'([0-9]+([,][0-9]*)?|[,][0-9]+)')),
    ];
  }

  /// Formats controller's text to displayable format and updates [_controller].
  void formatDisplayedValue() {
    if (widget.initialValue == null || widget.initialValue == 0) {
      _controller.text = widget.percentage ? '0 %' : '0';
      return;
    }
    // format text to always have at least 1 decimal
    if (!widget.integer) {
      final split = widget.initialValue!.toString().split('.');

      if (split.length > 1) {
        final decimals = split[1].length;
        _controller.text = widget.initialValue!.toStringAsFixed(decimals);
        _controller.text = _controller.text.replaceFirst('.', ',');
      } else {
        // It might be that the initial value has no decimals even if it is not
        // an integer.
        _controller.text = "${widget.initialValue!.toString()},0";
      }
    }
    // no decimals for integers - serves purpose of removing leading zeros
    if (widget.integer) {
      _controller.text = widget.initialValue!.toStringAsFixed(0);
    }
    // add a trailing % to percentage cells if it doesn't exist yet
    if (widget.percentage && !_controller.text.endsWith('%')) {
      _controller.text = '${_controller.text} %';
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    formatDisplayedValue();
    _focusNode = FocusNode();
    // format display value when widget loses focus
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        formatDisplayedValue();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: TextField(
            focusNode: _focusNode,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) =>
                widget.integer ? setIntValue(value) : setDoubleValue(value),
            // select all text when cell gains focus.
            // this is ux feature and can be turned off if that seems better.
            onTap: () => _controller.selection = TextSelection(
              baseOffset: 0,
              extentOffset: _controller.value.text.length,
            ),
            controller: _controller,
            inputFormatters: formatters(),
            enabled: widget.enabled,
          ),
        ),
      ),
      // ),
    );
  }
}
