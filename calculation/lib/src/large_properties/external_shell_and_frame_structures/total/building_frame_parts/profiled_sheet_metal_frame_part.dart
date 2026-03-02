import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import '../exports.dart';
import 'building_envelope_frame_part.dart';

part 'profiled_sheet_metal_frame_part.freezed.dart';

@freezed
abstract class ProfiledSheetMetalFramePart extends BuildingEnvelopeFramePart
    with _$ProfiledSheetMetalFramePart {
  ProfiledSheetMetalFramePart._();

  factory ProfiledSheetMetalFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _ProfiledSheetMetalFramePart;

  static final windProtectionBoardFrame = WindProtectionBoardFrame();
  static final mineralWoolFrame = MineralWoolFrame();
  static final plasterBoardFrame = PlasterBoardFrame();
  static final profiledSheetMetalBoard = ProfiledSheetMetalBoard();

  @override
  num? get windProtectionBoardTons => area == null
      ? null
      : area! * windProtectionBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get mineralWoolInsulationTons =>
      area == null ? null : area! * mineralWoolFrame.kgPerSquareMeter / 1000;

  @override
  num? get gypsumBoardTons =>
      area == null ? null : area! * plasterBoardFrame.kgPerSquareMeter / 1000;

  @override
  num? get profileSteelSheetTons => area == null
      ? null
      : area! * profiledSheetMetalBoard.kgPerSquareMeter / 1000;
}
