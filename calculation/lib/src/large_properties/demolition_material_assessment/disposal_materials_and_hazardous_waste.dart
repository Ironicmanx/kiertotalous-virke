import 'package:freezed_annotation/freezed_annotation.dart';

part 'disposal_materials_and_hazardous_waste.freezed.dart';
part 'disposal_materials_and_hazardous_waste.g.dart';

/// Loppusijoitettavat materiaalit ja ongelmajätteet
@freezed
abstract class DisposalMaterialsAndHazardousWaste
    with _$DisposalMaterialsAndHazardousWaste {
  DisposalMaterialsAndHazardousWaste._();

  factory DisposalMaterialsAndHazardousWaste(
          {num? nonRecyclableBrickWasteDemolitionOrProcessingCost,
          num? contaminatedSoilDemolitionOrProcessingCost,
          num? asbestosOrBCPConcreteDemolitionOrProcessingCost,
          num? bitumenDemolitionOrProcessingCost,
          num? otherAsbestosContainingMaterialDemolitionOrProcessingCost}) =
      _DisposalMaterialsAndHazardousWaste;

  factory DisposalMaterialsAndHazardousWaste.fromJson(
          Map<String, dynamic> json) =>
      _$DisposalMaterialsAndHazardousWasteFromJson(json);
}
