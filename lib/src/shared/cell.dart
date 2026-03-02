import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/error_cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';

/// This class serves the purpose of being syntactic sugar for creating cells
/// of different types.
abstract class Cell extends Widget {
  factory Cell.empty() {
    return EmptyCell();
  }

  factory Cell.row(
          {dynamic initialValue,
          bool checkbox = false,
          String? checkboxTitle,
          Function? checkboxSetter,
          bool? checkboxValue,
          Widget? iconButton}) =>
      RowCell(
          initialValue: initialValue,
          checkbox: checkbox,
          checkboxTitle: checkboxTitle,
          checkboxSetter: checkboxSetter,
          checkboxValue: checkboxValue,
          iconButton: iconButton);

  factory Cell.column({required String initialValue, Widget? iconButton}) =>
      ColumnCell(
        initialValue: initialValue,
        iconButton: iconButton,
      );

  factory Cell.input({
    required num? initialValue,
    required Function setter,
    bool integer = false,
    bool percentage = false,
    bool enabled = true,
  }) =>
      InputCell(
        initialValue: initialValue,
        setter: setter,
        integer: integer,
        percentage: percentage,
        enabled: enabled,
      );

  factory Cell.output({
    required Function getter,
    bool percentage = false,
  }) =>
      OutputCell(
        getter: getter,
        percentage: percentage,
      );

  factory Cell.menu({
    required dynamic initialValue,
    required List<DropdownMenuItem<dynamic>> items,
    required void Function(dynamic) setter,
  }) =>
      MenuCell<dynamic>(
        setter: setter,
        initialValue: initialValue,
        items: items,
      );

  factory Cell.grey() => GreyCell();

  factory Cell.header({required String initialValue, Widget? iconButton}) =>
      HeaderCell(initialValue: initialValue, iconButton: iconButton);

  factory Cell.error({
    required List<num?> Function() getters,
  }) =>
      ErrorCell(getters: getters);
}
