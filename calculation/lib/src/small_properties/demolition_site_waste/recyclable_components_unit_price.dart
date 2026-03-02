import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_components_unit_price.freezed.dart';
part 'recyclable_components_unit_price.g.dart';

@freezed
abstract class RecyclableComponentsUnitPrice
    with _$RecyclableComponentsUnitPrice {
  RecyclableComponentsUnitPrice._();

  factory RecyclableComponentsUnitPrice(
          {@Default(5) num? woodAndFiberboardDoorsUnitPrice,
          @Default(10) num? aluminumDoorsUnitPrice,
          @Default(10) num? steelDoorsUnitPrice,
          @Default(5) num? woodenWindowsUnitPrice,
          @Default(10) num? steelFrameWindowsUnitPrice,
          @Default(10) num? aluminumFrameWindowsUnitPrice,
          @Default(10) num? porcelainToiletsUnitPrice,
          @Default(10) num? cabinetsAndFurnitureUnitPrice,
          @Default(10) num? porcelainSinksUnitPrice,
          @Default(10) num? stainlessSteelSinksAndTablesUnitPrice,
          @Default(10) num? saunaStovesUnitPrice,
          @Default(10) num? electricStovesUnitPrice,
          @Default(10) num? refrigeratorsUnitPrice,
          @Default(10) num? waterAccumulatorsUnitPrice,
          @Default(10) num? electricMotorsUnitPrice,
          @Default(10) num? ventilationMachinesUnitPrice}) =
      _RecyclableComponentsUnitPrice;

  factory RecyclableComponentsUnitPrice.fromJson(Map<String, dynamic> json) =>
      _$RecyclableComponentsUnitPriceFromJson(json);
}
