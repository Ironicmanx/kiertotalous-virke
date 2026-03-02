import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../large_properties/waste_law_demolition_material_estimates/exports.dart';
import '../large_properties/waste_law_demolition_material_estimates/total/exports.dart';
import 'report_exporters/excel_report_exporter.dart';
import 'report_exporters/pdf_report_exporter.dart';
import 'structures/exports.dart';
import 'structures/text_align.dart';

part 'waste_law_report_exporter.freezed.dart';

/// 'Jätelain mukainen taulukko' report table according to waste law
@freezed
abstract class WasteLawReportExporter with _$WasteLawReportExporter {
  WasteLawReportExporter._();

  factory WasteLawReportExporter(
      {TotalConcreteBricksTilesCeramics? totalConcreteBricksTilesCeramics,
      TotalWoodGlassPlastics? totalWoodGlassPlastics,
      TotalBituminousMixturesCoalTarProducts?
          totalBituminousMixturesCoalTarProducts,
      TotalMetalsAndAlloys? totalMetalsAndAlloys,
      TotalSoilAggregatesDredgingMaterials?
          totalSoilAggregatesDredgingMaterials,
      InsulationAndAsbestosContainingMaterials?
          insulationAndAsbestosContainingMaterials,
      GypsumBasedBuildingMaterials? gypsumBasedBuildingMaterials,
      TotalOtherMaterials? totalOtherMaterials}) = _WasteLawReportExporter;

