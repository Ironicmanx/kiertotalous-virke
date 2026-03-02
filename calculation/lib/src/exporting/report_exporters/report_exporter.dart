import '../structures/exports.dart';

/// Defines the interface for exporting reports. The implementations are responsible
/// for the exporting functionality.
abstract class ReportExporter<T> {
  final ExportableReport report;

  const ReportExporter(this.report);

  T export();
}
