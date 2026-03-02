import '../../../bl_demolition_materials.dart';
import '../external_shell_and_frame_structures/foundation/exports.dart';
import 'demolition_materials.dart';

/// Valesokkeli
/// teräsbetonipaalu, metriä/neliö (m/m2)
class ReinforcedConcreteColumnFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnFalsePlinth([this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => kgPerMeter * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Anturan leikkauspoikkipinta-ala (m2)
class FootingFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FootingFalsePlinth([this.foundation, this.sizing = 0.6]);

  @override
  num? get kgPerMeter {
    if (volume == null || foundation?.circumference == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.circumference!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing * foundation!.circumference!;
  }

  @override
  num? get concreteTons {
    if (volume == null) {
      return null;
    }

    return volume! * (kgPerCubicMeter - steelKgPerCubicMeter) / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Muurattu harkko, perustuksen korkeus (m)
class ConcreteBlockFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockFalsePlinth([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing * 0.3 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Routastyrox, minimi kerros paksuus 100 mm
class FrostProofStyrofoamFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyrofoamFalsePlinth([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrofoam120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// FinnFoam, oletus paksuus 100mm
class FinnFoamFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamFalsePlinth([this.foundation, this.sizing = 100]);

  /// TODO: This is according to specs, but still seems a fishy to use frost proof
  /// styrofoam measurements for finn foam false plinth?
  @override
  num get kgPerSquareMeter =>
      FoundationWeights.frostProofStyrofoam100mmKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationWeights.frostProofStyrofoam100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Höyrysulkumuovi
class VaporBarrierPlasticFalsePlinth extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  VaporBarrierPlasticFalsePlinth([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Valesokkelin alapohja
/// Teräsbetonilaatta (mm)
class ReinforcedConcreteSlabFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteSlabFalsePlinthGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return steelKgPerCubicMeter * volume! / 1000;
  }
}

/// Kuumabitumisively
class HotBitumenBrushingFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  HotBitumenBrushingFalsePlinthGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => FoundationSlabWeights.hotBitumenBrushingKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.hotBitumenBrushingKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return foundation!.area! * kgPerSquareMeter / 1000;
  }
}

/// Mineraalivilla, oletus paksuus 100mm
class MineralWoolFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  MineralWoolFalsePlinthGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerSqm / 200 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerCbm / 200 * sizing;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Styrox r, oletuspaksuus 100mm
class StyrofoamFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  StyrofoamFalsePlinthGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrofoam120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Betonivalu, oletuspaksuus 100mm
class ConcreteCastingFalsePlinthGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteCastingFalsePlinthGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter {
    if (volume == null || foundation?.area == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.area!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get concreteTons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Rossipohja
/// Teräsbetonipaalu, metriä/neliö (m/m2)
class ReinforcedConcreteColumnCrawlSpace extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnCrawlSpace([this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => sizing * kgPerMeter;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Teräsbetonivalusokkeli
class ReinforcedConcreteCastFoundationCrawlSpace extends DemolitionMaterials {
  final num width;
  final num height;
  final Foundation? foundation;

  ReinforcedConcreteCastFoundationCrawlSpace(
      [this.foundation, this.width = 0.3, this.height = 0.6]);

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return width * height * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Muurattu harkko, perustuksen korkeus (m)
class ConcreteBlockCrawlSpace extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockCrawlSpace([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return foundation!.circumference! * 0.3 * sizing;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Rossipohjan alapohja
/// Kutterinpuru, oletuspaksuuu 200mm
class WoodShavingsCrawlSpaceGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  WoodShavingsCrawlSpaceGroundFloor([this.foundation, this.sizing = 200]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodShavings100mmKgPerSqm /
      100 *
      sizing;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.woodShavings100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Puurunko, oletus 50x100, väli 600mm, rungon oletuspaino/m2 (kg/m2)
class WoodFrameCrawlSpaceGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  WoodFrameCrawlSpaceGroundFloor([this.foundation, this.sizing = 3.1]);

  @override
  num get kgPerSquareMeter =>
      sizing / 3.1 * ExteriorWallWeights.woodFrame45x100mmKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.woodFrame45x100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / 1000;
  }
}

/// Umpilaudoitus, laudan paksuus oletus 25mm (mm)
class SolidBoardingCrawlSpaceGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  SolidBoardingCrawlSpaceGroundFloor([this.foundation, this.sizing = 25]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerSqm / 25 * sizing;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Rakennuspahvi
class ConstructionPaperCrawlSpaceGroundFloor extends DemolitionMaterials {
  final Foundation? foundation;

  ConstructionPaperCrawlSpaceGroundFloor([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Tervapaperi
class TarPaperCrawlSpaceGroundFloor
    extends ConstructionPaperCrawlSpaceGroundFloor {
  // Can this be removed? tar paper is identical to construction paper
  TarPaperCrawlSpaceGroundFloor([super.foundation]);
}

/// Matalaperustus
/// Teräsbetonipaalu, metriä/neliö (m/m2)
class ReinforcedConcreteColumnShallowFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnShallowFoundation([this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => sizing * kgPerMeter;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Routastyrox, minimi kerros paksuus 100 mm
class FrostProofStyrofoamShallowFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyrofoamShallowFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrofoam120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// FinnFoam, oletus paksuus 100mm
class FinnFoamShallowFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamShallowFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => ExteriorWallWeights.woodFrame45x100mmKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.woodFrame45x100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Höyrysulkumuovi
class VaporBarrierPlasticShallowFoundation extends DemolitionMaterials {
  final Foundation? foundation;

  VaporBarrierPlasticShallowFoundation([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Matalaperustuksen alapohja
/// Teräsbetonilaatta (mm)
class ReinforcedConcreteSlabShallowFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteSlabShallowFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }

  @override
  num? get concreteTons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Kuumabitumisively
class HotBitumenBrushingShallowFoundationGroundFloor
    extends DemolitionMaterials {
  final Foundation? foundation;

  HotBitumenBrushingShallowFoundationGroundFloor([this.foundation]);

  @override
  num get kgPerSquareMeter => FoundationSlabWeights.hotBitumenBrushingKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.hotBitumenBrushingKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Mineraalivilla, oletus paksuus 100mm
class MineralWoolShallowFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  MineralWoolShallowFoundationGroundFloor([this.foundation, this.sizing = 200]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerSqm / 200 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerCbm / 200 * sizing;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Styrox r, oletuspaksuus 100mm
class StyrofoamShallowFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  StyrofoamShallowFoundationGroundFloor([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrofoam120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Betonivalu, oletuspaksuus 100mm
class ConcreteCastingShallowFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteCastingShallowFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter {
    if (volume == null || foundation?.area == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.area!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get concreteTons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Pilariperustus
/// teräsbetonipaalu, metriä/neliö (m/m2)
class ReinforcedConcreteColumnColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnColumnFoundation([this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => kgPerMeter * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250KgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Muurattu harkko, perustuksen korkeus (m)
class ConcreteBlockColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockColumnFoundation([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * 0.3 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Routastyrox, minimi kerros paksuus 100 mm
class FrostProofStyrofoamColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyrofoamColumnFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrofoam120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// FinnFoam, oletus paksuus 100mm
class FinnFoamColumnFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamColumnFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      UpperBaseStructureAndWaterRoofWeights.hardDiskKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      UpperBaseStructureAndWaterRoofWeights.hardDiskKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Höyrysulkumuovi
class VaporBarrierPlasticColumnFoundation extends DemolitionMaterials {
  final Foundation? foundation;

  VaporBarrierPlasticColumnFoundation([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Pilariperustuksen alapohja
/// Puurunko, oletus 50x100, väli 600mm, rungon oletuspaino/m2 (kg/m2)
class WoodFrameColumnFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  WoodFrameColumnFoundationGroundFloor([this.foundation, this.sizing = 3.1]);

  @override
  num get kgPerSquareMeter =>
      sizing / 3.1 * CellarStructureWeights.ceramicTileKgPerSqm;

  @override
  num get kgPerCubicMeter => ExteriorWallWeights.woodFrame45x100mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! / 1000;
  }
}

/// Umpilaudoitus, laudan paksuus oletus 25mm (mm)
class SolidBoardingColumnFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  SolidBoardingColumnFoundationGroundFloor([this.foundation, this.sizing = 25]);

  @override
  num get kgPerSquareMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerSqm / 25 * sizing;

  @override
  num get kgPerCubicMeter =>
      ExteriorWallWeights.claddingAndFloorboard25mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Ontelolaattaperustus
/// Teräsbetonipaalu, metriä/neliö (m/m2)
class ReinforcedConcreteColumnHollowCoreSlabFoundation
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ReinforcedConcreteColumnHollowCoreSlabFoundation(
      [this.foundation, this.sizing = 0]);

  @override
  num get kgPerMeter => FoundationWeights.reinforcedConcreteColumn250x250KgPerM;

  @override
  num get kgPerSquareMeter => sizing * kgPerMeter;

  @override
  num get kgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.reinforcedConcreteColumn250x250SteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing * foundation!.area! * kgPerMeter / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (volume == null || steelTons == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000 - steelTons!;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Muurattu harkko, perustuksen korkeus (m)
class ConcreteBlockHollowCoreSlabFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteBlockHollowCoreSlabFoundation([this.foundation, this.sizing = 0.6]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.blockFoundationKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationStructureWeights.blockFoundationKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing * 0.3 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Routastyrox, minimi kerros paksuus 100 mm
class FrostProofStyrofoamHollowCoreSlabFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FrostProofStyrofoamHollowCoreSlabFoundation(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrofoam120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// FinnFoam, oletus paksuus 100mm
class FinnFoamHollowCoreSlabFoundation extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  FinnFoamHollowCoreSlabFoundation([this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter => DividingWallWeights.limeSandBrick130mmKgPerSqm;

  @override
  num get kgPerCubicMeter => DividingWallWeights.limeSandBrick130mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return sizing / 1000 * foundation!.area!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Höyrysulkumuovi
class VaporBarrierPlasticHollowCoreSlabFoundation extends DemolitionMaterials {
  final Foundation? foundation;

  VaporBarrierPlasticHollowCoreSlabFoundation([this.foundation]);

  @override
  num get kgPerSquareMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerSqm;

  @override
  num get kgPerCubicMeter =>
      FoundationStructureWeights.vapourBarrierPlasticAndBuildingPaperKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Ontelolaattaperustuksen alapohja
/// Ontelolaatta (kg/m2)
class HollowCoreSlabHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  HollowCoreSlabHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 260]);

  // The multiplication/division here makes no sense, but keeping this just for the record.
  @override
  num get kgPerSquareMeter =>
      sizing /
      FoundationWeights.hollowSlab200mmKgPerSqm *
      FoundationWeights.hollowSlab200mmKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationWeights.hollowSlab200mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / kgPerCubicMeter;
  }

  @override
  num? get concreteTons {
    if (foundation?.area == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.area! / 1000;
  }
}

/// Kuumabitumisively
class HotBitumenBrushingHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final Foundation? foundation;

  HotBitumenBrushingHollowCoreSlabFoundationGroundFloor([this.foundation]);

  @override
  num get kgPerSquareMeter => FoundationSlabWeights.hotBitumenBrushingKgPerSqm;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.hotBitumenBrushingKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / 1000;
  }
}

/// Mineraalivilla, oletus paksuus 100mm
class MineralWoolHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  MineralWoolHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerSqm / 200 * sizing;

  @override
  num get kgPerCubicMeter =>
      FoundationSlabWeights.mineralWool200mmKgPerCbm / 200 * sizing;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / kgPerCubicMeter;
  }

  @override
  num? get tons {
    if (foundation?.circumference == null) {
      return null;
    }

    return kgPerSquareMeter * foundation!.circumference! / 1000;
  }
}

/// Styrox r, oletuspaksuus 100mm
class StyrofoamHollowCoreSlabFoundationGroundFloor extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  StyrofoamHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num get kgPerSquareMeter =>
      FoundationSlabWeights.styrofoam120mmKgPerSqm / 120 * sizing;

  @override
  num get kgPerCubicMeter => FoundationSlabWeights.styrofoam120mmKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing / 1000 * foundation!.circumference!;
  }

  @override
  num? get tons {
    if (volume == null) {
      return null;
    }

    return volume! * kgPerCubicMeter / 1000;
  }
}

/// Betonivalu, oletuspaksuus 100mm
class ConcreteCastingHollowCoreSlabFoundationGroundFloor
    extends DemolitionMaterials {
  final num sizing;
  final Foundation? foundation;

  ConcreteCastingHollowCoreSlabFoundationGroundFloor(
      [this.foundation, this.sizing = 100]);

  @override
  num? get kgPerSquareMeter {
    if (foundation?.circumference == null || volume == null) {
      return null;
    }

    return kgPerCubicMeter * volume! / foundation!.circumference!;
  }

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;

  @override
  num? get volume {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing / 1000 * foundation!.circumference!;
  }

  @override
  num? get concreteTons {
    if (foundation?.circumference == null) {
      return null;
    }

    return sizing / 1000 * foundation!.circumference! * kgPerCubicMeter / 1000;
  }

  @override
  num? get steelTons {
    if (volume == null) {
      return null;
    }

    return volume! * steelKgPerCubicMeter / 1000;
  }
}

/// Välipohjarakenne
/// Betonivalu, paksuus oletus 200mm (m2)
class ConcreteCastingIntermediateFloorFrames extends DemolitionMaterials {
  final num sizing;

  ConcreteCastingIntermediateFloorFrames([this.sizing = 200]);

  @override
  num get kgPerSquareMeter => sizing / 1000 * kgPerCubicMeter;

  @override
  num get kgPerCubicMeter => FoundationWeights.concreteCastingKgPerCbm;

  @override
  num get steelKgPerCubicMeter =>
      FoundationWeights.concreteCastingSteelKgPerCbm;
}

/// Liimapalkki, oletusmäärä 0,4jm/lattianeliölle (m2)
class GlulamBeamsIntermediateFloorFrames extends DemolitionMaterials {
  final num sizing;

  GlulamBeamsIntermediateFloorFrames([this.sizing = 0.4]);

  @override
  num get kgPerMeter => UpperBaseStructureAndWaterRoofWeights
      .glulamBeamsVolume004SqmPerLinearMeterKgPerM;

  @override
  num get kgPerSquareMeter => kgPerMeter * sizing;

  @override
  num get kgPerCubicMeter => UpperBaseStructureAndWaterRoofWeights
      .glulamBeamsVolume004SqmPerLinearMeterKgPerCbm;
}
