import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_components_handling_and_dismantling_costs.freezed.dart';
part 'recyclable_components_handling_and_dismantling_costs.g.dart';

/// betoni, tiilet, laatat ja keramiikka
@freezed
abstract class RecyclableComponentsHandlingAndDismantlingCosts
    with _$RecyclableComponentsHandlingAndDismantlingCosts {
  RecyclableComponentsHandlingAndDismantlingCosts._();

  factory RecyclableComponentsHandlingAndDismantlingCosts(
          {@Default(10) num? woodAndFiberboardDoorsHandlingAndDismantlingCosts,
          @Default(10) num? aluminumDoorsHandlingAndDismantlingCosts,
          @Default(10) num? steelDoorsHandlingAndDismantlingCosts,
          @Default(10) num? woodenWindowsHandlingAndDismantlingCosts,
          @Default(10) num? steelFrameWindowsHandlingAndDismantlingCosts,
          @Default(10) num? aluminumFrameWindowsHandlingAndDismantlingCosts,
          @Default(20) num? porcelainToiletsHandlingAndDismantlingCosts,
          @Default(10) num? cabinetsAndFurnitureHandlingAndDismantlingCosts,
          @Default(20) num? porcelainSinksHandlingAndDismantlingCosts,
          @Default(20) num? stainlessSteelSinksAndTablesHandlingAndDismantlingCosts,
          @Default(20) num? saunaStovesHandlingAndDismantlingCosts,
          @Default(20) num? electricStovesHandlingAndDismantlingCosts,
          @Default(20) num? refrigeratorsHandlingAndDismantlingCosts,
          @Default(20) num? waterAccumulatorsHandlingAndDismantlingCosts,
          @Default(20) num? electricMotorsHandlingAndDismantlingCosts,
          @Default(20) num? ventilationMachinesHandlingAndDismantlingCosts}) =
      _RecyclableComponentsHandlingAndDismantlingCosts;

  factory RecyclableComponentsHandlingAndDismantlingCosts.fromJson(
          Map<String, dynamic> json) =>
      _$RecyclableComponentsHandlingAndDismantlingCostsFromJson(json);
}
