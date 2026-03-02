import 'dart:io';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/exporting/large_property_exporter.dart';
import 'package:flutter_app/src/sp-bloc/total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;

import '../sp-bloc/small_property_basic_info_bloc.dart';

class SmallPropertyExporter {
  static void exportMaterialAssessmentPDF(BuildContext context) async {
    final exporter = _exporterFromState(context);
    await LargePropertyExporter.loadFontsIfNeeded();

    final filePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Tallenna PDF tiedosto',
      fileName: 'purkumateriaalien_arviointilaskelma.pdf',
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePath == null) return;
    final correctedPath = path.setExtension(filePath, '.pdf');
    final file = File(correctedPath);

    exporter.writeAsPdfSync(file,
        fontRegularByteData: LargePropertyExporter.fontRegular,
        fontBoldByteData: LargePropertyExporter.fontBold);
  }

  static void exportMaterialAssessmentExcel(BuildContext context) async {
    final exporter = _exporterFromState(context);
    await LargePropertyExporter.loadFontsIfNeeded();

    final filePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Tallenna Excel tiedosto',
      fileName: 'purkumateriaalien_arviointilaskelma.xlsx',
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (filePath == null) return;
    final correctedPath = path.setExtension(filePath, '.xlsx');
    final file = File(correctedPath);

    exporter.writeAsExcelSync(file);
  }

  static SmallPropertiesDemolitionWasteReportExporter _exporterFromState(
      BuildContext context) {
    final totalDemolitionWasteAndCosts =
        context.read<SmallPropertiesTotalDemolitionWasteAndCostsBloc>().state;
    final evaluationInfo = context.read<SmallPropertyBasicInfoBloc>().state;

    return SmallPropertiesDemolitionWasteReportExporter(
        totalDemolitionWasteAndCosts: totalDemolitionWasteAndCosts,
        evaluationInfo: evaluationInfo);
  }
}
