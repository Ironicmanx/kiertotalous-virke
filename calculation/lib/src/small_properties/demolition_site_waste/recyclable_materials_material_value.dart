import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_materials_material_value.freezed.dart';
part 'recyclable_materials_material_value.g.dart';

@freezed
abstract class RecyclableMaterialsMaterialValue
    with _$RecyclableMaterialsMaterialValue {
  RecyclableMaterialsMaterialValue._();

  factory RecyclableMaterialsMaterialValue(
          {@Default(0) num? cleanSoilMaterialValue,
          @Default(0) num? asphaltWasteMaterialValue,
          @Default(0) num? cleanConcreteMaterialValue,
          @Default(40) num? steelMaterialValue,
          @Default(0) num? wallAndRoofTilesMaterialValue,
          @Default(3) num? cleanUsableWoodMaterialValue,
          @Default(3) num? combustibleWoodWasteMaterialValue,
          @Default(0.5) num? windProtectionBoardMaterialValue,
          @Default(0) num? glassAndMineralWoolMaterialValue,
          @Default(0) num? gypsumBoardsMaterialValue,
          @Default(0.5) num? chipboardMaterialValue,
          @Default(0.5) num? energyWasteMaterialValue,
          @Default(0) num? glassMaterialValue,
          @Default(40) num? aluminiumMaterialValue,
          @Default(45) num? rebarAndSteelScrapMaterialValue,
          @Default(650) num? stainlessSteelMaterialValue,
          @Default(1300) num? copperMaterialValue,
          @Default(3) num? concreteBlocksMaterialValue}) =
      _RecyclableMaterialsMaterialValue;

  factory RecyclableMaterialsMaterialValue.fromJson(
          Map<String, dynamic> json) =>
      _$RecyclableMaterialsMaterialValueFromJson(json);
}