  void writeAsExcelSync(File file) {
    final exporter = ExcelReportExporter(_report,
        sheetName: 'Jätelain mukainen taulukko',
        columnWidths: [
          17,
          50,
          10,
          10,
          45
        ],
        cellMerges: [
          (
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0),
            CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)
          ),
          (
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2),
            CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 2)
          )
        ]);
    file.writeAsBytesSync(exporter.export().encode()!);
  }

  void writeAsPdfSync(File file,
      {ByteData? fontRegularByteData, ByteData? fontBoldByteData}) {
    final exporter = PDFReportExporter(_report,
        sizeScale: 0.9,
        columnWidths: [17, 50, 10, 10, 45],
        fontRegularByteData: fontRegularByteData,
        fontBoldByteData: fontBoldByteData);
    exporter.export().save().then((val) => file.writeAsBytesSync(val));
  }

  ExportableReport get _report {
    return ExportableReport(tables: [
      ReportTable(hint: Hint.title, rows: [
        ReportTableRow(borders: false, height: 26, cells: [
          ReportCell(),
          ReportCell(
              value: 'Purkumateriaalien määrä arvio',
              wrapText: false,
              fontSize: 20,
              horizontalAlign: TextHorizontalAlign.center)
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(),
          ReportCell(value: 'Jätelaki 17.6.2011/646 ', wrapText: false)
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(),
          ReportCell(
              value:
                  '17 RAKENTAMISESSA JA PURKAMISESSA SYNTYVÄT JÄTTEET (PILAANTUNEILTA',
              wrapText: false)
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(),
          ReportCell(
              value: 'ALUEILTA KAIVETUT MAA-AINEKSET MUKAAN LUETTUINA)',
              wrapText: false)
        ])
      ]),
      ReportTable(rows: [
        ReportTableRow(cells: [
          ReportCell(value: 'Jätekoodi', bold: true),
          ReportCell(
              value:
                  'Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus',
              bold: true),
          ReportCell(value: 'Tilavuus (m3)', bold: true),
          ReportCell(value: 'Määrä-arvio (tonnia)', bold: true),
          ReportCell(value: 'Huomautuksia ja lisätietoja', bold: true)
        ], height: 45)
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 01', bold: true),
              ReportCell(
                  value: 'betoni, tiilet, laatat ja keramiikka', bold: true),
            ],
            height: 15),
        _wasteLawEntryRow(
            '17 01 01', 'betoni', totalConcreteBricksTilesCeramics?.concrete),
        _wasteLawEntryRow(
            '17 01 02', 'tiilet', totalConcreteBricksTilesCeramics?.brick),
        _wasteLawEntryRow('17 01 03', 'laatat ja keramiikka',
            totalConcreteBricksTilesCeramics?.ceramicTiles),
        _wasteLawEntryRow(
            '17 01 06*',
            'betonin, tiilten, laattojen ja keramiikan seokset tai lajitellut jakeet, jotka sisältävät vaarallisia aineita',
            totalConcreteBricksTilesCeramics
                ?.hazardousConcreteBrickTileCeramicMixtures),
        _wasteLawEntryRow(
            '17 01 07',
            'muut kuin nimikkeessä 17 01 06 mainitut betonin, tiilten, laattojen ja keramiikan seokset',
            totalConcreteBricksTilesCeramics?.otherMaterials),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 02', bold: true),
              ReportCell(value: 'puu, lasi ja muovit', bold: true),
            ],
            height: 15),
        _wasteLawEntryRow('17 02 01', 'puu', totalWoodGlassPlastics?.wood),
        _wasteLawEntryRow('17 02 02', 'lasi', totalWoodGlassPlastics?.glass),
        _wasteLawEntryRow('17 02 03', 'muovi', totalWoodGlassPlastics?.plastic),
        _wasteLawEntryRow(
            '17 02 04*',
            'lasi, muovi ja puu, jotka sisältävät vaarallisia aineita tai ovat niiden saastuttamia',
            totalWoodGlassPlastics?.otherDangerousOrContaminatedMaterial),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 03', bold: true),
              ReportCell(
                  value: 'bitumiseokset, kivihiiliterva ja -tervatuotteet',
                  bold: true),
            ],
            height: 15),
        _wasteLawEntryRow(
            '17 03 01*',
            'kivihiilitervaa sisältävät bitumiseokset',
            totalBituminousMixturesCoalTarProducts
                ?.coalTarContainingBituminousMixtures),
        _wasteLawEntryRow(
            '17 03 02',
            'muut kuin nimikkeessä 17 03 01 mainitut bitumiseokset',
            totalBituminousMixturesCoalTarProducts?.otherBituminousMixtures),
        _wasteLawEntryRow(
            '179/2012 39', '', totalBituminousMixturesCoalTarProducts?.unnamed),
        _wasteLawEntryRow('17 03 03*', 'kivihiiliterva ja -tervatuotteet',
            totalBituminousMixturesCoalTarProducts?.coalTarAndTarProducts),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 04', bold: true),
              ReportCell(
                  value:
                      'metallit, niiden seokset (lejeeringit) mukaan luettuina',
                  bold: true),
            ],
            height: 15),
        _wasteLawEntryRow('17 04 01', 'kupari, pronssi, messinki',
            totalMetalsAndAlloys?.copperBronzeAndBrass),
        _wasteLawEntryRow(
            '17 04 02', 'alumiini', totalMetalsAndAlloys?.aluminium),
        _wasteLawEntryRow('17 04 03', 'lyijy', totalMetalsAndAlloys?.lead),
        _wasteLawEntryRow('17 04 04', 'sinkki', totalMetalsAndAlloys?.zinc),
        _wasteLawEntryRow(
            '17 04 05', 'rauta ja teräs', totalMetalsAndAlloys?.ironAndSteel),
        _wasteLawEntryRow('17 04 06', 'tina', totalMetalsAndAlloys?.tin),
        _wasteLawEntryRow('17 04 07', 'sekalaiset metallit',
            totalMetalsAndAlloys?.mixedMetals),
        _wasteLawEntryRow(
            '17 04 09*',
            'metallijätteet, jotka ovat vaarallisten aineiden saastuttamia',
            totalMetalsAndAlloys?.contaminatedMetalWaste),
        _wasteLawEntryRow(
            '17 04 10*',
            'öljyä, kivihiilitervaa tai muita vaarallisia aineita sisältävät kaapelit',
            totalMetalsAndAlloys?.hazardousOilAndTarCables),
        _wasteLawEntryRow(
            '17 04 11',
            'muut kuin nimikkeessä 17 04 10 mainitut kaapelit',
            totalMetalsAndAlloys?.otherCables),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 05', bold: true),
              ReportCell(
                  value:
                      'maa-ainekset (pilaantuneilta alueilta kaivetut maa-ainekset mukaan luettuina), kiviainekset ja ruoppausmassat',
                  bold: true),
            ],
            height: 45),
        _wasteLawEntryRow(
            '17 05 03*',
            'maa- ja kiviainekset, jotka sisältävät vaarallisia aineita',
            totalSoilAggregatesDredgingMaterials?.hazardousSoilAndRock),
        _wasteLawEntryRow(
            '17 05 04',
            'muut kuin nimikkeessä 17 05 03 mainitut maa- ja kiviainekset',
            totalSoilAggregatesDredgingMaterials?.soilAndRock),
        _wasteLawEntryRow(
            '17 05 05*',
            'ruoppausmassat, jotka sisältävät vaarallisia aineita',
            totalSoilAggregatesDredgingMaterials?.hazardousDredgingSpoil),
        _wasteLawEntryRow(
            '17 05 06',
            'muut kuin nimikkeessä 17 05 05 mainitut ruoppausmassat',
            totalSoilAggregatesDredgingMaterials?.dredgingSpoil),
        _wasteLawEntryRow(
            '17 05 07*',
            'ratapenkereiden sorapäällysteet, jotka sisältävät vaarallisia aineita',
            totalSoilAggregatesDredgingMaterials?.hazardousRailwayBallast),
        _wasteLawEntryRow(
            '17 05 08',
            'muut kuin nimikkeessä 17 05 07 mainitut ratapenkereiden sorapäällysteet',
            totalSoilAggregatesDredgingMaterials?.railwayBallast),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 06', bold: true),
              ReportCell(
                  value: 'eristysaineet ja asbestia sisältävät rakennusaineet',
                  bold: true),
            ],
            height: 15),
        _wasteLawEntryRow(
            '17 06 01*',
            'asbestia sisältävät eristysaineet',
            insulationAndAsbestosContainingMaterials
                ?.asbestosContainingInsulationMaterials),
        _wasteLawEntryRow(
            '17 06 03*',
            'muut eristysaineet, jotka koostuvat vaarallisista aineista tai sisältävät niitä',
            insulationAndAsbestosContainingMaterials
                ?.otherHazardousInsulationMaterials),
        _wasteLawEntryRow(
            '17 06 04',
            'muut kuin nimikkeissä 17 06 01 ja 17 06 03 mainitut eristysaineet',
            insulationAndAsbestosContainingMaterials?.otherInsulationMaterials),
        _wasteLawEntryRow(
            '17 06 05*',
            'asbestia sisältävät rakennusaineet',
            insulationAndAsbestosContainingMaterials
                ?.asbestosContainingBuildingMaterials),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 08', bold: true),
              ReportCell(value: 'kipsipohjaiset rakennusaineet', bold: true),
            ],
            height: 15),
        _wasteLawEntryRow(
            '17 08 01*',
            'kipsipohjaiset rakennusaineet, jotka ovat vaarallisten aineiden saastuttamia',
            gypsumBasedBuildingMaterials?.contaminatedGypsumBasedMaterials),
        _wasteLawEntryRow(
            '17 08 02',
            'muut kuin nimikkeessä 17 08 01 mainitut kipsipohjaiset rakennusaineet',
            gypsumBasedBuildingMaterials?.otherGypsumBasedMaterials),
      ]),
      ReportTable(rows: [
        ReportTableRow(
            borders: false,
            cells: [
              ReportCell(value: '17 09', bold: true),
              ReportCell(
                  value: 'muut rakentamisessa ja purkamisessa syntyvät jätteet',
                  bold: true),
            ],
            height: 15),
        _wasteLawEntryRow(
            '17 09 01*',
            'rakentamisessa ja purkamisessa syntyvät jätteet, jotka sisältävät elohopeaa',
            totalOtherMaterials?.mercuryContainingMaterials),
        _wasteLawEntryRow(
            '17 09 02*',
            'rakentamisessa ja purkamisessa syntyvät jätteet, jotka sisältävät PCB:tä (kuten PCB:tä sisältävät tiivistysmassat, PCB:tä sisältävät hartsipohjaiset lattiapäällysteet, PCB:tä sisältävät umpiolasit ja PCB:tä sisältävät muuntajat',
            totalOtherMaterials?.pcbContainingDemolitionWaste,
            height: 90),
        _wasteLawEntryRow(
            '17 09 03*',
            'muut rakentamisessa ja purkamisessa syntyvät jätteet (sekalaiset jätteet mukaan luettuna), jotka sisältävät vaarallisia aineita',
            totalOtherMaterials?.otherHazardousDemolitionWaste,
            height: 45),
        _wasteLawEntryRow(
            '17 09 04',
            'muut kuin nimikkeissä 17 09 01, 17 09 02 ja 17 09 03 mainitut rakentamisessa ja purkamisessa syntyvät sekalaiset jätteet',
            totalOtherMaterials?.otherDemolitionWaste,
            height: 45)
      ]),
    ]);
  }

  ReportTableRow _wasteLawEntryRow(String wasteCode, String description,
      WasteLawDemolitionMaterialEstimateEntry? item,
      {double height = 40}) {
    return ReportTableRow(cells: [
      ReportCell(value: wasteCode),
      ReportCell(value: description),
      ReportCell(value: item?.volume),
      ReportCell(value: item?.tons),
      ReportCell(value: item?.notes),
    ], height: 40);
  }
}
