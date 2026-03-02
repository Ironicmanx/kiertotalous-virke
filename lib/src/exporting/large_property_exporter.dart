import 'dart:io';
import 'dart:typed_data';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app/src/lp-bloc/gypsym_based_building_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/insulation_and_asbestos_containing_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_property_basic_info_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_bituminous_mixtures_coal_tar_products_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_concrete_bricks_tiles_ceramics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_metals_and_alloys_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_other_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_soil_aggregates_dredging_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_wood_glass_plastics_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;

class LargePropertyExporter {
  static ByteData? fontRegular;
  static ByteData? fontBold;

  static void exportMaterialAssessmentPDF(BuildContext context) async {
    final total = context.read<TotalDemolitionWasteAndCostsBloc>().state;
    final info = context.read<LargePropertyBasicInfoBloc>().state;

    await loadFontsIfNeeded();

    final filePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Tallenna PDF tiedosto',
      fileName: 'purkumateriaalien_arviointilaskelma.pdf',
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePath == null) return;

    final correctedPath = path.setExtension(filePath, '.pdf');
    final file = File(correctedPath);

    final demolitionExporter = DemolitionMaterialAssessmentReportExporter(
      totalDemolitionWasteAndCosts: total,
      largePropertyEvaluationInfo: info,
    );
    demolitionExporter.writeAsPdfSync(file,
        fontRegularByteData: fontRegular, fontBoldByteData: fontBold);
  }

  static void exportWasteLawPDF(BuildContext context) async {
    final totalConcrete =
        context.read<TotalConcreteBricksTilesCeramicsBloc>().state;
    final totalWoodGlass = context.read<TotalWoodGlassPlasticsBloc>().state;
    final totalBituminous =
        context.read<TotalBituminousMixturesCoalTarProductsBloc>().state;
    final totalMetals = context.read<TotalMetalsAndAlloysBloc>().state;
    final totalSoil =
        context.read<TotalSoilAggregatesDredgingMaterialsBloc>().state;
    final totalInsulation =
        context.read<InsulationAndAsbestosContainingMaterialsBloc>().state;
    final totalGypsum = context.read<GypsumBasedBuildingMaterialsBloc>().state;
    final totalOther = context.read<TotalOtherMaterialsBloc>().state;

    await loadFontsIfNeeded();

    final filePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Tallenna PDF tiedosto',
      fileName: 'jatelain_mukainen_purkumateriaalien_arviointilaskelma.pdf',
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePath == null) return;

    final correctedPath = path.setExtension(filePath, '.pdf');
    final file = File(correctedPath);

    final wasteExporter = WasteLawReportExporter(
      totalConcreteBricksTilesCeramics: totalConcrete,
      totalWoodGlassPlastics: totalWoodGlass,
      totalBituminousMixturesCoalTarProducts: totalBituminous,
      totalMetalsAndAlloys: totalMetals,
      totalSoilAggregatesDredgingMaterials: totalSoil,
      insulationAndAsbestosContainingMaterials: totalInsulation,
      gypsumBasedBuildingMaterials: totalGypsum,
      totalOtherMaterials: totalOther,
    );

    wasteExporter.writeAsPdfSync(file,
        fontRegularByteData: fontRegular, fontBoldByteData: fontBold);
  }

  static void exportMaterialAssessmentExcel(BuildContext context) async {
    final total = context.read<TotalDemolitionWasteAndCostsBloc>().state;
    final info = context.read<LargePropertyBasicInfoBloc>().state;

    final filePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Tallenna Excel tiedosto',
      fileName: 'purkumateriaalien_arviointilaskelma.xlsx',
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (filePath == null) return;

    final correctedPath = path.setExtension(filePath, '.xlsx');
    final file = File(correctedPath);

    final demolitionExporter = DemolitionMaterialAssessmentReportExporter(
      totalDemolitionWasteAndCosts: total,
      largePropertyEvaluationInfo: info,
    );
    demolitionExporter.writeAsExcelSync(file);
  }

  static void exportWasteLawExcel(BuildContext context) async {
    final totalConcrete =
        context.read<TotalConcreteBricksTilesCeramicsBloc>().state;
    final totalWoodGlass = context.read<TotalWoodGlassPlasticsBloc>().state;
    final totalBituminous =
        context.read<TotalBituminousMixturesCoalTarProductsBloc>().state;
    final totalMetals = context.read<TotalMetalsAndAlloysBloc>().state;
    final totalSoil =
        context.read<TotalSoilAggregatesDredgingMaterialsBloc>().state;
    final totalInsulation =
        context.read<InsulationAndAsbestosContainingMaterialsBloc>().state;
    final totalGypsum = context.read<GypsumBasedBuildingMaterialsBloc>().state;
    final totalOther = context.read<TotalOtherMaterialsBloc>().state;

    final filePath = await FilePicker.platform.saveFile(
      dialogTitle: 'Tallenna Excel tiedosto',
      fileName: 'jatelain_mukainen_purkumateriaalien_arviointilaskelma.xlsx',
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (filePath == null) return;

    final correctedPath = path.setExtension(filePath, '.xlsx');
    final file = File(correctedPath);

    final wasteExporter = WasteLawReportExporter(
      totalConcreteBricksTilesCeramics: totalConcrete,
      totalWoodGlassPlastics: totalWoodGlass,
      totalBituminousMixturesCoalTarProducts: totalBituminous,
      totalMetalsAndAlloys: totalMetals,
      totalSoilAggregatesDredgingMaterials: totalSoil,
      insulationAndAsbestosContainingMaterials: totalInsulation,
      gypsumBasedBuildingMaterials: totalGypsum,
      totalOtherMaterials: totalOther,
    );

    wasteExporter.writeAsExcelSync(file);
  }

  static Future<dynamic> loadFontsIfNeeded() async {
    if (fontRegular == null) {
      final regularBytes =
          await rootBundle.load('assets/fonts/Carlito-Regular.ttf');
      final boldBytes = await rootBundle.load('assets/fonts/Carlito-Bold.ttf');
      fontRegular = regularBytes.buffer.asByteData();
      fontBold = boldBytes.buffer.asByteData();
    }
  }
}
