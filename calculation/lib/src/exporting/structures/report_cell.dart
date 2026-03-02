import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'hint.dart';
import 'text_align.dart';

part 'report_cell.freezed.dart';

@freezed
abstract class ReportCell with _$ReportCell {
  ReportCell._();

  factory ReportCell(
      {@Default('') dynamic value,
      @Default(11) double fontSize,
      @Default('Calibri') String fontFamily,
      @Default(true) bool wrapText,
      @Default(false) bool bold,
      @Default(TextHorizontalAlign.left) TextHorizontalAlign horizontalAlign,
      @Default(TextVerticalAlign.bottom) TextVerticalAlign verticalAlign,
      @Default(Hint.none) Hint hint,
      @Default(false) bool red}) = _ReportCell;

  CellValue get valueAsExcelValue {
    if (value is int) {
      return IntCellValue(value);
    } else if (value is double) {
      return DoubleCellValue(value);
    } else if (value is DateTime) {
      final dateValue = value as DateTime;
      return DateCellValue(
          year: dateValue.year, month: dateValue.month, day: dateValue.day);
    }

    return TextCellValue(value == null ? '' : value.toString());
  }

  String get valueString {
    if (value == null) {
      return '';
    } else if (value is int) {
      return value.toString();
    } else if (value is double) {
      return value.toStringAsFixed(2);
    } else if (value is DateTime) {
      final valueDate = value as DateTime;
      return "${valueDate.day}/${valueDate.month}/${valueDate.year}";
    }

    return value.toString();
  }

  NumFormat get excelFormat {
    if (value is num) {
      return NumFormat.standard_2;
    } else if (value is DateTime) {
      return NumFormat.defaultDate;
    }

    return NumFormat.standard_0;
  }
}
