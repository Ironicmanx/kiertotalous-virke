import 'package:excel/excel.dart';

import '../structures/exports.dart';
import '../structures/text_align.dart';
import 'report_exporter.dart';

class ExcelReportExporter extends ReportExporter<Excel> {
  final String sheetName;
  final List<double>? columnWidths;
  final List<(CellIndex, CellIndex)>? cellMerges;

  const ExcelReportExporter(super.report,
      {required this.sheetName, this.columnWidths, this.cellMerges});

  @override
  Excel export() {
    final excel = Excel.createExcel();
    excel.rename('Sheet1', sheetName);
    final sheet = excel.sheets[sheetName]!;
    var rowIndex = 0;
    var columnIndex = 0;

    if (columnWidths != null) {
      for (int i = 0; i < columnWidths!.length; i++) {
        sheet.setColumnWidth(i, columnWidths![i]);
      }
    }

    for (final table in report.tables) {
      for (final row in table.rows) {
        for (final cell in row.cells) {
          final excelCell = sheet.cell(CellIndex.indexByColumnRow(
              columnIndex: columnIndex, rowIndex: rowIndex));

          excelCell.value = cell.valueAsExcelValue;
          excelCell.cellStyle = CellStyle(
              bold: cell.bold,
              fontColorHex: cell.red ? ExcelColor.red : ExcelColor.black,
              horizontalAlign: getCellHorizontalAlign(cell),
              verticalAlign: getCellVerticalAlign(cell),
              textWrapping:
                  cell.wrapText ? TextWrapping.WrapText : TextWrapping.Clip,
              topBorder: getRowBorderStyle(row),
              rightBorder: getRowBorderStyle(row),
              bottomBorder: getRowBorderStyle(row),
              leftBorder: getRowBorderStyle(row),
              fontSize: cell.fontSize.toInt(),
              fontFamily: cell.fontFamily,
              numberFormat: cell.excelFormat);

          columnIndex += 1;
        }

        sheet.setRowHeight(rowIndex, row.height);

        rowIndex += 1;
        columnIndex = 0;
      }

      rowIndex += 1;
    }

    if (cellMerges != null) {
      for (var cellMerge in cellMerges!) {
        sheet.merge(cellMerge.$1, cellMerge.$2);
      }
    }

    return excel;
  }

  static Border getRowBorderStyle(ReportTableRow row) {
    return row.borders
        ? Border(borderStyle: BorderStyle.Thin)
        : Border(borderStyle: BorderStyle.None);
  }

  static HorizontalAlign getCellHorizontalAlign(ReportCell cell) {
    switch (cell.horizontalAlign) {
      case TextHorizontalAlign.left:
        return HorizontalAlign.Left;
      case TextHorizontalAlign.right:
        return HorizontalAlign.Right;
      case TextHorizontalAlign.center:
        return HorizontalAlign.Center;
    }
  }

  static VerticalAlign getCellVerticalAlign(ReportCell cell) {
    switch (cell.verticalAlign) {
      case TextVerticalAlign.top:
        return VerticalAlign.Top;
      case TextVerticalAlign.center:
        return VerticalAlign.Center;
      case TextVerticalAlign.bottom:
        return VerticalAlign.Bottom;
    }
  }
}
