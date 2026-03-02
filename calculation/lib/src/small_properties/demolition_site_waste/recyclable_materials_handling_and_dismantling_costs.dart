import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_materials_handling_and_dismantling_costs.freezed.dart';
part 'recyclable_materials_handling_and_dismantling_costs.g.dart';

@freezed
abstract class RecyclableMaterialsHandlingAndDismantlingCosts
    with _$RecyclableMaterialsHandlingAndDismantlingCosts {
  RecyclableMaterialsHandlingAndDismantlingCosts._();

  factory RecyclableMaterialsHandlingAndDismantlingCosts(
          {@Default(6) num? cleanSoilHandlingAndDismantlingCosts,
          @Default(6) num? asphaltWasteHandlingAndDismantlingCosts,
          @Default(6) num? cleanConcreteHandlingAndDismantlingCosts,
          @Default(10) num? steelHandlingAndDismantlingCosts,
          @Default(6) num? wallAndRoofTilesHandlingAndDismantlingCosts,
          @Default(6) num? cleanUsableWoodHandlingAndDismantlingCosts,
          @Default(6) num? combustibleWoodWasteHandlingAndDismantlingCosts,
          @Default(10) num? windProtectionBoardHandlingAndDismantlingCosts,
          @Default(10) num? glassAndMineralWoolHandlingAndDismantlingCosts,
          @Default(10) num? gypsumBoardsHandlingAndDismantlingCosts,
          @Default(10) num? chipboardHandlingAndDismantlingCosts,
          @Default(6) num? energyWasteHandlingAndDismantlingCosts,
          @Default(10) num? glassHandlingAndDismantlingCosts,
          @Default(10) num? aluminiumHandlingAndDismantlingCosts,
          @Default(10) num? rebarAndSteelScrapHandlingAndDismantlingCosts,
          @Default(10) num? stainlessSteelHandlingAndDismantlingCosts,
          @Default(11) num? copperHandlingAndDismantlingCosts,
          @Default(6) num? concreteBlocksHandlingAndDismantlingCosts}) =
      _RecyclableMaterialsHandlingAndDismantlingCosts;

  factory RecyclableMaterialsHandlingAndDismantlingCosts.fromJson(
          Map<String, dynamic> json) =>
      _$RecyclableMaterialsHandlingAndDismantlingCostsFromJson(json);
}
