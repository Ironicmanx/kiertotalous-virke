import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';
import 'hint.dart';

part 'report_table.freezed.dart';

@freezed
abstract class ReportTable with _$ReportTable {
  const ReportTable._();

  const factory ReportTable(
      {required List<ReportTableRow> rows,
      @Default(Hint.none) Hint hint}) = _ReportTable;
}
