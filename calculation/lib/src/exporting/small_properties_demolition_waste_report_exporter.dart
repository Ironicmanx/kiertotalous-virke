import 'dart:io';
import 'dart:typed_data';

import 'package:bl_demolition_materials/src/exporting/report_exporters/excel_report_exporter.dart';
import 'package:bl_demolition_materials/src/exporting/report_exporters/pdf_report_exporter.dart';
import 'package:bl_demolition_materials/src/exporting/structures/exports.dart';
import 'package:bl_demolition_materials/src/exporting/structures/text_align.dart';
import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../bl_demolition_materials.dart';

part 'small_properties_demolition_waste_report_exporter.freezed.dart';

@freezed
abstract class SmallPropertiesDemolitionWasteReportExporter
    with _$SmallPropertiesDemolitionWasteReportExporter {
  SmallPropertiesDemolitionWasteReportExporter._();

  factory SmallPropertiesDemolitionWasteReportExporter(
          {SmallPropertiesTotalDemolitionWasteAndCosts?
              totalDemolitionWasteAndCosts,
          SmallPropertyEvaluationInfo? evaluationInfo}) =
      _SmallPropertiesDemolitionWasteReportExporter;

  void writeAsExcelSync(File file) {
    final exporter = ExcelReportExporter(_report,
        sheetName: 'Purkukohteen jätteet',
        columnWidths: [
          30,
          8.5,
          8.5,
          40,
          8.5,
          8.5,
          8.5,
          8.5
        ],
        cellMerges: [
          (
            CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
            CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)
          ),
          (
            CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
            CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 1)
          ),
          (
            CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 9),
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 9)
          )
        ]);
    file.writeAsBytesSync(exporter.export().encode()!);
  }

  void writeAsPdfSync(File file,
      {ByteData? fontRegularByteData, ByteData? fontBoldByteData}) {
    final exporter = PDFReportExporter(_report,
        columnWidths: [30, 8.5, 8.5, 40, 8.5, 8.5, 8.5, 8.5],
        sizeScale: 0.9,
        fontRegularByteData: fontRegularByteData,
        fontBoldByteData: fontBoldByteData);
    exporter.export().save().then((val) => file.writeAsBytesSync(val));
  }

  ExportableReport get _report {
    final reus =
        totalDemolitionWasteAndCosts?.totalReusableAndRecyclableMaterials;
    final recy =
        totalDemolitionWasteAndCosts?.totalRecyclableComponentsAndFurniture;
    final disp =
        totalDemolitionWasteAndCosts?.totalDisposalMaterialsAndHazardousWaste;
    final tot = totalDemolitionWasteAndCosts;

    return ExportableReport(tables: [
      ReportTable(hint: Hint.title, rows: [
        ReportTableRow(borders: false, height: 21, cells: [
          ReportCell(
            value: 'Purkukohteen kierrätys ja jätemateriaalit',
            bold: true,
            fontSize: 16,
          )
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
            value: 'PURKUKOHTEEN TIEDOT JA MATERIAALIT',
            bold: true,
          )
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
            value: 'Kohteen nimi',
            bold: true,
          )
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
            value: evaluationInfo?.propertyName,
          )
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
            value: 'Rakennustyyppi',
            bold: true,
          ),
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
            value: evaluationInfo?.buildingType,
          ),
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
            value: 'Osoite',
            bold: true,
          )
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
            value: evaluationInfo?.address,
          )
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(borders: false, cells: [
          ReportCell(
              red: true,
              bold: true,
              value: (evaluationInfo?.isHazardousSubstanceSurveyDone ?? false)
                  ? 'HAITTA-AINE KARTOITUS ON TEHTY'
                  : 'HAITTA-AINE KARTOITUSTA EI OLE TEHTY')
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 75, cells: [
          ReportCell(
              value: 'HYÖDYNTÄMISKELPOISET JA KIERRÄTETTÄVÄT MATERIAALIT',
              verticalAlign: TextVerticalAlign.center,
              horizontalAlign: TextHorizontalAlign.center,
              bold: true),
          ReportCell(
              value: 'Määrä-arvio (tonnia)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(),
          ReportCell(
              value: 'Hyödyntäminen, käsittely / loppusijoituspaikka',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Käsittely- ja purkukustannus (€/tonni)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Purkukustannus/materiaalierä (€)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Materiaalin arvo (€/tonni)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Materiaalierän hinta (€)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
        ]),
        _reusRow('Maa-ainekset', reus?.cleanSoil),
        _reusRow('Asfalttijäte', reus?.asphaltWaste),
        _reusRow('Puhdas betoni', reus?.cleanConcrete),
        _reusRow(
            'Betoniteräkset, peltikatto ja muu teräsromu', reus?.steel, 30),
        _reusRow('Seinä- ja kattotiilet', reus?.wallAndRoofTiles),
        _reusRow('Puhdas käyttökelpoinen puu', reus?.cleanUsableWood),
        _reusRow('Polttokelppoinen puujäte', reus?.combustibleWoodWaste),
        _reusRow('Tuulesuojalevyt (bituliitti tai vastaava)',
            reus?.windProtectionBoard, 30),
        _reusRow('Lasi- ja mineraalieristevilla', reus?.glassAndMineralWool),
        _reusRow('Kipsilevyt (cyproc)', reus?.gypsumBoards),
        _reusRow('Lastulevy', reus?.chipboard),
        _reusRow('Energiajäte, maalattupuu, kattohuopa ja aluskate',
            reus?.energyWaste, 27),
        _reusRow('Lasi', reus?.glass),
        _reusRow('Alumiini', reus?.aluminium),
        _reusRow('Muu metalliromu, sähkökaapit, liedet, jääkaapit yms.',
            reus?.rebarAndSteelScrap, 30),
        _reusRow('Ruostumaton teräs', reus?.stainlessSteel),
        _reusRow('Kupari', reus?.copper),
        _reusRow('Betoniset pihalaata ja muurikivet', reus?.concreteBlocks),
        ReportTableRow(height: 30, cells: [
          ReportCell(value: 'HYÖDYNTÄMISKELPOISET MATERIAALIT YHTEENSÄ'),
          ReportCell(value: reus?.totalQuantityEstimate),
          ReportCell(),
          ReportCell(),
          ReportCell(value: reus?.totalDemolitionCost),
          ReportCell(),
          ReportCell(value: reus?.totalMaterialPrice),
          ReportCell()
        ])
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 75, cells: [
          ReportCell(
              value: 'KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET',
              verticalAlign: TextVerticalAlign.center,
              horizontalAlign: TextHorizontalAlign.center,
              bold: true),
          ReportCell(
              value: 'Määrä-arvio (tonnia)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Kpl',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Hyödyntäminen, käsittely / loppusijoituspaikka',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Käsittely- ja purkukustannus (€/tonni)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Purkukustannus/materiaalierä (€)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: '€/kpl',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Materiaalierän hinta (€)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
        ]),
        _recyRow('Puu ja kuitulevyovet', recy?.woodAndFiberboardDoors),
        _recyRow('Alumiiniovet', recy?.aluminumDoors),
        _recyRow('Teräsovet', recy?.steelDoors),
        _recyRow('Puiset ikkunat', recy?.woodenWindows),
        _recyRow('teräskarmi-ikkunat', recy?.steelFrameWindows),
        _recyRow('Alumiinikarmi-ikkunat', recy?.aluminumFrameWindows),
        _recyRow('WC istuimet ', recy?.porcelainToilets),
        _recyRow('Kaapit ja kalusteet', recy?.cabinetsAndFurniture),
        _recyRow('Pesuallas, posliini kpl', recy?.porcelainSinks),
        _recyRow('Teräsaltaat ja pöydät', recy?.stainlessSteelSinksAndTables),
        _recyRow('Saunankiukaat', recy?.saunaStove),
        _recyRow('Sähköliedet', recy?.electricStove),
        _recyRow('Jääkaapit', recy?.refrigerator),
        _recyRow('Vesivaraajat', recy?.waterAccumulator),
        _recyRow('Sähkömoottorit', recy?.electricMotors),
        _recyRow('Ilmanvaihtokoneet', recy?.ventilationMachines),
        _recyRow('Lämpökattila', recy?.thermalBoiler),
        _recyRow('Kaukolämmön vaihdin', recy?.districtHeatingExchanger),
        ReportTableRow(height: 30, cells: [
          ReportCell(value: 'KIERRÄTETTÄVÄT MATERIAALIT YHTEENSÄ'),
          ReportCell(value: reus?.totalQuantityEstimate),
          ReportCell(),
          ReportCell(),
          ReportCell(value: reus?.totalDemolitionCost),
          ReportCell(),
          ReportCell(value: reus?.totalMaterialPrice),
          ReportCell()
        ])
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 75, cells: [
          ReportCell(
              value: 'Loppusijoitettavat materiaalit',
              verticalAlign: TextVerticalAlign.center,
              horizontalAlign: TextHorizontalAlign.center,
              bold: true),
          ReportCell(
              value: 'Määrä-arvio (tonnia)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(),
          ReportCell(
              value: 'Hyödyntäminen, käsittely / loppusijoituspaikka',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Käsittely- ja purkukustannus (€/tonni)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true),
          ReportCell(
              value: 'Purkuku ja käsittelykustannus/materiaalierä (€)',
              verticalAlign: TextVerticalAlign.bottom,
              bold: true)
        ]),
        _dispRow(
            'Käyttökelvoton kaakeli, posliini sekä lasi- ja mineraalieristevilla ',
            disp?.ceramicTilePorcelainAndGlassAndInsulationWool,
            30),
        _dispRow('Kierrätyskelvoton tiilijäte ', disp?.nonRecyclableBrickWaste),
        _dispRow(
            'Kierrätyskelvoton kipsilevy ', disp?.nonRecyclablePlasterBoard),
        ReportTableRow(cells: [
          ReportCell(
              value: 'Ongelmajätteet',
              verticalAlign: TextVerticalAlign.center,
              horizontalAlign: TextHorizontalAlign.center,
              bold: true),
          ReportCell(),
          ReportCell(),
          ReportCell(),
          ReportCell(),
          ReportCell()
        ]),
        _dispRow('Saastunut maa ', disp?.contaminatedSoil),
        _dispRow(
            'Asbestia sisältävä betoni ', disp?.concreteContainingAsbestos),
        _dispRow('Mineriitti- tai huopakate, sisältää asbestia ',
            disp?.mineriteOrFeltContainingAsbestos, 30),
        _dispRow(
            'BCP maalia sisältävä betoni ', disp?.concreteContainingPcbPaint),
        ReportTableRow(height: 30, cells: [
          ReportCell(value: 'LOPPUSIJOITETTAVAT MATERIAALIT YHTEENSÄ'),
          ReportCell(value: disp?.totalQuantityEstimate),
          ReportCell(),
          ReportCell(),
          ReportCell(),
          ReportCell(value: disp?.totalDemolitionBatchPrice),
        ])
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 30, cells: [
          ReportCell(bold: true, value: 'Kokonaispurkujätemäärä (tonnia)'),
          ReportCell(bold: true, value: tot?.totalTons)
        ]),
        ReportTableRow(cells: [
          ReportCell(bold: true, value: 'Purkukustannus arvio (€)'),
          ReportCell(bold: true, value: tot?.estimatedDemolitionCost)
        ]),
        ReportTableRow(cells: [
          ReportCell(bold: true, value: 'Purkukustannus/neliö (€/m2)'),
          ReportCell(bold: true, value: tot?.demolitionCostPerSquareMeter)
        ]),
        ReportTableRow(cells: [
          ReportCell(bold: true, value: 'Purkukustannus/kuutio (€/m3)'),
          ReportCell(bold: true, value: tot?.demolitionCostPerCubicMeter)
        ]),
        ReportTableRow(cells: [
          ReportCell(bold: true, value: 'Myytävät materiaalierät (€)'),
          ReportCell(bold: true, value: tot?.sellableMaterialBatchesPrice)
        ])
      ])
    ]);
  }
}

