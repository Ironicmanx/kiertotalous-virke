import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_components_and_furniture.freezed.dart';
part 'recyclable_components_and_furniture.g.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
abstract class RecyclableComponentsAndFurniture
    with _$RecyclableComponentsAndFurniture {
  RecyclableComponentsAndFurniture._();

  factory RecyclableComponentsAndFurniture({
    num? concreteFrameBeamsUnitPrice,
    num? concreteHollowSlabsUnitPrice,
    num? concreteRoofBeamsUnitPrice,
    num? concreteWallElementsUnitPrice,
    num? glulamBeamsUnitPrice,
    num? floorSupportWoodenBeamsUnitPrice,
    num? steelFrameBeamsUnitPrice,
    num? rainGuttersAndDownspoutsUnitPrice,
    num? fireLaddersAndWalkwaysUnitPrice,
    num? woodenRoofTrussesUnitPrice,
    num? steelRoofTrussesUnitPrice,
    num? steelChainLinkFenceUnitPrice,
    num? aluminumChainLinkFenceUnitPrice,
    num? woodAndFiberboardDoorsUnitPrice,
    num? aluminumDoorsUnitPrice,
    num? exteriorAndFireExitSteelDoorsUnitPrice,
    num? woodenOrBoardCabinetsAndFurnitureUnitPrice,
    num? steelLockerCabinetsUnitPrice,
    num? woodenWindowsUnitPrice,
    num? porcelainToiletsUnitPrice,
    num? porcelainSinksUnitPrice,
    num? stainlessSteelSinksAndTablesUnitPrice,
    num? saunaStovesUnitPrice,
    num? electricStovesUnitPrice,
    num? industrialElectricStovesUnitPrice,
    num? refrigeratorsUnitPrice,
    num? coldRoomCabinetsUnitPrice,
    num? electricRadiatorsUnitPrice,
    num? smallElectricalAccumulatorsUnitPrice,
    num? largeElectricalAccumulatorsUnitPrice,
    num? electricMotorsAndCirculationPumpsUnitPrice,
    num? ventilationUnitsUnitPrice,
    num? electricalDistributionCabinetsAndMetersUnitPrice,
    num? roofExhaustFansUnitPrice,
  }) = _RecyclableComponentsAndFurniture;

  factory RecyclableComponentsAndFurniture.fromJson(
          Map<String, dynamic> json) =>
      _$RecyclableComponentsAndFurnitureFromJson(json);
}
