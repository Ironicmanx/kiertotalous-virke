import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import '../exports.dart';
import 'structural_building_frame_part.dart';

part 'concrete_vertical_columns_frame_part.freezed.dart';

@freezed
abstract class ConcreteVerticalColumnsFramePart
    extends StructuralBuildingFramePart
    with _$ConcreteVerticalColumnsFramePart {
  ConcreteVerticalColumnsFramePart._();

  factory ConcreteVerticalColumnsFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _ConcreteVerticalColumnsFramePart;

  late final VerticalConcreteColumnsFrame? verticalConcreteColumnsFrame =
      VerticalConcreteColumnsFrame(totalBuildingFrame);

  @override
  num? get concreteVolume => verticalConcreteColumnsFrame?.concreteVolume;

  @override
  num? get concreteTons => verticalConcreteColumnsFrame?.concreteTons;
}
