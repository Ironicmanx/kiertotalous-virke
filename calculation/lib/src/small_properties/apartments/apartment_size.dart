import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'apartment_size.freezed.dart';
part 'apartment_size.g.dart';

@freezed
abstract class ApartmentSize with _$ApartmentSize {
  const ApartmentSize._();

  const factory ApartmentSize({
    Apartment? oneRoom,
    Apartment? twoRooms,
    Apartment? threeRooms,
    Apartment? fourRooms,
  }) = _ApartmentSize;

  factory ApartmentSize.fromJson(Map<String, dynamic> json) =>
      _$ApartmentSizeFromJson(json);

  num? get totalRoomCount => Utils.sumOrNull([
        oneRoom?.pcsPerHouse,
        twoRooms?.pcsPerHouse,
        threeRooms?.pcsPerHouse,
        fourRooms?.pcsPerHouse,
      ]);

  num? get totalFloorArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.pcsPerHouse, oneRoom?.floorAreaPerApartment]),
        Utils.multiplyOrNull(
            [twoRooms?.pcsPerHouse, twoRooms?.floorAreaPerApartment]),
        Utils.multiplyOrNull(
            [threeRooms?.pcsPerHouse, threeRooms?.floorAreaPerApartment]),
        Utils.multiplyOrNull(
            [fourRooms?.pcsPerHouse, fourRooms?.floorAreaPerApartment]),
      ]);

  num? get totalWallArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.wallAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.wallAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [threeRooms?.wallAreaPerApartment, threeRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [fourRooms?.wallAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalTrunkWoodTons => Utils.sumOrNull([
        oneRoom?.trunkWoodPerApartmentTons,
        twoRooms?.trunkWoodPerApartmentTons,
        threeRooms?.trunkWoodPerApartmentTons,
        fourRooms?.trunkWoodPerApartmentTons,
      ]);

  num? get totalSurfaceMaterialTons {
    num? multiply = Utils.multiplyOrNull([totalWallArea, totalSurfaceMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// These five next functions are from apartment.dart to avoid cyclic dependency
  num? get oneRoomSurfaceMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull(
        [oneRoom?.wallAreaPerApartment, totalSurfaceMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get twoRoomsSurfaceMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull([
      twoRooms?.pcsPerHouse,
      twoRooms?.wallAreaPerApartment,
      totalSurfaceMaterial
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get threeRoomsSurfaceMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull([
      threeRooms?.pcsPerHouse,
      threeRooms?.wallAreaPerApartment,
      totalSurfaceMaterial
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get fourRoomsSurfaceMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull([
      fourRooms?.pcsPerHouse,
      fourRooms?.wallAreaPerApartment,
      totalSurfaceMaterial
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get oneRoomFloorMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull(
        [oneRoom?.floorAreaPerApartment, totalFloorMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get twoRoomsFloorMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull([
      twoRooms?.pcsPerHouse,
      twoRooms?.floorAreaPerApartment,
      totalFloorMaterial
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get threeRoomsFloorMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull([
      threeRooms?.pcsPerHouse,
      threeRooms?.floorAreaPerApartment,
      totalFloorMaterial
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get fourRoomsFloorMaterialPerApartmentTons {
    num? multiply = Utils.multiplyOrNull([
      fourRooms?.pcsPerHouse,
      fourRooms?.floorAreaPerApartment,
      totalFloorMaterial
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get floorMaterialPerApartmentTons =>
      overallBathroomToiletFloorMaterialTons;

  /// Materiaalimäärään luettava arvo, energiajäte, maalattu puu, kattohuopa ja aluskate
  num? get totalFloorMaterialTons {
    num? multiply = Utils.multiplyOrNull([totalFloorArea, totalFloorMaterial]);
    return multiply != null ? multiply / 1000 : null;
  }

  num? get totalkitchenWallArea => Utils.sumOrNull([
        Utils.multiplyOrNull([
          oneRoom?.kitchenWallMaterialAreaPerApartment,
          oneRoom?.pcsPerHouse
        ]),
        Utils.multiplyOrNull([
          twoRooms?.kitchenWallMaterialAreaPerApartment,
          twoRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull([
          threeRooms?.kitchenWallMaterialAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull([
          fourRooms?.kitchenWallMaterialAreaPerApartment,
          fourRooms?.pcsPerHouse
        ]),
      ]);

  num? get totalkitchenWallTons => overallKitchenWallMaterial;

  num? get totalKitchenClosetLength => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.kitchenClosetsInLinearMeter, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.kitchenClosetsInLinearMeter, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [threeRooms?.kitchenClosetsInLinearMeter, threeRooms?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [fourRooms?.kitchenClosetsInLinearMeter, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalDressingClosetLength => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.dressingClosetsInLinearMeter, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.dressingClosetsInLinearMeter, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.dressingClosetsInLinearMeter,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.dressingClosetsInLinearMeter, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalkitchenClosetTons => overallKitchenClosetTons;

  num? get totaldressingClosetTons => overallDressingClosetTons;

  num? get totalBathroomWallArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.bathroomWallAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.bathroomWallAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.bathroomWallAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.bathroomWallAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalBathroomWallTons => overallBathroomToiletWallMaterialTons;

  num? get totalBathroomFloorArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.bathroomFloorAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.bathroomFloorAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.bathroomFloorAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.bathroomFloorAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalBathroomFloorTons => overallBathroomToiletFloorMaterialTons;

  num? get totalSaunaPanelingArea => Utils.sumOrNull([
        Utils.multiplyOrNull(
            [oneRoom?.saunaPanelingAreaPerApartment, oneRoom?.pcsPerHouse]),
        Utils.multiplyOrNull(
            [twoRooms?.saunaPanelingAreaPerApartment, twoRooms?.pcsPerHouse]),
        Utils.multiplyOrNull([
          threeRooms?.saunaPanelingAreaPerApartment,
          threeRooms?.pcsPerHouse
        ]),
        Utils.multiplyOrNull(
            [fourRooms?.saunaPanelingAreaPerApartment, fourRooms?.pcsPerHouse]),
      ]);

  num? get totalSaunaPanelingTons => saunaPanelingWoodenPanelTons;

  num? get totalKitchenToiletOrSaunaFurnitureTons => overallFurnitureTons;

  /// The rest of the code is from Laskenta-tab in the Excel sheet.
  /// Laskenta, huoneistot
  /// Sisäseinät

  num? get overallWallArea => totalWallArea;

  num? get plasterBoardSheetKgPerSqm {
    if (oneRoom?.surfaceMaterial == SurfaceMaterial.plasterBoard) {
      return BuildingBoardsAndInsulationMaterialWeights
          .plasterBoard15mmKgPerSqm;
    }
    return 0;
  }

  num? get chipboardKgPerSqm {
    if (oneRoom?.surfaceMaterial == SurfaceMaterial.chipboard) {
      return BuildingBoardsAndInsulationMaterialWeights.chipBoard11mmKgPerSqm;
    }
    return 0;
  }

  num? get woodenPanelKgPerSqm {
    if (oneRoom?.surfaceMaterial == SurfaceMaterial.woodenPanel) {
      return WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood50x100);
    }
    return 0;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kipsilevy
  num? get plasterBoardTons {
    if (oneRoom?.surfaceMaterial == SurfaceMaterial.plasterBoard) {
      num? multiply = Utils.multiplyOrNull([
        overallWallArea,
        BuildingBoardsAndInsulationMaterialWeights.plasterBoard15mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, lastulevy
  num? get chipboardTons {
    if (oneRoom?.surfaceMaterial == SurfaceMaterial.chipboard) {
      num? multiply = Utils.multiplyOrNull([
        overallWallArea,
        BuildingBoardsAndInsulationMaterialWeights.chipBoard11mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, polttokelpoinen puujäte
  num? get burnableWoodTons {
    if (oneRoom?.surfaceMaterial == SurfaceMaterial.woodenPanel) {
      num? multiply = Utils.multiplyOrNull([
        overallWallArea,
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  num? get totalSurfaceMaterial => Utils.sumOrNull([
        plasterBoardSheetKgPerSqm,
        chipboardKgPerSqm,
        woodenPanelKgPerSqm,
      ]);

  num? get innerWallsWoodTrunksTons => totalTrunkWoodTons;

  /// Huoneistojen sisälattiat, materiaali

  num? get parquetKgPerSqm {
    if (oneRoom?.floorMaterial == FloorMaterial.parquet) {
      return FloorStructuresAndMaterialsWeights.parquetKgPerSqm;
    }
    return 0;
  }

  num? get plasticCarpetKgPerSqm {
    if (oneRoom?.floorMaterial == FloorMaterial.plasticCarpet) {
      return FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm;
    }
    return 0;
  }

  num? get woodPanelKgPerSqm {
    if (oneRoom?.floorMaterial == FloorMaterial.woodPanel) {
      return WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x100);
    }
    return 0;
  }

  num? get totalFloorMaterial => Utils.sumOrNull(
      [parquetKgPerSqm, plasticCarpetKgPerSqm, woodPanelKgPerSqm]);

  /// Keittiö, pesutila ja WC seinät ja lattiat

  num? get kitchenArea => totalkitchenWallArea;

  num? get bathroomToiletWallArea => totalBathroomWallArea;

  num? get bathroomToiletFloorArea => totalBathroomFloorArea;

  num? get kitchenCeramicTileKg {
    if (oneRoom?.kitchenWallMaterial == KitchenWallMaterial.ceramicTile) {
      return FloorStructuresAndMaterialsWeights.ceramicTilesKgPerSqm;
    }
    return 0;
  }

  num? get bathroomToiletWallCeramicTileKg {
    if (oneRoom?.bathroomWallMaterial == BathroomWallMaterial.ceramicTile) {
      return FloorStructuresAndMaterialsWeights.ceramicTilesKgPerSqm;
    }
    return 0;
  }

  num? get bathroomToiletFloorCeramicTileKg {
    if (oneRoom?.bathroomFloorMaterial == BathroomFloorMaterial.ceramicTile) {
      return FloorStructuresAndMaterialsWeights.ceramicTilesKgPerSqm;
    }
    return 0;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, käyttökelvoton kaakeli
  num? get ceramicTileTonsNonRecyclable {
    num? sum = Utils.sumOrNull([
      Utils.multiplyOrNull([kitchenArea, kitchenCeramicTileKg]),
      Utils.multiplyOrNull(
          [bathroomToiletWallArea, bathroomToiletWallCeramicTileKg]),
      Utils.multiplyOrNull(
          [bathroomToiletFloorArea, bathroomToiletFloorCeramicTileKg])
    ]);
    return sum != null ? sum / 1000 : null;
  }

  num? get kitchenPlasticCarpet {
    if (oneRoom?.kitchenWallMaterial == KitchenWallMaterial.plasticCarpet) {
      return FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm;
    }
    return 0;
  }

  num? get bathroomToiletWallPlasticCarpet =>
      oneRoom?.bathroomWallMaterial == BathroomWallMaterial.plasticCarpet
          ? FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm
          : 0;

  num? get bathroomToiletFloorPlasticCarpet =>
      oneRoom?.bathroomFloorMaterial == BathroomFloorMaterial.plasticCarpet
          ? FloorStructuresAndMaterialsWeights.plasticCarpetKgPerSqm
          : 0;

  num? get overallKitchenWallMaterial =>
      Utils.sumOrNull([kitchenCeramicTileKg, kitchenPlasticCarpet]);

  num? get overallBathroomToiletWallMaterial => Utils.sumOrNull(
      [bathroomToiletWallCeramicTileKg, bathroomToiletWallPlasticCarpet]);

  num? get overallBathroomToiletFloorMaterial => Utils.sumOrNull(
      [bathroomToiletFloorCeramicTileKg, bathroomToiletFloorPlasticCarpet]);

  num? get overallKitchenWallMaterialTons {
    num? multiply =
        Utils.multiplyOrNull([kitchenArea, overallKitchenWallMaterial]);
    return multiply! / 1000;
  }

  num? get overallBathroomToiletWallMaterialTons {
    num? multiply = Utils.multiplyOrNull(
        [bathroomToiletWallArea, overallBathroomToiletWallMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get overallBathroomToiletFloorMaterialTons {
    num? multiply = Utils.multiplyOrNull(
        [bathroomToiletFloorArea, overallBathroomToiletFloorMaterial]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, energiajäte, maalattu puu, kattohuopa ja aluskate
  num? get plasticCarpetTons {
    num? sum = Utils.sumOrNull([
      Utils.multiplyOrNull([kitchenArea, kitchenPlasticCarpet]),
      Utils.multiplyOrNull(
          [bathroomToiletWallArea, bathroomToiletWallPlasticCarpet]),
      Utils.multiplyOrNull(
          [bathroomToiletFloorArea, bathroomToiletFloorPlasticCarpet])
    ]);
    return sum != null ? sum / 1000 : null;
  }

  /// Saunan seinäpaneelit

  num? get saunaPanelingArea => totalSaunaPanelingArea;

  num? get saunaPanelingWoodenPanelTons {
    num? multiply = Utils.multiplyOrNull([
      saunaPanelingArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Kalusteet (tonnia)
  /// Keittiön kaapit

  /// Kaapiston pituus yhteensä
  num? get overAllKitchenClosetLength => totalKitchenClosetLength;

  num? get overallKitchenClosetTons {
    num? multiply = Utils.multiplyOrNull([
      FurnitureDressingKitchenToiletSpaceWeights
          .woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs,
      overAllKitchenClosetLength
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get recyclableKitchenClosets {
    if (oneRoom?.areKitchenClosetsRecyclable == true) {
      return overallKitchenClosetTons;
    }
    return 0;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, energiajäte, maalattu puu, kattohuopa ja aluskate
  num? get nonRecyclableKitchenClosetTons {
    if (oneRoom?.areKitchenClosetsRecyclable == false) {
      return overallKitchenClosetTons;
    }
    return null;
  }

  num? get quantityEstimateKitchenClosetsPcs {
    if (overAllKitchenClosetLength == null) {
      return null;
    }
    return overAllKitchenClosetLength! / 0.6;
  }

  /// Vaatekomerot

  /// Kaapiston pituus yhteensä
  num? get overAllDressingClosetLength => totalDressingClosetLength;

  num? get overallDressingClosetTons {
    num? multiply = Utils.multiplyOrNull([
      FurnitureDressingKitchenToiletSpaceWeights
          .woodBasedClosetsAndOtherFurnitureWidth06MKgPerPcs,
      overAllDressingClosetLength
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get recyclableDressingClosets {
    if (oneRoom?.areDressingClosetsRecyclable == true) {
      return overallDressingClosetTons;
    }
    return 0;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, energiajäte, maalattu puu, kattohuopa ja aluskate
  num? get nonRecyclableDressingClosetTons {
    if (oneRoom?.areDressingClosetsRecyclable == false) {
      return overallDressingClosetTons;
    }
    return null;
  }

  num? get quantityEstimateDressingClosetsPcs {
    if (overAllDressingClosetLength == null) {
      return null;
    }
    return overAllDressingClosetLength! / 0.6;
  }

  /// WC-istuin, posliini

  num? get porcelainSeatPcs {
    if (oneRoom?.toiletSeat == true) {
      return totalRoomCount;
    }
    return 0;
  }

  num? get recyclablePorcelainSeatPcs {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return porcelainSeatPcs;
    }
    return 0;
  }

  num? get porcelainSeatTons {
    num? multiply = Utils.multiplyOrNull([
      porcelainSeatPcs,
      FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalimäärätaulukkoon laskettava arvo, kierrätettävät wc-istuimet
  num? get recyclablePorcelainSeatTons {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return porcelainSeatTons;
    }
    return 0;
  }

  num? get porcelainSeatScrapTons {
    if (porcelainSeatTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (porcelainSeatTons! - (recyclablePorcelainSeatPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Pesuallas, posliini

  num? get washingSinkPcs {
    if (oneRoom?.ceramicSink == true) {
      return totalRoomCount;
    }
    return 0;
  }

  num? get recyclableWashingSinkPcs {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return washingSinkPcs;
    }
    return 0;
  }

  num? get washingSinkTons {
    num? multiply = Utils.multiplyOrNull([
      washingSinkPcs,
      FurnitureDressingKitchenToiletSpaceWeights.washingSinkPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, pesuallas, posliini
  num? get recyclableWashingSinkTons {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return washingSinkTons;
    }
    return 0;
  }

  num? get washingSinkScrapTons {
    if (washingSinkTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (washingSinkTons! - (recyclableWashingSinkPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.washingSinkPorcelainKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Teräsaltaat ja pöydät

  num? get steelTablePcs {
    if (oneRoom?.steelTable == true) {
      return totalRoomCount;
    }
    return 0;
  }

  num? get recyclableSteelTablePcs {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return steelTablePcs;
    }
    return 0;
  }

  num? get steelTableTons {
    num? multiply = Utils.multiplyOrNull([
      steelTablePcs,
      FurnitureDressingKitchenToiletSpaceWeights
          .steelSinksAndTablesRustProofKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, teräsaltaat ja pöydät
  num? get recyclableSteelTableTons {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return steelTableTons;
    }
    return 0;
  }

  num? get steelTableScrapTons {
    if (steelTableTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (steelTableTons! - (recyclableSteelTablePcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights
          .steelSinksAndTablesRustProofKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Saunankiukaat

  num? get saunaStovePcs {
    if (oneRoom?.saunaStove == true) {
      return totalRoomCount;
    }
    return 0;
  }

  num? get recyclableSaunaStovePcs {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return saunaStovePcs;
    }
    return 0;
  }

  num? get saunaStoveTons {
    num? multiply = Utils.multiplyOrNull([
      saunaStovePcs,
      FurnitureDressingKitchenToiletSpaceWeights.saunaStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalilimäärätaulukkoon luettava arvo, saunankiukaat
  num? get recyclableSaunaStoveTons {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return saunaStoveTons;
    }
    return 0;
  }

  num? get saunaStoveScrapTons {
    if (saunaStoveTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (saunaStoveTons! - (recyclableSaunaStovePcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.saunaStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Sähköliedet

  num? get electricStovePcs {
    if (oneRoom?.electricStove == true) {
      return totalRoomCount;
    }
    return 0;
  }

  num? get recyclableElectricStovePcs {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return electricStovePcs;
    }
    return 0;
  }

  num? get electricStoveTons {
    num? multiply = Utils.multiplyOrNull([
      electricStovePcs,
      FurnitureDressingKitchenToiletSpaceWeights.electricStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, sähköliedet
  num? get recyclableElectricStoveTons {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return electricStoveTons;
    }
    return 0;
  }

  num? get electricStoveScrapTons {
    if (electricStoveTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (electricStoveTons! - (recyclableElectricStovePcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.electricStovesKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Jääkaapit

  num? get refrigeratorPcs {
    if (oneRoom?.refrigerator == true) {
      return totalRoomCount;
    }
    return 0;
  }

  num? get recyclableRefrigeratorPcs {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return refrigeratorPcs;
    }
    return 0;
  }

  num? get refrigeratorTons {
    num? multiply = Utils.multiplyOrNull([
      refrigeratorPcs,
      FurnitureDressingKitchenToiletSpaceWeights.refrigeratorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, jääkaapit
  num? get recyclableRefrigeratorTons {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return refrigeratorTons;
    }
    return 0;
  }

  num? get refrigeratorScrapTons {
    if (refrigeratorTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (refrigeratorTons! - (recyclableRefrigeratorPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.refrigeratorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Vesivaraajat

  num? get waterAccumulatorPcs {
    if (oneRoom?.waterHeater == true) {
      return totalRoomCount;
    }
    return 0;
  }

  num? get recyclableWaterAccumulatorPcs {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return waterAccumulatorPcs;
    }
    return 0;
  }

  num? get waterAccumulatorTons {
    num? multiply = Utils.multiplyOrNull([
      waterAccumulatorPcs,
      FurnitureDressingKitchenToiletSpaceWeights.waterAccumulatorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, vesivaraajat
  num? get recyclableWaterAccumulatorTons {
    if (oneRoom?.isFurnitureRecyclable == true) {
      return waterAccumulatorTons;
    }
    return 0;
  }

  num? get waterAccumulatorScrapTons {
    if (waterAccumulatorTons == 0) {
      return 0;
    }
    num? multiply = Utils.multiplyOrNull([
      (waterAccumulatorTons! - (recyclableWaterAccumulatorPcs ?? 0)),
      FurnitureDressingKitchenToiletSpaceWeights.waterAccumulatorsKgPerPcs
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  num? get overallFurnitureTons {
    return Utils.sumOrNull([
      porcelainSeatTons,
      washingSinkTons,
      steelTableTons,
      saunaStoveTons,
      electricStoveTons,
      refrigeratorTons,
      waterAccumulatorTons,
    ]);
  }
}
