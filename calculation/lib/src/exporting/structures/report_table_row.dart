import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'report_table_row.freezed.dart';

@freezed
abstract class ReportTableRow with _$ReportTableRow {
  const factory ReportTableRow(
      {@Default(true) bool borders,
      @Default(20) double height,
      required List<ReportCell> cells}) = _ReportTableRow;
}
