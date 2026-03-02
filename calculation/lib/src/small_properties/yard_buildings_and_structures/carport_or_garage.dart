import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';
import '../data_types/exports.dart';
import '../data_types/foundation_type.dart';
import '../data_types/garage_wall_material.dart';

part 'carport_or_garage.freezed.dart';
part 'carport_or_garage.g.dart';

/// Piharakennukset ja rakenteet
/// Autokatos tai autotalli, erilliset ulkovarastot ja lämpökeskus
@freezed
abstract class CarportOrGarage with _$CarportOrGarage {
  const CarportOrGarage._();

  const factory CarportOrGarage(
      {num? buildingLengthInMeters,
      num? buildingWidthInMeters,
      FoundationType? foundationType,
      @Default(false) bool buildingFoundationAndWallsContainAsbestosOrPcbPaints,
      @Default(false) bool coveringMaterialContainsAsbestos,
      GarageWallMaterial? garageWallMaterial,
      InsulationMaterialThickness? insulationMaterialThickness,
      num? wallAverageHeight,
      num? buildingWallLengthTotal}) = _CarportOrGarage;

  factory CarportOrGarage.fromJson(Map<String, dynamic> json) =>
      _$CarportOrGarageFromJson(json);

  /// Asfaltti (tonnia)
  num? get asphaltTons {
    if (foundationType == FoundationType.concreteSlab) {
      return null;
    }
    num? multiply = Utils.multiplyOrZero([
      Utils.sumOrNull([buildingLengthInMeters, buildingWidthInMeters]),
      2
    ]);
    if (multiply == 0) {
      return null;
    }
    return multiply! * YardStructureWeights.concreteBarsKgPerPcs / 1000;
  }

  /// Betoni (tonnia)
  num? get concreteTons {
    if (foundationType == FoundationType.concreteSlab) {
      num? multiply = Utils.multiplyOrNull([
        buildingLengthInMeters,
        buildingWidthInMeters,
        FoundationWeights.concreteKgPerCbm
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    } else if (foundationType == FoundationType.concretePillars) {
      num? multiply = Utils.multiplyOrNull([
        buildingLengthInMeters,
        buildingWidthInMeters,
        YardStructureWeights.concreteBarsKgPerPcs
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    }
    return null;
  }

  /// Materiiaalimäärätaulukkoon luettava määrä, puhdas betoni (tonnia), autotalli/katos
  num? get cleanConcreteTons {
    if (buildingFoundationAndWallsContainAsbestosOrPcbPaints == false) {
      return concreteTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, asbestia sisältävä betoni (tonnia), autotalli/katos
  num? get concreteWithAsbestosTons {
    if (buildingFoundationAndWallsContainAsbestosOrPcbPaints == true) {
      return concreteTons;
    }
    return null;
  }

  /// Katoksen/tallin seinät
  /// Pinta-ala (m2)
  num? get wallArea =>
      Utils.multiplyOrNull([buildingWallLengthTotal, wallAverageHeight]);

  /// Seinämateriaali (tonnia)
  num? get wallMaterialTons {
    if (garageWallMaterial == GarageWallMaterial.board) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (garageWallMaterial == GarageWallMaterial.brick) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (garageWallMaterial == GarageWallMaterial.steelSheet) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights
            .steelBoardCladding06mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (garageWallMaterial == GarageWallMaterial.concrete) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, polttokelpoinen puujäte
  num? get burnableWoodTons {
    if (garageWallMaterial == GarageWallMaterial.board) {
      return wallMaterialTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, betoniteräkset, peltikatto ja muu teräsromu
  num? get steelSheetTons {
    if (garageWallMaterial == GarageWallMaterial.steelSheet) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights
            .steelBoardCladding06mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, puhdas betoni (tonnia), autotallin/katoksen seinät
  num? get cleanWallConcreteTons {
    if (buildingFoundationAndWallsContainAsbestosOrPcbPaints == false &&
        garageWallMaterial == GarageWallMaterial.concrete) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, seinä- ja kattotiilet
  num? get recyclableBrickTons {
    if (buildingFoundationAndWallsContainAsbestosOrPcbPaints == false &&
        garageWallMaterial == GarageWallMaterial.brick) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
      ]);
      return multiply;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätyskelvoton tiilijäte
  num? get nonRecyclableInnerWallBrickWasteTons {
    if (buildingFoundationAndWallsContainAsbestosOrPcbPaints == true &&
        garageWallMaterial == GarageWallMaterial.brick) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
      ]);
      return multiply;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, asbestia sisältävä betoni (tonnia), autotallin/katoksen seinät
  num? get concreteWallMaterialWithAsbestosTons {
    if (buildingFoundationAndWallsContainAsbestosOrPcbPaints == true &&
        garageWallMaterial == GarageWallMaterial.concrete) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Eriste (tonnia)
  num? get insulationThicknessTons {
    if (insulationMaterialThickness == InsulationMaterialThickness.mm100) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm
      ]);
      return multiply != null ? multiply / 1000 : null;
    } else if (insulationMaterialThickness ==
        InsulationMaterialThickness.mm200) {
      num? multiply = Utils.multiplyOrZero([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm,
        2
      ]);
      return multiply != 0 ? multiply! / 1000 : null;
    } else if (insulationMaterialThickness ==
        InsulationMaterialThickness.mm300) {
      num? multiply = Utils.multiplyOrNull([
        wallArea,
        BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm,
        3
      ]);
      return multiply != null ? multiply / 1000 : null;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, betoniteräkset, peltikatto ja muu teräsromu
  num? get steelTons {
    if (foundationType == FoundationType.concreteSlab) {
      num? multiply = Utils.multiplyOrZero([
        buildingLengthInMeters,
        0.3,
        FoundationWeights.concreteOrSteelBlockKgPerCbm
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    }
    return null;
  }
}
