import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'insulation_and_asbestos_containing_materials.g.dart';

part 'insulation_and_asbestos_containing_materials.freezed.dart';

/// eristysaineet ja asbestia sisältävät rakennusaineet
@freezed
abstract class InsulationAndAsbestosContainingMaterials
    with _$InsulationAndAsbestosContainingMaterials {
  const factory InsulationAndAsbestosContainingMaterials(
          {WasteLawDemolitionMaterialEstimateEntry?
              asbestosContainingInsulationMaterials,
          WasteLawDemolitionMaterialEstimateEntry?
              otherHazardousInsulationMaterials,
          WasteLawDemolitionMaterialEstimateEntry? otherInsulationMaterials,
          WasteLawDemolitionMaterialEstimateEntry?
              asbestosContainingBuildingMaterials}) =
      _InsulationAndAsbestosContainingMaterials;

  factory InsulationAndAsbestosContainingMaterials.fromJson(
          Map<String, dynamic> json) =>
      _$InsulationAndAsbestosContainingMaterialsFromJson(json);
}
