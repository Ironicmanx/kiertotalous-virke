import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'gypsum_based_building_materials.freezed.dart';
part 'gypsum_based_building_materials.g.dart';

/// kipsipohjaiset rakennusaineet
@freezed
abstract class GypsumBasedBuildingMaterials
    with _$GypsumBasedBuildingMaterials {
  const factory GypsumBasedBuildingMaterials(
          {WasteLawDemolitionMaterialEstimateEntry?
              contaminatedGypsumBasedMaterials,
          WasteLawDemolitionMaterialEstimateEntry? otherGypsumBasedMaterials}) =
      _GypsumBasedBuildingMaterials;

  factory GypsumBasedBuildingMaterials.fromJson(Map<String, dynamic> json) =>
      _$GypsumBasedBuildingMaterialsFromJson(json);
}
