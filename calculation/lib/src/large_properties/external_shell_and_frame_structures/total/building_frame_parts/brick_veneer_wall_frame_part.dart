import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import '../exports.dart';
import 'building_envelope_frame_part.dart';

part 'brick_veneer_wall_frame_part.freezed.dart';

@freezed
abstract class BrickVeneerWallFramePart extends BuildingEnvelopeFramePart
    with _$BrickVeneerWallFramePart {
  BrickVeneerWallFramePart._();

  factory BrickVeneerWallFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _BrickVeneerWallFramePart;

  final windProtectionBoardFrame = WindProtectionBoardFrame();
  final mineralWoolFrame = MineralWoolFrame();
  final limeOrRedBrickFrame = LimeOrRedBrickFrame();
  final plasterBoardFrame = PlasterBoardFrame();

  @override
  num? get windProtectionBoardTons => area == null
      ? null
      : area! * windProtectionBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get limeOrRedBrickTons =>
      area == null ? null : area! * limeOrRedBrickFrame.kgPerSquareMeter / 1000;

  @override
  num? get gypsumBoardTons =>
      area == null ? null : area! * plasterBoardFrame.kgPerSquareMeter / 1000;
}
