import 'building_frame_part.dart';

abstract class BuildingEnvelopeFramePart extends BuildingFramePart {
  BuildingEnvelopeFramePart(
      {super.totalBuildingFrame, super.portionPercentage});

  num? get windProtectionBoardTons => null;

  num? get mineralWoolInsulationTons => null;

  num? get limeOrRedBrickTons => null;

  num? get exteriorWoodCladdingTons => null;

  num? get gypsumBoardTons => null;

  num? get profileSteelSheetTons => null;

  num? get semiHardFiberBoardTons => null;

  num? get styrofoamTons => null;

  num? get plasterCoatingTons => null;

  num? get mineriteBoardTons => null;
}
