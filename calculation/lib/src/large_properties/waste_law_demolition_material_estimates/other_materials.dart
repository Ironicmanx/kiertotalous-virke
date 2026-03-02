import 'package:freezed_annotation/freezed_annotation.dart';

import '../demolition_material_assessment/demolition_waste_and_costs.dart';
import 'exports.dart';

part 'other_materials.freezed.dart';
part 'other_materials.g.dart';

/// muut rakentamisessa ja purkamisessa syntyvät jätteet
@freezed
abstract class OtherMaterials with _$OtherMaterials {
  OtherMaterials._();

  factory OtherMaterials(
      {WasteLawDemolitionMaterialEstimateEntry? mercuryContainingMaterials,
      String? pcbContainingDemolitionWasteNotes,
      WasteLawDemolitionMaterialEstimateEntry? otherHazardousDemolitionWaste,
      WasteLawDemolitionMaterialEstimateEntry?
          otherDemolitionWaste}) = _OtherMaterials;

  factory OtherMaterials.fromJson(Map<String, dynamic> json) =>
      _$OtherMaterialsFromJson(json);
}
