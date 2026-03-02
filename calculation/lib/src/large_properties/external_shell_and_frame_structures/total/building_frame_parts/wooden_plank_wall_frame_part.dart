import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import '../exports.dart';
import 'building_envelope_frame_part.dart';

part 'wooden_plank_wall_frame_part.freezed.dart';

@freezed
abstract class WoodenPlankWallFramePart extends BuildingEnvelopeFramePart
    with _$WoodenPlankWallFramePart {
  WoodenPlankWallFramePart._();

  factory WoodenPlankWallFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _WoodenPlankWallFramePart;

  static final windProtectionBoardFrame = WindProtectionBoardFrame();
  static final mineralWoolFrame = MineralWoolFrame();
  static final limeOrRedBrickFrame = LimeOrRedBrickFrame();
  static final exteriorCladdingBoardFrame = ExteriorCladdingBoardFrame();
  static final plasterBoardFrame = PlasterBoardFrame();

  @override
  num? get windProtectionBoardTons => area == null
      ? null
      : area! * windProtectionBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get exteriorWoodCladdingTons => area == null
      ? null
      : area! * exteriorCladdingBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get gypsumBoardTons =>
      area == null ? null : area! * plasterBoardFrame.kgPerSquareMeter / 1000;
}
