import 'package:freezed_annotation/freezed_annotation.dart';

import '../demolition_material_assessment/demolition_waste_and_costs.dart';
import 'exports.dart';

part 'metals_and_alloys.freezed.dart';
part 'metals_and_alloys.g.dart';

/// metallit, niiden seokset (lejeeringit) mukaan luettuina
@freezed
abstract class MetalsAndAlloys with _$MetalsAndAlloys {
  MetalsAndAlloys._();

  factory MetalsAndAlloys(
      {String? copperBronzeAndBrassNotes,
      String? aluminiumNotes,
      String? ironAndSteelNotes,
      String? mixedMetalsNotes,
      WasteLawDemolitionMaterialEstimateEntry? lead,
      WasteLawDemolitionMaterialEstimateEntry? zinc,
      WasteLawDemolitionMaterialEstimateEntry? tin,
      WasteLawDemolitionMaterialEstimateEntry? contaminatedMetalWaste,
      WasteLawDemolitionMaterialEstimateEntry? hazardousOilAndTarCables,
      WasteLawDemolitionMaterialEstimateEntry? otherCables}) = _MetalsAndAlloys;

  factory MetalsAndAlloys.fromJson(Map<String, dynamic> json) =>
      _$MetalsAndAlloysFromJson(json);
}
