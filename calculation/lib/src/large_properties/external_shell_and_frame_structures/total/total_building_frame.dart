import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import '../../../utils/utils.dart';
import '../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import '../exports.dart';
import 'building_frame_parts/exports.dart';

part 'total_building_frame.freezed.dart';

@freezed
abstract class TotalBuildingFrame with _$TotalBuildingFrame {
  TotalBuildingFrame._();

  factory TotalBuildingFrame(
      {BuildingFrame? buildingFrame,
      Foundations? foundations}) = _TotalBuildingFrame;

  num? get externalWallsHeight => buildingFrame?.externalWallsAverageHeight;

  num? get externalWallsPerimeter {
    if (buildingFrame == null) {
      return null;
    }

    if (buildingFrame!.useFoundationCircumference == true) {
      return foundations?.circumference;
    }

    return buildingFrame?.externalWallsPerimeter;
  }

  late final StructuralBuildingFramePart woodFramePart = WoodFramePart(
      totalBuildingFrame: this,
      portionPercentage: buildingFrame?.woodPortionPercentage);

  late final StructuralBuildingFramePart glulamBeamsPart = GlulamBeamsFramePart(
      totalBuildingFrame: this,
      portionPercentage: buildingFrame?.glulamVerticalColumnsPortionPercentage);

  late final StructuralBuildingFramePart concreteVerticalColumnsPart =
      ConcreteVerticalColumnsFramePart(
          totalBuildingFrame: this,
          portionPercentage:
              buildingFrame?.concreteVerticalColumnsPortionPercentage);

  late final StructuralBuildingFramePart steelVerticalColumnsPart =
      SteelVerticalColumnsFramePart(
          totalBuildingFrame: this,
          portionPercentage:
              buildingFrame?.steelVerticalColumnsPortionPercentage);

  late final DoubleLoadBearingBrickWallFramePart
      doubleLoadBearingBrickWallPart = DoubleLoadBearingBrickWallFramePart(
          totalBuildingFrame: this,
          portionPercentage:
              buildingFrame?.doubleLoadBearingBrickWallPortionPercentage);

  late final ConcreteElementWallsWithoutFrameworkFramePart
      concreteElementWallsWithoutFrameworkPart =
      ConcreteElementWallsWithoutFrameworkFramePart(
          totalBuildingFrame: this,
          portionPercentage: buildingFrame
              ?.concreteElementWallsWithoutFrameworkPortionPercentage);

  late final BuildingEnvelopeFramePart brickVeneerWallFramePart =
      BrickVeneerWallFramePart(
          totalBuildingFrame: this,
          portionPercentage: buildingFrame?.brickCladWallPortionPercentage);

  late final BuildingEnvelopeFramePart woodenPlankWallFramePart =
      WoodenPlankWallFramePart(
          totalBuildingFrame: this,
          portionPercentage: buildingFrame?.boardWallPortionPercentage);

  late final BuildingEnvelopeFramePart profiledSheetMetalFramePart =
      ProfiledSheetMetalFramePart(
          totalBuildingFrame: this,
          portionPercentage:
              buildingFrame?.profiledSheetMetalPortionPercentage);

  late final BuildingEnvelopeFramePart steelSandwichPanelFramePart =
      SteelSandwichPanelFramePart(
          totalBuildingFrame: this,
          portionPercentage:
              buildingFrame?.steelProfileSandwichStructurePortionPercentage);

  late final BuildingEnvelopeFramePart mineriteOrOtherStoneFramePart =
      MineriteOrOtherStoneFramePart(
          totalBuildingFrame: this,
          portionPercentage:
              buildingFrame?.mineriteOrOtherStoneBoardPortionPercentage);

  num? get totalStructuralPartsPortionPercentage => Utils.sumOrNull([
        woodFramePart.portionPercentage,
        glulamBeamsPart.portionPercentage,
        concreteVerticalColumnsPart.portionPercentage,
        steelVerticalColumnsPart.portionPercentage,
        doubleLoadBearingBrickWallPart.portionPercentage,
        concreteElementWallsWithoutFrameworkPart.portionPercentage
      ]);

  num? get totalStructuralPartsArea => Utils.sumOrNull([
        woodFramePart.area,
        glulamBeamsPart.area,
        concreteVerticalColumnsPart.area,
        steelVerticalColumnsPart.area,
        doubleLoadBearingBrickWallPart.area,
        concreteVerticalColumnsPart.area
      ]);

  late final allEnvelopeParts = [
    brickVeneerWallFramePart,
    woodenPlankWallFramePart,
    profiledSheetMetalFramePart,
    steelSandwichPanelFramePart,
    mineriteOrOtherStoneFramePart,
    doubleLoadBearingBrickWallPart,
    concreteElementWallsWithoutFrameworkPart
  ];

  num? get totalEnvelopePartsPortionPercentage {
    if (!Utils.anyNonNull(
        allEnvelopeParts.map((t) => t.portionPercentage).toList())) {
      return null;
    }

    return allEnvelopeParts.fold<num>(
        0, (total, element) => total + (element.portionPercentage ?? 0));
  }

