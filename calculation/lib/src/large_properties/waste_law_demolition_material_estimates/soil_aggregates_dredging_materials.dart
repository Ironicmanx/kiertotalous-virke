import 'package:freezed_annotation/freezed_annotation.dart';

import '../demolition_material_assessment/demolition_waste_and_costs.dart';
import 'exports.dart';

part 'soil_aggregates_dredging_materials.freezed.dart';
part 'soil_aggregates_dredging_materials.g.dart';

/// maa-ainekset (pilaantuneilta alueilta kaivetut
/// maa-ainekset mukaan luettuina), kiviainekset ja ruoppausmassat
@freezed
abstract class SoilAggregatesDredgingMaterials
    with _$SoilAggregatesDredgingMaterials {
  SoilAggregatesDredgingMaterials._();

  factory SoilAggregatesDredgingMaterials(
          {String? hazardousSoilAndRockNotes,
          WasteLawDemolitionMaterialEstimateEntry? soilAndRock,
          WasteLawDemolitionMaterialEstimateEntry? hazardousDredgingSpoil,
          WasteLawDemolitionMaterialEstimateEntry? dredgingSpoil,
          WasteLawDemolitionMaterialEstimateEntry? hazardousRailwayBallast,
          WasteLawDemolitionMaterialEstimateEntry? railwayBallast}) =
      _SoilAggregatesDredgingMaterials;

  factory SoilAggregatesDredgingMaterials.fromJson(Map<String, dynamic> json) =>
      _$SoilAggregatesDredgingMaterialsFromJson(json);
}
