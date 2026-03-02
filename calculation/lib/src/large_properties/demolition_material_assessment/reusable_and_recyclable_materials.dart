import 'package:freezed_annotation/freezed_annotation.dart';

part 'reusable_and_recyclable_materials.freezed.dart';
part 'reusable_and_recyclable_materials.g.dart';

/// HYÖDYNTÄMISKELPOISET JA KIERRÄTETTÄVÄT MATERIAALIT
@freezed
abstract class ReusableAndRecyclableMaterials
    with _$ReusableAndRecyclableMaterials {
  ReusableAndRecyclableMaterials._();

  factory ReusableAndRecyclableMaterials(
      {num? cleanSoilDemolitionCost,
      num? asphaltWasteDemolitionCost,
      num? cleanConcreteDemolitionCost,
      num? concreteBlocksDemolitionCost,
      num? wallAndRoofTilesDemolitionCost,
      num? ceramicTilesDemolitionCost,
      num? rebarAndSteelScrapDemolitionCost,
      num? stainlessSteelDemolitionCost,
      num? copperDemolitionCost,
      num? aluminiumDemolitionCost,
      num? cleanUsableWoodDemolitionCost,
      num? combustibleWoodWasteDemolitionCost,
      num? glassDemolitionCost,
      num? glassAndMineralWoolDemolitionCost,
      num? fiberCementBoardsDemolitionCost,
      num? gypsumBoardsDemolitionCost,
      num? chipboardDemolitionCost,
      num? windProtectionBoardDemolitionCost,
      num? eWasteDemolitionCost,
      num? plasticWasteDemolitionCost,
      num? energyWasteDemolitionCost}) = _ReusableAndRecyclableMaterials;

  factory ReusableAndRecyclableMaterials.fromJson(Map<String, dynamic> json) =>
      _$ReusableAndRecyclableMaterialsFromJson(json);
}
