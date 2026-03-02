import '../../../bl_demolition_materials.dart';

/// Kattotyypit
///Harja- ja aumakattorunko
/// Kattoristikot, puu
class WoodenTrussRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  WoodenTrussRidgeOrGableRoof([this.totalRoofs, this.sizing = 700]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .gableAndPentRoofWithWoodenLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num get kgPerCubicMeter => UpperBaseStructureAndWaterRoofWeights
      .gableAndPentRoofWithWoodenLatticeKgPerCbm;

  @override
  num? get woodVolume {
    if (totalRoofs?.ridgeOrGableRoofType == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs!.ridgeOrGableRoofType == RoofType.woodenTruss) {
      return kgPerSquareMeter *
          totalRoofs!.defaultRidgeOrGableRoofCeilingArea! /
          kgPerCubicMeter;
    }

    return 0;
  }

  @override
  num? get woodTons {
    if (totalRoofs?.ridgeOrGableRoofType == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs!.ridgeOrGableRoofType == RoofType.woodenTruss) {
      return kgPerSquareMeter *
          totalRoofs!.defaultRidgeOrGableRoofCeilingArea! /
          1000;
    }

    return 0;
  }
}

/// Kattoristikot, teras
class SteelTrussRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  SteelTrussRidgeOrGableRoof([this.totalRoofs, this.sizing = 800]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .gableAndPentRoofWithSteelLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num? get steelTons {
    if (totalRoofs?.ridgeOrGableRoofType == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs!.ridgeOrGableRoofType == RoofType.steelTruss) {
      return kgPerSquareMeter *
          totalRoofs!.defaultRidgeOrGableRoofCeilingArea! /
          1000;
    }

    return 0;
  }
}

/// Betonipalkki
class ConcreteColumnRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  ConcreteColumnRidgeOrGableRoof([this.totalRoofs, this.sizing = 250]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerSqm /
      250 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerCbm;

  @override
  num? get concreteVolume {
    if (totalRoofs?.ridgeOrGableRoofType == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs!.ridgeOrGableRoofType == RoofType.concreteBeam) {
      return kgPerSquareMeter *
          totalRoofs!.defaultRidgeOrGableRoofCeilingArea! /
          kgPerCubicMeter;
    }

    return 0;
  }

  @override
  num? get concreteTons {
    if (totalRoofs?.ridgeOrGableRoofType == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs!.ridgeOrGableRoofType == RoofType.concreteBeam) {
      return kgPerSquareMeter *
          totalRoofs!.defaultRidgeOrGableRoofCeilingArea! /
          1000;
    }

    return 0;
  }
}

/// Katon kannatinniskat, 50x150, oletusväli 3000mm
/// This class has no uses as far as I can see?
class RoofBracketsRidgeOrGableRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  RoofBracketsRidgeOrGableRoof([this.totalRoofs, this.sizing = 3000]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerSqm /
      3000 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerCbm;

  @override
  num? get woodVolume {
    if (totalRoofs?.ridgeOrGableRoofType == null ||
        totalRoofs?.roofBaseArea == null) {
      return null;
    }

    if (totalRoofs!.ridgeOrGableRoofType == RoofType.woodenTruss ||
        totalRoofs!.ridgeOrGableRoofType == RoofType.steelTruss) {
      return kgPerSquareMeter * totalRoofs!.roofBaseArea! / kgPerCubicMeter;
    }

    return 0;
  }

  @override
  num? get concreteTons {
    if (totalRoofs?.ridgeOrGableRoofType == null ||
        totalRoofs?.roofBaseArea == null) {
      return null;
    }

    if (totalRoofs!.ridgeOrGableRoofType == RoofType.woodenTruss ||
        totalRoofs!.ridgeOrGableRoofType == RoofType.steelTruss) {
      return kgPerSquareMeter * totalRoofs!.roofBaseArea! / 1000;
    }

    return 0;
  }
}

/// Tasakatto ja pulpettikattorunko

/// Kattoristikot, puu
class WoodenTrussFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  WoodenTrussFlatOrMonoPitchedRoof([this.totalRoofs, this.sizing = 800]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .flatAndPentRoofWithWoodenLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num get kgPerCubicMeter => UpperBaseStructureAndWaterRoofWeights
      .flatAndPentRoofWithWoodenLatticeKgPerCbm;

  @override
  num? get woodVolume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs?.flatOrMonoPitchedRoofType != RoofType.woodenTruss) {
      return 0;
    }

    return kgPerSquareMeter *
        totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! /
        kgPerCubicMeter;
  }

  @override
  num? get woodTons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs?.flatOrMonoPitchedRoofType != RoofType.woodenTruss) {
      return 0;
    }

    return kgPerSquareMeter *
        totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! /
        1000;
  }
}

