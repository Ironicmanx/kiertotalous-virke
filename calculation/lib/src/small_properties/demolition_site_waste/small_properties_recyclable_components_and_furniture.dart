import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_properties_recyclable_components_and_furniture.freezed.dart';
part 'small_properties_recyclable_components_and_furniture.g.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
abstract class SmallPropertiesRecyclableComponentsAndFurniture
    with _$SmallPropertiesRecyclableComponentsAndFurniture {
  SmallPropertiesRecyclableComponentsAndFurniture._();

  factory SmallPropertiesRecyclableComponentsAndFurniture(
          {num? woodAndFiberDoorsUnitPrice,
          num? aluminiumDoorsUnitPrice,
          num? steelDoorsUnitPrice,
          num? woodenWindowsUnitPrice,
          num? steelFrameWindowsUnitPrice,
          num? aluminiumFrameWindowsUnitPrice,
          num? toiletSeatsUnitPrice,
          num? closetsAndFurnitureUnitPrice,
          num? washingSinkPorcelainUnitPrice,
          num? steelSinksAndTablesUnitPrice,
          num? saunaStovesUnitPrice,
          num? electricStovesUnitPrice,
          num? refrigeratorsUnitPrice,
          num? waterAccumulatorsUnitPrice,
          num? electricMotorsUnitPrice,
          num? ventilationMachinesUnitPrice,
          num? electricBoilerUnitPrice,
          num? districtHeatingMachineUnitPrice}) =
      _SmallPropertiesRecyclableComponentsAndFurniture;

  factory SmallPropertiesRecyclableComponentsAndFurniture.fromJson(
          Map<String, dynamic> json) =>
      _$SmallPropertiesRecyclableComponentsAndFurnitureFromJson(json);
}
