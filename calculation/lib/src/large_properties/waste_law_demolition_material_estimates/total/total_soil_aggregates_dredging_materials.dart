import 'package:freezed_annotation/freezed_annotation.dart';

import '../../demolition_material_assessment/total/exports.dart';
import '../exports.dart';

part 'total_soil_aggregates_dredging_materials.freezed.dart';

/// maa-ainekset (pilaantuneilta alueilta kaivetut
/// maa-ainekset mukaan luettuina), kiviainekset ja ruoppausmassat
@freezed
abstract class TotalSoilAggregatesDredgingMaterials
    with _$TotalSoilAggregatesDredgingMaterials {
  TotalSoilAggregatesDredgingMaterials._();

  factory TotalSoilAggregatesDredgingMaterials(
          {SoilAggregatesDredgingMaterials? soilAggregatesDredgingMaterials,
          TotalDemolitionWasteAndCosts? totalDemolitionWasteAndCosts}) =
      _TotalSoilAggregatesDredgingMaterials;

  late final hazardousSoilAndRock = WasteLawDemolitionMaterialEstimateEntry(
      volume: totalDemolitionWasteAndCosts
          ?.totalDisposalMaterialsAndHazardousWaste?.contaminatedSoil.volume,
      tons: totalDemolitionWasteAndCosts
          ?.totalDisposalMaterialsAndHazardousWaste?.contaminatedSoil.tons,
      notes: soilAggregatesDredgingMaterials?.hazardousSoilAndRockNotes);

  WasteLawDemolitionMaterialEstimateEntry? get soilAndRock =>
      soilAggregatesDredgingMaterials?.soilAndRock;

  WasteLawDemolitionMaterialEstimateEntry? get hazardousDredgingSpoil =>
      soilAggregatesDredgingMaterials?.hazardousDredgingSpoil;

  WasteLawDemolitionMaterialEstimateEntry? get dredgingSpoil =>
      soilAggregatesDredgingMaterials?.dredgingSpoil;

  WasteLawDemolitionMaterialEstimateEntry? get hazardousRailwayBallast =>
      soilAggregatesDredgingMaterials?.hazardousRailwayBallast;

  WasteLawDemolitionMaterialEstimateEntry? get railwayBallast =>
      soilAggregatesDredgingMaterials?.railwayBallast;
}