  num? get totalEnvelopePartsArea {
    if (!Utils.anyNonNull(
        allEnvelopeParts.map((t) => t.portionPercentage).toList())) {
      return null;
    }

    return allEnvelopeParts.fold<num>(
        0, (total, element) => total + (element.area ?? 0));
  }

  num? get woodVolume =>
      Utils.sumOrNull([woodFramePart.woodVolume, glulamBeamsPart.woodVolume]);

  num? get woodTons =>
      Utils.sumOrNull([woodFramePart.woodTons, glulamBeamsPart.woodTons]);

  num? get concreteVolume => Utils.sumOrNull([
        concreteVerticalColumnsPart.concreteVolume,
        concreteElementWallsWithoutFrameworkPart.concreteVolume
      ]);

  num? get concreteTons => Utils.sumOrNull([
        concreteVerticalColumnsPart.concreteTons,
        concreteElementWallsWithoutFrameworkPart.concreteTons
      ]);

  num? get steelTons => steelVerticalColumnsPart.steelTons;

  num? get brickVolume => doubleLoadBearingBrickWallPart.brickVolume;

  num? get brickTons => doubleLoadBearingBrickWallPart.brickTons;

  num? get windProtectionBoardTons {
    return _envelopeAggregate((t) => t.windProtectionBoardTons);
  }

  num? get mineralWoolInsulationTons {
    return _envelopeAggregate((t) => t.mineralWoolInsulationTons);
  }

  num? get limeOrRedBrickTons {
    return _envelopeAggregate((t) => t.limeOrRedBrickTons);
  }

  num? get exteriorWoodCladdingTons {
    return _envelopeAggregate((t) => t.exteriorWoodCladdingTons);
  }

  num? get gypsumBoardTons {
    return _envelopeAggregate((t) => t.gypsumBoardTons);
  }

  num? get profileSteelSheetTons {
    return _envelopeAggregate((t) => t.profileSteelSheetTons);
  }

  num? get semiHardFiberBoardTons {
    return _envelopeAggregate((t) => t.semiHardFiberBoardTons);
  }

  num? get styrofoamTons {
    return _envelopeAggregate((t) => t.styrofoamTons);
  }

  num? get plasterCoatingTons {
    return _envelopeAggregate((t) => t.plasterCoatingTons);
  }

  num? get mineriteBoardTons {
    return _envelopeAggregate((t) => t.mineriteBoardTons);
  }

  num? get windProtectionBoardVolume {
    if (windProtectionBoardTons == null) {
      return null;
    }

    return windProtectionBoardTons! *
        1000 /
        WindProtectionBoardFrame().kgPerCubicMeter;
  }

  num? get mineralWoolInsulationVolume {
    if (mineralWoolInsulationTons == null) {
      return null;
    }

    return mineralWoolInsulationTons! *
        1000 /
        MineralWoolFrame().kgPerCubicMeter;
  }

  num? get limeOrRedBrickVolume {
    if (limeOrRedBrickTons == null) {
      return null;
    }

    return limeOrRedBrickTons! * 1000 / LimeOrRedBrickFrame().kgPerCubicMeter;
  }

  num? get exteriorWoodCladdingVolume {
    if (exteriorWoodCladdingTons == null) {
      return null;
    }

    return exteriorWoodCladdingTons! *
        1000 /
        ExteriorCladdingBoardFrame().kgPerCubicMeter;
  }

  num? get gypsumBoardVolume {
    if (gypsumBoardTons == null) {
      return null;
    }

    return gypsumBoardTons! * 1000 / PlasterBoardFrame().kgPerCubicMeter;
  }

  num? get profileSteelSheetVolume {
    if (profileSteelSheetTons == null) {
      return null;
    }

    return profileSteelSheetTons! *
        1000 /
        ProfiledSheetMetalBoard().kgPerCubicMeter;
  }

  num? get semiHardFiberBoardVolume {
    if (semiHardFiberBoardTons == null) {
      return null;
    }

    return semiHardFiberBoardTons! *
        1000 /
        SemiHardFiberBoardFrame().kgPerCubicMeter;
  }

  num? get styrofoamVolume {
    if (styrofoamTons == null) {
      return null;
    }

    return styrofoamTons! * 1000 / StyrofoamFrame().kgPerCubicMeter;
  }

  num? get plasterCoatingVolume {
    if (plasterCoatingTons == null) {
      return null;
    }

    return plasterCoatingTons! *
        1000 /
        PlasteringInteriorAndExteriorWallsFrame().kgPerCubicMeter;
  }

  num? get mineriteBoardVolume {
    if (mineriteBoardTons == null) {
      return null;
    }

    return mineriteBoardTons! * 1000 / MineriteBoardFrame().kgPerCubicMeter;
  }

  num? _envelopeAggregate(num? Function(BuildingEnvelopeFramePart) function) {
    return Utils.aggregateOrNull(
        allEnvelopeParts, function, (total, part) => total + part, 0);
  }
}