ReportTableRow _reusRow(
    String title, SmallPropertiesRecyclableMaterialItem? item,
    [double? height]) {
  if (height == null) {
    return ReportTableRow(cells: [
      ReportCell(value: title),
      ReportCell(value: item?.quantityEstimate),
      ReportCell(),
      ReportCell(value: item?.exploitingOrProcessingOrFinalDisposalSite),
      ReportCell(value: item?.handlingAndDismantlingCost),
      ReportCell(value: item?.demolitionCostPerMaterialBatch),
      ReportCell(value: item?.materialValue),
      ReportCell(value: item?.batchPrice)
    ]);
  }

  return ReportTableRow(height: height, cells: [
    ReportCell(value: title),
    ReportCell(value: item?.quantityEstimate),
    ReportCell(),
    ReportCell(value: item?.exploitingOrProcessingOrFinalDisposalSite),
    ReportCell(value: item?.handlingAndDismantlingCost),
    ReportCell(value: item?.demolitionCostPerMaterialBatch),
    ReportCell(value: item?.materialValue),
    ReportCell(value: item?.batchPrice)
  ]);
}

ReportTableRow _recyRow(
    String title, SmallPropertiesRecyclableComponentOrFurnitureItem? item,
    [double? height]) {
  if (height == null) {
    return ReportTableRow(cells: [
      ReportCell(value: title),
      ReportCell(value: item?.quantityEstimate),
      ReportCell(value: item?.pcs),
      ReportCell(value: item?.exploitingOrProcessingOrFinalDisposalSite),
      ReportCell(value: item?.handlingAndDismantlingCost),
      ReportCell(value: item?.demolitionCostPerMaterialBatch),
      ReportCell(value: item?.unitPrice),
      ReportCell(value: item?.batchPrice)
    ]);
  }

  return ReportTableRow(height: height, cells: [
    ReportCell(value: title),
    ReportCell(value: item?.quantityEstimate),
    ReportCell(value: item?.pcs),
    ReportCell(value: item?.exploitingOrProcessingOrFinalDisposalSite),
    ReportCell(value: item?.handlingAndDismantlingCost),
    ReportCell(value: item?.demolitionCostPerMaterialBatch),
    ReportCell(value: item?.unitPrice),
    ReportCell(value: item?.batchPrice)
  ]);
}

ReportTableRow _dispRow(String title, SmallPropertiesWasteDisposalItem? item,
    [double? height]) {
  if (height == null) {
    return ReportTableRow(cells: [
      ReportCell(value: title),
      ReportCell(value: item?.quantityEstimate),
      ReportCell(),
      ReportCell(value: item?.exploitingOrProcessingOrFinalDisposalSite),
      ReportCell(value: item?.demolitionOrProcessingCost),
      ReportCell(value: item?.demolitionBatchPrice)
    ]);
  }

  return ReportTableRow(height: height, cells: [
    ReportCell(value: title),
    ReportCell(value: item?.quantityEstimate),
    ReportCell(),
    ReportCell(value: item?.exploitingOrProcessingOrFinalDisposalSite),
    ReportCell(value: item?.demolitionOrProcessingCost),
    ReportCell(value: item?.demolitionBatchPrice)
  ]);
}
