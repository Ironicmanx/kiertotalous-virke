import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';

part 'small_properties_repository.freezed.dart';
part 'small_properties_repository.g.dart';

/// The purpose of this class is to provide the capability of writing the
/// small properties user-filled data into disk, and reading a the user-filled
/// data from disk. The data persistence is done by storing the class instances
/// as JSON.
@freezed
abstract class SmallPropertiesRepository with _$SmallPropertiesRepository {
  SmallPropertiesRepository._();

  factory SmallPropertiesRepository(
          {Hvac? hvac,
          MachineryEquipmentAndFixedStructures?
              machineryEquipmentAndFixedStructures,
          Roof? roof,
          SmallPropertiesExcavationArea? smallPropertiesExcavationArea,
          SmallPropertiesFoundation? smallPropertiesFoundation,
          SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo,
          SmallPropertyInnerDoors? smallPropertyInnerDoors,
          SmallPropertyOuterDoors? smallPropertyOuterDoors,
          SmallPropertyWindows? smallPropertyWindows,
          Walls? walls,
          CarportOrGarage? carportOrGarage,
          HallDoors? hallDoors,
          PassageDoors? passageDoors,
          YardRoof? yardRoof,
          ThermalCenter? thermalCenter,
          Apartments? apartments,
          SmallPropertiesDisposalMaterialsAndHazardousWaste?
              smallPropertiesDisposalMaterialsAndHazardousWaste,
          SmallPropertiesRecyclableComponentsAndFurniture?
              smallPropertiesRecyclableComponentsAndFurniture,
          SmallPropertiesReusableAndRecyclableMaterials?
              smallPropertiesReusableAndRecyclableMaterials,
          DisposableAndHazardousNotes? disposableAndHazardousNotes,
          DisposableAndHazardousDemolitionOrProcessingCosts?
              disposableAndHazardousDemolitionProcessingCosts,
          RecyclableComponentsHandlingAndDismantlingCosts?
              recyclableComponentsHandlingAndDismantlingCosts,
          RecyclableComponentsNotes? recyclableComponentsNotes,
          RecyclableComponentsUnitPrice? recyclableComponentsUnitPrice,
          RecyclableMaterialsHandlingAndDismantlingCosts?
              recyclableMaterialsHandlingAndDismantlingCosts,
          RecyclableMaterialsMaterialValue? recyclableMaterialsMaterialValue,
          RecyclableMaterialsNotes? recyclableMaterialsNotes}) =
      _SmallPropertiesRepository;

  factory SmallPropertiesRepository.fromJson(Map<String, dynamic> json) =>
      _$SmallPropertiesRepositoryFromJson(json);

  void writeToFileSync(File file) {
    file.writeAsStringSync(jsonEncode(toJson()));
  }

  static SmallPropertiesRepository readFromFileSync(File file) {
    final fileString = file.readAsStringSync();
    final json = jsonDecode(fileString);
    return SmallPropertiesRepository.fromJson(json);
  }
}
