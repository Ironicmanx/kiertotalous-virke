import 'building_frame_part.dart';

abstract class StructuralBuildingFramePart extends BuildingFramePart {
  StructuralBuildingFramePart(
      {super.totalBuildingFrame, super.portionPercentage});

  num? get woodVolume => null;

  num? get woodTons => null;

  num? get concreteVolume => null;

  num? get concreteTons => null;

  num? get steelTons => null;

  num? get brickVolume => null;

  num? get brickTons => null;
}
