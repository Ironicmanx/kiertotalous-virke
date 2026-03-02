import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_dimensions.freezed.dart';
part 'building_dimensions.g.dart';

@freezed
abstract class BuildingDimensions with _$BuildingDimensions {
  const factory BuildingDimensions(
      {num? grossFloorArea,
      num? volume,
      int? floorCountExcludingCellars,
      num? averageArea}) = _BuildingDimensions;

  factory BuildingDimensions.fromJson(Map<String, dynamic> json) =>
      _$BuildingDimensionsFromJson(json);
}
