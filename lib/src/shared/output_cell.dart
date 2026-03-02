import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';

class OutputCell extends StatelessWidget implements Cell {
  const OutputCell(
      {super.key,
      required this.getter,
      this.percentage = false,
      this.integer = false});

  final Function getter;
  final bool percentage; // Used for Percentage display instead of value
  final bool integer;

  static final _decorationNormal = BoxDecoration(
      color: Color(0xFFB9B9B9),
      border: Border.all(
        width: 1,
      ));

  static final _decorationError = BoxDecoration(
    color: Colors.red.shade100,
    border: Border.all(width: 1, color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    final error = getter() == double.infinity;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: error ? _decorationError : _decorationNormal,
      child: Center(
        child: Text(
            style: error ? TextStyle(color: Colors.red) : TextStyle(),
            _formatValue(getter())),
      ),
    );
  }

  String _formatValue(dynamic value) {
    if (value == double.infinity) {
      return 'Nollajako';
    }

    if (percentage) {
      return _formatPercentageValue(value);
    }

    return value == null ? _formatNullValue(value) : _formatNonNullValue(value);
  }

  String _formatPercentageValue(dynamic value) {
    if (value == null) {
      return integer == true ? '0 %' : '0,0 %';
    }

    if (value is! num) {
      return value.toString();
    }

    return integer
        ? "${_toStringFixed(value, 0)} %"
        : "${_toStringFixed(value, 2)} %";
  }

  String _formatNullValue(dynamic value) {
    return integer ? '0' : '0,0';
  }

  String _formatNonNullValue(dynamic value) {
    if (value is! num) {
      return value.toString();
    }

    return integer ? _toStringFixed(value, 0) : _toStringFixed(value, 2);
  }

  String _toStringFixed(num value, int decimals) {
    final str = value.toStringAsFixed(decimals);
    return str.replaceAll('.', ',');
  }
}
