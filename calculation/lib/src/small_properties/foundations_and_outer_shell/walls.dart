import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';
import '../data_types/exports.dart';

part 'walls.freezed.dart';
part 'walls.g.dart';

/// Ulko- ja kantavien väliseinien materiaalit
@freezed
abstract class Walls with _$Walls {
  Walls._();

  factory Walls({
    @Default(false) bool isTrunkWoodRecyclable,
    @Default(false) bool isInsulationWoolRecyclable,
    @Default(false) bool isAggregateRecyclable,
    num? lengthInMeters,
    num? widthInMeters,
    num? heightInMeters,
    num? stoneOrBrickWallsInLinearMeters,
    WoodMaterialType? woodMaterialType,
    WallMaterial? wallMaterial,
    InsulationMaterialThickness? insulationMaterialThickness,
    OuterWallSurfaceMaterial? outerWallSurfaceMaterial,
  }) = _Walls;

  factory Walls.fromJson(Map<String, dynamic> json) => _$WallsFromJson(json);

  /// Ulkoseinän pinta-ala (m2)
  num? get outerWallArea =>
      Utils.multiplyOrNull([lengthInMeters, widthInMeters, heightInMeters, 2]);

  /// Kiviseinät ja osittainen ulkovuoraus, betoni
  num? get concreteWallsPartialExteriorCladdingTons {
    if (wallMaterial == WallMaterial.concrete) {
      return partitionWallsTons;
    }
    return null;
  }

  /// Kiviseinät ja osittainen ulkovuoraus, tiili
  num? get brickWallsPartialExteriorCladdingTons {
    if (wallMaterial == WallMaterial.brick) {
      return partitionWallsTons;
    }
    return null;
  }

  /// Runko (tonnia) runkopuu 50x100
  num? get wallTrunkWood50x100Tons => trunkWood50x100Tons;

  /// Runko (tonnia) runkopuu 50x150
  num? get wallTrunkWood50x150Tons => trunkWood50x150Tons;

  /// Runko (tonnia) runkopuu 50x200
  num? get wallTrunkWood50x200Tons => trunkWood50x200Tons;

  /// Runko (tonnia) runkopuu 100x100
  num? get wallTrunkWood100x100Tons => trunkWood100x100Tons;

  /// Runko (tonnia) runkopuu 150x150
  num? get wallTrunkWood150x150Tons => trunkWood150x150Tons;

  /// Also in Laskenta tab
  /// Tuulensuojalevy (tonnia)
  num? get windProtectionBoardTons {
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.windProtectionBoardKgPerSqm
    ]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Ulkoseinän pintamateriaali (tonnia)
  num? get outerWallBoardCurtainTons => boardCurtainBrickMineriteBoardTons;

  /// Laskenta
  /// Ulko- ja kantavien väliseinien materiaalit

  /// Kierrätyskelpoinen osuus väliseinistä (tonnia), tiili
  num? get recyclablePartitionWallsBricksTons {
    if (!isAggregateRecyclable && wallMaterial == WallMaterial.brick) {
      return 0;
    }
    return partitionWallsTons;
  }

  /// Kierrätyskelvoton tiilijäte
  num? get nonRecyclableBrickWasteTons {
    if (!isAggregateRecyclable && wallMaterial == WallMaterial.brick) {
      return partitionWallsTons;
    }
    return 0;
  }

  /// Väliseinät (tonnia), betoni tai tiili
  num? get partitionWallsTons {
    if (wallMaterial == WallMaterial.brick) {
      num? multiply = Utils.multiplyOrNull([
        stoneOrBrickWallsInLinearMeters,
        heightInMeters,
        StoneAndCeramicMaterialsWeights.concreteWallElements100mmKgPerSqm
      ]);
      if (multiply == 0) {
        return 0;
      }
      return multiply! / 1000;
    } else if (wallMaterial == WallMaterial.concrete) {
      num? multiply = Utils.multiplyOrNull([
        stoneOrBrickWallsInLinearMeters,
        heightInMeters,
        StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
      ]);
      if (multiply == 0) {
        return 0;
      }
      return multiply! / 1000;
    }
    return null;
  }

