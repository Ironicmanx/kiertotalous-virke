import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import '../exports.dart';
import 'structural_building_frame_part.dart';

part 'steel_vertical_columns_frame_part.freezed.dart';

@freezed
abstract class SteelVerticalColumnsFramePart extends StructuralBuildingFramePart
    with _$SteelVerticalColumnsFramePart {
  SteelVerticalColumnsFramePart._();

  factory SteelVerticalColumnsFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _SteelVerticalColumnsFramePart;

  late final VerticalSteelColumnsFrame? verticalSteelColumnsFrame =
      VerticalSteelColumnsFrame(totalBuildingFrame);

  @override
  num? get steelTons => verticalSteelColumnsFrame?.steelTons;
}