/// Kattoristikot, teras
class SteelTrussFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  SteelTrussFlatOrMonoPitchedRoof([this.totalRoofs, this.sizing = 800]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights
          .flatAndPentRoofWithSteelLatticeKgPerSqm /
      800 *
      sizing;

  @override
  num? get steelTons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs?.flatOrMonoPitchedRoofType != RoofType.steelTruss) {
      return 0;
    }

    return kgPerSquareMeter *
        totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! /
        1000;
  }
}

/// Betonipalkki
class ConcreteColumnFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  ConcreteColumnFlatOrMonoPitchedRoof([this.totalRoofs, this.sizing = 250]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerSqm /
      250 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.ferroConcreteBarKgPerCbm;

  @override
  num? get concreteVolume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs?.flatOrMonoPitchedRoofType != RoofType.concreteBeam) {
      return 0;
    }

    return kgPerSquareMeter *
        totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! /
        kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null) {
      return null;
    }

    if (totalRoofs?.flatOrMonoPitchedRoofType != RoofType.concreteBeam) {
      return 0;
    }

    return kgPerSquareMeter *
        totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! /
        1000;
  }
}

/// Katon kannatinniskat, 50x150, oletusväli 3000mm
class RoofBracketsFlatOrMonoPitchedRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  RoofBracketsFlatOrMonoPitchedRoof([this.totalRoofs, this.sizing = 3000]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerSqm /
      3000 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodenTrunk50x150mmKgPerCbm;

  @override
  num? get woodVolume {
    if (totalRoofs?.roofBaseArea == null) {
      return null;
    }

    if (totalRoofs!.flatOrMonoPitchedRoofType != RoofType.woodenTruss &&
        totalRoofs!.flatOrMonoPitchedRoofType != RoofType.steelTruss) {
      return 0;
    }

    return kgPerSquareMeter * totalRoofs!.roofBaseArea! / kgPerCubicMeter;
  }

  @override
  num? get woodTons {
    if (totalRoofs?.roofBaseArea == null) {
      return null;
    }

    if (totalRoofs!.flatOrMonoPitchedRoofType != RoofType.woodenTruss &&
        totalRoofs!.flatOrMonoPitchedRoofType != RoofType.steelTruss) {
      return 0;
    }

    return kgPerSquareMeter * totalRoofs!.roofBaseArea! / 1000;
  }
}

/// Vesikatto
/// Puurakenteinen aluslaudoitus kg/m2
class WoodenUnderPlankingWaterRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  WoodenUnderPlankingWaterRoof([this.totalRoofs, this.sizing = 16]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerSqm / 16 * sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerCbm;

  @override
  num? get woodVolume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    return kgPerSquareMeter *
        (totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! +
            totalRoofs!.defaultRidgeOrGableRoofCeilingArea!) /
        kgPerCubicMeter;
  }

  @override
  num? get woodTons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    return kgPerSquareMeter *
        (totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! +
            totalRoofs!.defaultRidgeOrGableRoofCeilingArea!) /
        1000;
  }
}

/// Tuulensuojavilla 30mm
class WindProofWoolWaterRoof extends DemolitionMaterials {
  final num sizing;
  final TotalRoofs? totalRoofs;

  WindProofWoolWaterRoof([this.totalRoofs, this.sizing = 30]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.windProofWool30mmKgPerSqm /
      30 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.windProofWool30mmKgPerCbm /
      30 *
      sizing;

  @override
  num? get volume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    return kgPerSquareMeter *
        (totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! +
            totalRoofs!.defaultRidgeOrGableRoofCeilingArea!) /
        kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    return kgPerSquareMeter *
        (totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! +
            totalRoofs!.defaultRidgeOrGableRoofCeilingArea!) /
        1000;
  }
}

/// Aluskate
class UnderLayWaterRoof extends DemolitionMaterials {
  final TotalRoofs? totalRoofs;

  UnderLayWaterRoof([this.totalRoofs]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.vaporBarrierKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.vaporBarrierKgPerCbm;

  @override
  num? get volume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    return kgPerSquareMeter *
        (totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! +
            totalRoofs!.defaultRidgeOrGableRoofCeilingArea!) /
        kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    return kgPerSquareMeter *
        (totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea! +
            totalRoofs!.defaultRidgeOrGableRoofCeilingArea!) /
        kgPerCubicMeter;
  }
}

/// Kattopelti
class RoofSheetWaterRoof extends DemolitionMaterials {
  final TotalRoofs? totalRoofs;

