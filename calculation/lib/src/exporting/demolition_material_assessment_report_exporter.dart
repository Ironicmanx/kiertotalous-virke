import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../large_properties/demolition_material_assessment/items/exports.dart';
import '../large_properties/demolition_material_assessment/total/exports.dart';
import '../large_properties/external_shell_and_frame_structures/exports.dart';
import 'report_exporters/excel_report_exporter.dart';
import 'report_exporters/pdf_report_exporter.dart';
import 'structures/exports.dart';

part 'demolition_material_assessment_report_exporter.freezed.dart';

@freezed
abstract class DemolitionMaterialAssessmentReportExporter
    with _$DemolitionMaterialAssessmentReportExporter {
  DemolitionMaterialAssessmentReportExporter._();

  factory DemolitionMaterialAssessmentReportExporter(
          {required TotalDemolitionWasteAndCosts totalDemolitionWasteAndCosts,
          required LargePropertyEvaluationInfo largePropertyEvaluationInfo}) =
      _DemolitionMaterialAssessmentReportExporter;

  void writeAsExcelSync(File file) {
    final exporter = ExcelReportExporter(_report,
        sheetName: 'Arviointilaskelma',
        columnWidths: [
          50,
          11,
          11,
          11,
          11,
          11
        ],
        cellMerges: [
          (
            CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)
          ),
          (
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2),
            CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 2)
          ),
          (
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 3),
            CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 3)
          )
        ]);
    file.writeAsBytesSync(exporter.export().encode()!);
  }

  void writeAsPdfSync(File file,
      {ByteData? fontRegularByteData, ByteData? fontBoldByteData}) {
    final exporter = PDFReportExporter(_report,
        columnWidths: [50, 11, 11, 11, 11, 11],
        fontRegularByteData: fontRegularByteData,
        fontBoldByteData: fontBoldByteData);
    exporter.export().save().then((val) => file.writeAsBytesSync(val));
  }

  ExportableReport get _report {
    final deWa = totalDemolitionWasteAndCosts;

    final reRy = deWa.totalReusableAndRecyclableMaterials;

    final reCo = deWa.totalRecyclableComponentsAndFurniture;

    final diHa = deWa.totalDisposalMaterialsAndHazardousWaste;

    return ExportableReport(tables: [
      ReportTable(rows: [
        ReportTableRow(height: 26, borders: false, cells: [
          ReportCell(
              value: 'Purkumateriaalien arviointilaskelma',
              fontSize: 20,
              wrapText: false),
          ReportCell()
        ])
      ]),
      ReportTable(rows: [
        ReportTableRow(cells: [
          ReportCell(
              value: largePropertyEvaluationInfo.propertyName, bold: true),
          ReportCell(
              value: largePropertyEvaluationInfo.author,
              bold: true,
              fontSize: 10),
          ReportCell(hint: Hint.ghost),
          ReportCell(
              value: largePropertyEvaluationInfo.date,
              bold: true,
              fontSize: 10),
          ReportCell(
              value: largePropertyEvaluationInfo.version,
              bold: true,
              fontSize: 10)
        ], borders: false),
        ReportTableRow(cells: [
          ReportCell(value: 'Kiinteistön nimi'),
          ReportCell(value: 'Laskelman laatija:'),
          ReportCell(hint: Hint.ghost),
          ReportCell(value: 'päivä:'),
          ReportCell(value: 'versio:')
        ], borders: false),
        ReportTableRow(cells: [
          ReportCell(
              value: largePropertyEvaluationInfo.buildingType, bold: true),
        ], borders: false),
        ReportTableRow(cells: [
          ReportCell(value: 'Rakennustyyppi'),
        ], borders: false),
        ReportTableRow(cells: [
          ReportCell(value: largePropertyEvaluationInfo.address, bold: true),
        ], borders: false),
        ReportTableRow(cells: [
          ReportCell(value: 'Osoite'),
        ], borders: false),
        ReportTableRow(cells: [
          ReportCell(
              value: largePropertyEvaluationInfo.municipality, bold: true),
        ], borders: false),
        ReportTableRow(cells: [
          ReportCell(value: 'Kunta'),
        ], borders: false),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(
              value: 'HYÖDYNTÄMISKELPOISET JA KIERRÄTETTÄVÄT MATERIAALIT',
              bold: true),
          ReportCell(value: 'Tilavuus (m3)', bold: true),
          ReportCell(value: 'Määrä-arvio (tonnia)', bold: true),
          ReportCell(value: 'Purkukustannus (€/kpl tai €/tonni)', bold: true),
          ReportCell(value: 'Materiaalierän hinta (€)', bold: true),
        ]),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.cleanSoil, 'Maa-ainekset, puhdas maa')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.asphaltWaste, 'Asfalttijäte')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.cleanConcrete, 'Puhdas betoni')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.rebarAndSteelScrap,
                'Betoniteräkset, peltikatto ja muu teräs ja rautaromu')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.concreteBlocks, 'Betoniharkot')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.wallAndRoofTiles, 'Seinä- ja kattotiilet')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.ceramicTiles,
                'Kaakelilaatat ja keramiikka, ei sisällä asbestia')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.cleanUsableWood, 'Puhdas käyttökelpoinen puu')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.eWaste, 'Sähkö- ja elektroniikkaromu')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.stainlessSteel, 'Ruostumaton teräs')),
        ReportTableRow(cells: _wasteCostItemToCells(reRy?.copper, 'Kupari')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.aluminium, 'Alumiini')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.glassAndMineralWool, 'Lasi- ja mineraalieristevilla')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.fiberCementBoards,
                'Mineriitti kate ja palonsuojalevyt, ei sisällä asbestia')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.gypsumBoards, 'Kipsilevyt (cyproc)')),
        ReportTableRow(cells: _wasteCostItemToCells(reRy?.glass, 'Lasi')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.energyWaste,
                'Energiajäte, maalattupuu, kattohuopa ja aluskate')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.combustibleWoodWaste, 'Polttokelpoinen puujäte')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.windProtectionBoard,
                'Tuulensuojalevyt (bituliitti tai vastaava)')),
        ReportTableRow(
            cells: _wasteCostItemToCells(reRy?.chipboard, 'Lastulevy')),
        ReportTableRow(
            cells: _wasteCostItemToCells(
                reRy?.plasticWaste, 'Muovijäte, styrox, kosteuseriste yms.')),
        ReportTableRow(cells: [
          ReportCell(value: 'Yhteensä'),
          ReportCell(value: reRy?.totalVolume),
          ReportCell(value: reRy?.totalTons),
          ReportCell(),
          ReportCell(value: reRy?.totalBatchPrice),
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(
              value: 'KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET', bold: true),
          ReportCell(value: 'määrä (kpl, m, tai m2)', bold: true),
          ReportCell(value: 'Tilavuus (m3)', bold: true),
          ReportCell(value: 'yhteis-paino (tonnia)', bold: true),
          ReportCell(value: 'Myynti-hinta (€/kpl tai €/tonni)', bold: true),
          ReportCell(value: 'Materiaalierän hinta (€)', bold: true),
        ]),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteFrameBeams, 'Betonipalkit, runko')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteHollowSlabs, 'Betoniset ontelolaatat')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteRoofBeams, 'Betoniset kattopalkit')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.concreteWallElements, 'Betoniset seinäelementit')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.glulamBeams, 'Liimapalkit')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.floorSupportWoodenBeams,
                'Puupalkit (kantavat lattiapalkit)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelFrameBeams, 'Teräspalkit, runkopalkit')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.rainGuttersAndDownspouts,
                'Sadevesikourut ja rännit (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.fireLaddersAndWalkways,
                'Palotikkaat ja kulkusillat (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.woodenRoofTrusses, 'Puiset kattoristikot')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelRoofTrusses, 'Teräksiset kattoristikot')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelChainLinkFence, 'Teräsverkko aita (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.aluminumChainLinkFence, 'Alumiiniverkko aita (m)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.woodAndFiberboardDoors, 'Puuovet ja kuitulevyovet')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.aluminumDoors, 'Alumiiniovet')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.exteriorAndFireExitSteelDoors,
                'Teräsovet (ulko ja palo-ovet)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.woodenOrBoardCabinetsAndFurniture,
                'Kaapit ja kalusteet, puu tai levy (keittiö ja sosiaalitilat)')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.steelLockerCabinets, 'Teräksiset pukukaapit')),
        ReportTableRow(
            cells:
                _recyclableItemToCells(reCo?.woodenWindows, 'Puuiset ikkunat')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.porcelainToilets, 'WC-istuin, posliini')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.porcelainSinks, 'Pesuallas, posliini')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.stainlessSteelSinksAndTables,
                'Teräsaltaat ja pöydät (ruostumaton)')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.saunaStoves, 'Saunankiukaat')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.electricStoves, 'Sähköliedet')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.industrialElectricStoves, 'Suurtalous sähköliedet')),
        ReportTableRow(
            cells: _recyclableItemToCells(reCo?.refrigerators, 'Jääkaapit')),
        ReportTableRow(
            cells:
                _recyclableItemToCells(reCo?.coldRoomCabinets, 'Kylmiökaapit')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.electricRadiators, 'Lämpöpatterit, sähkö')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.smallElectricalAccumulators, 'Vesivaraajat, pienet')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.largeElectricalAccumulators, 'Vesivaraajat, suuret')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.electricMotorsAndCirculationPumps,
                'Sähkömoottorit ja kiertovesipumput')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.ventilationUnits, 'Ilmanvaihtokoneet')),
        ReportTableRow(
            cells: _recyclableItemToCells(
                reCo?.electricalDistributionCabinetsAndMeters,
                'Sähkökaapit ja mittarit')),
        ReportTableRow(
            cells:
                _recyclableItemToCells(reCo?.roofExhaustFans, 'Huippuimurit')),
        ReportTableRow(cells: [
          ReportCell(value: 'Yhteensä'),
          ReportCell(),
          ReportCell(value: reCo?.totalVolume),
          ReportCell(value: reCo?.totalTons),
          ReportCell(),
          ReportCell(value: reCo?.totalBatchPrice),
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(
              value: 'Loppusijoitettavat materiaalit ja ongelmajätteet',
              bold: true),
          ReportCell(value: 'Tilavuus (m3)', bold: true),
          ReportCell(value: 'Määrä-arvio (tonnia)', bold: true),
          ReportCell(
              value: 'Purku- ja käsittelykustannus (€/tonni)', bold: true),
          ReportCell(value: 'Materiaalierän hinta (€)', bold: true),
        ]),
        ReportTableRow(
            cells: _wasteItemToCells(
                diHa?.nonRecyclableBrickWaste, 'Kierrätyskelvoton tiilijäte')),
        ReportTableRow(
            cells: _wasteItemToCells(diHa?.contaminatedSoil, 'Saastunut maa')),
        ReportTableRow(
            height: 30,
            cells: _wasteItemToCells(diHa?.asbestosOrBCPConcrete,
                'Asbestia tai BCP maalia sisältävä betoni (bitumi ja akryylipinnoitettu)')),
        ReportTableRow(cells: _wasteItemToCells(diHa?.bitumen, 'Bitumi')),
        ReportTableRow(
            height: 30,
            cells: _wasteItemToCells(diHa?.otherAsbestosContainingMaterial,
                'Mineriitti, tiilet, tiilikate, kattohuopa, kaakelilaatat yms. sisältää asbestia')),
        ReportTableRow(cells: [
          ReportCell(value: 'Yhteensä'),
          ReportCell(value: diHa?.totalVolume),
          ReportCell(value: diHa?.totalTons),
          ReportCell(),
          ReportCell(value: diHa?.totalBatchPrice),
        ]),
      ]),
      ReportTable(rows: [
        ReportTableRow(height: 57, cells: [
          ReportCell(value: 'Purkujätteet ja kustannukset', bold: true),
          ReportCell(value: 'Tilavuus (m3)', bold: true),
          ReportCell(value: 'Määrä-arvio (tonnia)', bold: true),
        ]),
        ReportTableRow(cells: [
          ReportCell(value: 'Kokonaispurkujätemäärä'),
          ReportCell(value: deWa.totalVolume),
          ReportCell(value: deWa.totalTons)
        ]),
        ReportTableRow(height: 30, cells: [
          ReportCell(
              value:
                  'Rakennuksen purkujätemäärä (ei sisällä poistettavaa maata)'),
          ReportCell(value: deWa.totalVolumeExcludingExcavatedLand),
          ReportCell(value: deWa.totalTonsExcludingExcavatedLand)
        ]),
      ]),
      ReportTable(hint: Hint.slim, rows: [
        ReportTableRow(borders: false, cells: [
          ReportCell(value: 'Purettavan rakennuksen kerrosala (m2)'),
          ReportCell(value: deWa.buildingGrossFloorArea),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(value: 'Purettavan rakennuksen tilavuus (m3)'),
          ReportCell(value: deWa.buildingVolume),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(value: 'Purkukustanuksen hinta (€/tonni)'),
          ReportCell(
              value: deWa
                  .demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials),
          ReportCell()
        ]),
        ReportTableRow(borders: false, height: 30, cells: [
          ReportCell(
              value:
                  'Purkumateriaalien mukaan laskettu purkukustannus (€/tonni)'),
          ReportCell(
              value: deWa
                  .demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(value: 'Purkukustanus arvio (€)'),
          ReportCell(value: deWa.estimatedDemolitionCost),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
              value: 'Rakennuksen purkustannus (ei sisällä maanpoistoa)'),
          ReportCell(value: deWa.estimatedDemolitionCostExcludingExcavations),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(value: 'Purkukustannus/neliö (€/m2)'),
          ReportCell(value: deWa.demolitionCostPerSquareMeter),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(
              value: 'Purkukustannus/neliö, ei sisällä maanpoistoa (€/m2)'),
          ReportCell(
              value: deWa.demolitionCostPerSquareMeterExcludingExcavations),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(value: 'Purkukustannus/rakennuskuutio (€/m3)'),
          ReportCell(value: deWa.demolitionCostPerCubicMeter),
          ReportCell()
        ]),
        ReportTableRow(borders: false, height: 30, cells: [
          ReportCell(
              value:
                  'Purkukustannus/rakennuskuutio, ei sisällä maanpoistoa (€/m3)'),
          ReportCell(
              value: deWa.demolitionCostPerCubicMeterExcludingExcavations),
          ReportCell()
        ]),
        ReportTableRow(borders: false, cells: [
          ReportCell(value: 'Myytävät materiaalierät (€)'),
          ReportCell(value: deWa.sellableMaterialBatchesPrice),
          ReportCell()
        ]),
      ])
    ]);
  }

  List<ReportCell> _wasteCostItemToCells(WasteCostItem? item, String title) {
    return [
      ReportCell(value: title),
      ReportCell(value: item?.volume),
      ReportCell(value: item?.tons),
      ReportCell(value: item?.demolitionCost),
      ReportCell(value: item?.batchPrice),
    ];
  }

  List<ReportCell> _recyclableItemToCells(RecyclableItem? item, String title) {
    return [
      ReportCell(value: title),
      ReportCell(value: item?.size),
      ReportCell(value: item?.volume),
      ReportCell(value: item?.tons),
      ReportCell(value: item?.unitPrice),
      ReportCell(value: item?.batchPrice),
    ];
  }

  List<ReportCell> _wasteItemToCells(WasteDisposalItem? item, String title) {
    return [
      ReportCell(value: title),
      ReportCell(value: item?.volume),
      ReportCell(value: item?.tons),
      ReportCell(value: item?.demolitionOrProcessingCost),
      ReportCell(value: item?.batchPrice),
    ];
  }
}