  /// Kierrätyskelpoinen osuus väliseinistä (tonnia), betoni
  num? get recyclablePartitionWallsConcreteTons {
    if (!isAggregateRecyclable && wallMaterial == WallMaterial.concrete) {
      return 0;
    }
    return partitionWallsTons;
  }

  /// Puurunko, ulkoseinät
  /// Runkopuu 50x100, tonnia
  num? get trunkWood50x100Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood50x100) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x100),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 50x150, tonnia
  num? get trunkWood50x150Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood50x150) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x150),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 50x200, tonnia
  num? get trunkWood50x200Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood50x200) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood50x200),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 100x100, tonnia
  num? get trunkWood100x100Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood100x100) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood100x100),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Runkopuu 150x150, tonnia
  num? get trunkWood150x150Tons {
    if (woodMaterialType != WoodMaterialType.trunkWood150x150) {
      return null;
    }
    if (!isTrunkWoodRecyclable) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      WoodMaterialInfo.woodWeightPerSquareMeter(
          WoodMaterialType.trunkWood150x150),
      outerWallArea
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimäärätaulukkoon laskettava arvo, puhdas käyttökelpoinen puu / polttokelpoinen puujäte
  num? get cleanWoodOrBurnableWoodTons {
    if (!isTrunkWoodRecyclable) {
      return Utils.sumOrNull([
        trunkWood50x100Tons,
        trunkWood50x150Tons,
        trunkWood50x200Tons,
        trunkWood100x100Tons,
        trunkWood150x150Tons,
      ]);
    } else if (isTrunkWoodRecyclable) {
      return Utils.sumOrNull([
        trunkWood50x100Tons,
        trunkWood50x150Tons,
        trunkWood50x200Tons,
        trunkWood100x100Tons,
        trunkWood150x150Tons,
      ]);
    }
    return null;
  }

  /// Eristevilla, paino
  num? get insulationWoolTons {
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.insulationWool100mmKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    if (insulationMaterialThickness == InsulationMaterialThickness.mm100) {
      return multiply / 1000;
    } else if (insulationMaterialThickness ==
        InsulationMaterialThickness.mm200) {
      return multiply * 2 / 1000;
    } else if (insulationMaterialThickness ==
        InsulationMaterialThickness.mm300) {
      return multiply * 3 / 1000;
    }
    return null;
  }

  /// Lautaverhousten paino (tonnia)
  num? get boardCladdingTons {
    if (outerWallSurfaceMaterial != OuterWallSurfaceMaterial.boardCurtain) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      WoodMaterialInfo.woodWeightPerSquareMeter(WoodMaterialType.board20x125)
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// tiili, tonnia
  num? get brickTons {
    if (outerWallSurfaceMaterial != OuterWallSurfaceMaterial.brick) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      StoneAndCeramicMaterialsWeights.brickWallsAndMortarKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, seinä- ja kattotiilet
  num? get recyclableBrickTons {
    if (!isAggregateRecyclable) {
      return 0;
    }
    return brickTons;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätyskelvoton tiilijäte
  num? get nonRecyclableInnerWallBrickWasteTons {
    if (!isAggregateRecyclable) {
      return brickTons;
    }
    return 0;
  }

  /// mineriittilevy, tonnia
  num? get mineriteBoardTons {
    if (outerWallSurfaceMaterial != OuterWallSurfaceMaterial.mineriteBoard) {
      return null;
    }
    num? multiply = Utils.multiplyOrNull([
      outerWallArea,
      BuildingBoardsAndInsulationMaterialWeights.mineriteBoardKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Lautaverhous, tiili + mineriittilevy, tonnia
  num? get boardCurtainBrickMineriteBoardTons {
    return Utils.sumOrNull([boardCladdingTons, brickTons, mineriteBoardTons]);
  }
}
