import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'apartment.freezed.dart';
part 'apartment.g.dart';

/// Huoneistot
@freezed
abstract class Apartment with _$Apartment {
  const Apartment._();

  const factory Apartment(
      {num? pcsPerHouse,
      num? floorAreaPerApartment,
      num? innerWallsPerApartmentLinearMeters,
      num? wallHeight,
      SurfaceMaterial? surfaceMaterial,
      FloorMaterial? floorMaterial,
      KitchenWallMaterial? kitchenWallMaterial,
      BathroomWallMaterial? bathroomWallMaterial,
      BathroomFloorMaterial? bathroomFloorMaterial,
      num? kitchenWallMaterialAreaPerApartment,
      num? kitchenClosetsInLinearMeter,
      @Default(false) bool areKitchenClosetsRecyclable,
      num? dressingClosetsInLinearMeter,
      @Default(false) bool areDressingClosetsRecyclable,
      num? bathroomWallAreaPerApartment,
      num? bathroomFloorAreaPerApartment,
      num? saunaPanelingAreaPerApartment,
      num? apartmentSpecificKitchenToiletOrSaunaFurniture,
      @Default(false) bool isFurnitureRecyclable,
      @Default(false) bool toiletSeat,
      @Default(false) bool ceramicSink,
      @Default(false) bool refrigerator,
      @Default(false) bool electricStove,
      @Default(false) bool steelTable,
      @Default(false) bool waterHeater,
      @Default(false) bool saunaStove}) = _Apartment;

  factory Apartment.fromJson(Map<String, dynamic> json) =>
      _$ApartmentFromJson(json);

  num? get wallAreaPerApartment =>
      Utils.multiplyOrNull([innerWallsPerApartmentLinearMeters, wallHeight]);

  num? get trunkWoodPerApartmentTons {
    if (wallAreaPerApartment == null && floorAreaPerApartment == null) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrNull([
            wallAreaPerApartment ?? 0,
            WoodMaterialInfo.woodWeightPerSquareMeter(
                WoodMaterialType.trunkWood50x100)
          ]),
          Utils.multiplyOrNull([
            floorAreaPerApartment ?? 0,
            WoodMaterialInfo.woodWeightPerSquareMeter(
                WoodMaterialType.trunkWood50x150)
          ])
        ])! /
        1000;
  }
}