  RoofSheetWaterRoof([this.totalRoofs]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.roofSheet06mmKgPerSqm;

  @override
  num? get steelTons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    final flat =
        totalRoofs?.flatOrMonoPitchedWaterRoofType == WaterRoofType.metalRoof
            ? kgPerSquareMeter *
                totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea!
            : 0;

    final ridge =
        totalRoofs?.ridgeOrGableWaterRoofType == WaterRoofType.metalRoof
            ? kgPerSquareMeter * totalRoofs!.defaultRidgeOrGableRoofCeilingArea!
            : 0;

    return (flat + ridge) / 1000;
  }
}

/// Huopakatto
class FeltRoofWaterRoof extends DemolitionMaterials {
  final TotalRoofs? totalRoofs;

  FeltRoofWaterRoof([this.totalRoofs]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.feltRoofBitumenKermiKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.feltRoofBitumenKermiKgPerCbm;

  @override
  num? get volume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    final flat =
        totalRoofs!.flatOrMonoPitchedWaterRoofType == WaterRoofType.roofingFelt
            ? kgPerSquareMeter *
                totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea!
            : 0;

    final ridge =
        totalRoofs!.ridgeOrGableWaterRoofType == WaterRoofType.roofingFelt
            ? kgPerSquareMeter * totalRoofs!.defaultRidgeOrGableRoofCeilingArea!
            : 0;

    return (flat + ridge) / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    final flat =
        totalRoofs!.flatOrMonoPitchedWaterRoofType == WaterRoofType.roofingFelt
            ? kgPerSquareMeter *
                totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea!
            : 0;

    final ridge =
        totalRoofs!.ridgeOrGableWaterRoofType == WaterRoofType.roofingFelt
            ? kgPerSquareMeter * totalRoofs!.defaultRidgeOrGableRoofCeilingArea!
            : 0;

    return (flat + ridge) / 1000;
  }
}

///Mineriittikate

class MineriteCoveringWaterRoof extends DemolitionMaterials {
  final TotalRoofs? totalRoofs;

  MineriteCoveringWaterRoof([this.totalRoofs]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.mineriteCoveringKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.mineriteCoveringKgPerCbm;

  @override
  num? get volume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    final flat =
        totalRoofs!.flatOrMonoPitchedWaterRoofType == WaterRoofType.mineriteRoof
            ? kgPerSquareMeter *
                totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea!
            : 0;

    final ridge =
        totalRoofs!.ridgeOrGableWaterRoofType == WaterRoofType.mineriteRoof
            ? kgPerSquareMeter * totalRoofs!.defaultRidgeOrGableRoofCeilingArea!
            : 0;

    return (flat + ridge) / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    final flat =
        totalRoofs!.flatOrMonoPitchedWaterRoofType == WaterRoofType.mineriteRoof
            ? kgPerSquareMeter *
                totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea!
            : 0;

    final ridge =
        totalRoofs!.ridgeOrGableWaterRoofType == WaterRoofType.mineriteRoof
            ? kgPerSquareMeter * totalRoofs!.defaultRidgeOrGableRoofCeilingArea!
            : 0;

    return (flat + ridge) / 1000;
  }
}

/// Kattotiili
class RoofTileWaterRoof extends DemolitionMaterials {
  final TotalRoofs? totalRoofs;

  RoofTileWaterRoof([this.totalRoofs]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.roofTileKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.roofTileKgPerCbm;

  @override
  num? get volume {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    final flat =
        totalRoofs!.flatOrMonoPitchedWaterRoofType == WaterRoofType.tiledRoof
            ? kgPerSquareMeter *
                totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea!
            : 0;

    final ridge =
        totalRoofs!.ridgeOrGableWaterRoofType == WaterRoofType.tiledRoof
            ? kgPerSquareMeter * totalRoofs!.defaultRidgeOrGableRoofCeilingArea!
            : 0;

    return (flat + ridge) / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (totalRoofs?.defaultFlatOrMonoPitchedRoofCeilingArea == null ||
        totalRoofs?.defaultRidgeOrGableRoofCeilingArea == null) {
      return null;
    }

    final flat =
        totalRoofs!.flatOrMonoPitchedWaterRoofType == WaterRoofType.tiledRoof
            ? kgPerSquareMeter *
                totalRoofs!.defaultFlatOrMonoPitchedRoofCeilingArea!
            : 0;

    final ridge =
        totalRoofs!.ridgeOrGableWaterRoofType == WaterRoofType.tiledRoof
            ? kgPerSquareMeter * totalRoofs!.defaultRidgeOrGableRoofCeilingArea!
            : 0;

    return (flat + ridge) / 1000;
  }
}
