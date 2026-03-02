import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'demolition_material_assessment/exports.dart';
import 'external_shell_and_frame_structures/exports.dart';
import 'hvac_electrical_and_other_equipment/exports.dart';
import 'partition_walls_doors_and_windows/exports.dart';
import 'waste_law_demolition_material_estimates/exports.dart';

part 'large_properties_repository.freezed.dart';
part 'large_properties_repository.g.dart';

/// The purpose of this class is to provide the capability of writing the
/// large properties user-filled data into disk, and reading a the user-filled
/// data from disk. The data persistence is done by storing the class instances
/// as JSON.
///
/// This class additionally offers capabilities of restructuring the totals if
/// needed be.
@freezed
abstract class LargePropertiesRepository with _$LargePropertiesRepository {
  LargePropertiesRepository._();

  factory LargePropertiesRepository(
      {BuildingDimensions? buildingDimensions,
      BuildingFrame? buildingFrame,
      Cellar? cellar,
      ExcavationArea? excavationArea,
      FloorStructures? floorStructures,
      Foundations? foundations,
      IntermediateFloors? intermediateFloors,
      LargePropertyEvaluationInfo? largePropertyEvaluationInfo,
      Roofs? roofs,
      InternalWallFramesAndSurfaceMaterial?
          internalWallFramesAndSurfaceMaterial,
      Windows? windows,
      OuterDoors? outerDoors,
      InnerDoors? innerDoors,
      FixedFurniture? fixedFurniture,
      FixturesAndStructures? fixturesAndStructures,
      HvacAndElectricalInstallations? hvacAndElectricalInstallations,
      MachinesAndEquipments? machinesAndEquipments,
      YardAndProtectiveStructures? yardAndProtectiveStructures,
      DemolitionWasteAndCosts? demolitionWasteAndCosts,
      DisposalMaterialsAndHazardousWaste? disposalMaterialsAndHazardousWaste,
      RecyclableComponentsAndFurniture? recyclableComponentsAndFurniture,
      ReusableAndRecyclableMaterials? reusableAndRecyclableMaterials,
      ConcreteBricksTilesCeramics? concreteBricksTilesCeramics,
      WoodGlassPlastics? woodGlassPlastics,
      BituminousMixturesCoalTarProducts? bituminousMixturesCoalTarProducts,
      MetalsAndAlloys? metalsAndAlloys,
      SoilAggregatesDredgingMaterials? soilAggregatesDredgingMaterials,
      InsulationAndAsbestosContainingMaterials?
          insulationAndAsbestosContainingMaterials,
      GypsumBasedBuildingMaterials? gypsumBasedBuildingMaterials,
      OtherMaterials? otherMaterials}) = _LargePropertiesRepository;

  factory LargePropertiesRepository.fromJson(Map<String, dynamic> json) =>
      _$LargePropertiesRepositoryFromJson(json);

  TotalBuildingDimensions get totalBuildingDimensions =>
      TotalBuildingDimensions(
          buildingDimensions: buildingDimensions,
          cellar: cellar,
          foundations: foundations,
          buildingFrame: buildingFrame);

  TotalBuildingFrame get totalBuildingFrame => TotalBuildingFrame(
      buildingFrame: buildingFrame, foundations: foundations);

  TotalIntermediateFloors get totalIntermediateFloors =>
      TotalIntermediateFloors(
          intermediateFloors: intermediateFloors,
          totalBuildingDimensions: totalBuildingDimensions,
          foundations: foundations);

  TotalRoofs get totalRoofs =>
      TotalRoofs(foundations: foundations, roofs: roofs);

  TotalDemolitionWasteAndCosts get totalDemolitionWasteAndCosts =>
      TotalDemolitionWasteAndCosts(
          demolitionWasteAndCosts: demolitionWasteAndCosts,
          totalRecyclableComponentsAndFurniture:
              totalRecyclableComponentsAndFurniture,
          totalReusableAndRecyclableMaterials:
              totalReusableAndRecyclableMaterials,
          totalDisposalMaterialsAndHazardousWaste:
              totalDisposalMaterialsAndHazardousWaste,
          totalBuildingDimensions: totalBuildingDimensions);

  TotalDisposalMaterialsAndHazardousWaste
      get totalDisposalMaterialsAndHazardousWaste =>
          TotalDisposalMaterialsAndHazardousWaste(
              disposalMaterialsAndHazardousWaste:
                  disposalMaterialsAndHazardousWaste,
              excavationArea: excavationArea,
              cellar: cellar,
              fixedFurniture: fixedFurniture,
              floorStructures: floorStructures,
              foundations: foundations,
              internalWallFramesAndSurfaceMaterial:
                  internalWallFramesAndSurfaceMaterial);

  TotalRecyclableComponentsAndFurniture
      get totalRecyclableComponentsAndFurniture =>
          TotalRecyclableComponentsAndFurniture(
              totalIntermediateFloors: totalIntermediateFloors,
              totalRoofs: totalRoofs,
              totalBuildingFrame: totalBuildingFrame,
              fixturesAndStructures: fixturesAndStructures,
              outerDoors: outerDoors,
              innerDoors: innerDoors,
              windows: windows,
              machinesAndEquipments: machinesAndEquipments,
              recyclableComponentsAndFurniture:
                  recyclableComponentsAndFurniture);

  TotalReusableAndRecyclableMaterials get totalReusableAndRecyclableMaterials =>
      TotalReusableAndRecyclableMaterials(
          excavationArea: excavationArea,
          foundations: foundations,
          totalIntermediateFloors: totalIntermediateFloors,
          totalRoofs: totalRoofs,
          totalBuildingFrame: totalBuildingFrame,
          outerDoors: outerDoors,
          innerDoors: innerDoors,
          fixedFurniture: fixedFurniture,
          cellar: cellar,
          floorStructures: floorStructures,
          internalWallFramesAndSurfaceMaterial:
              internalWallFramesAndSurfaceMaterial,
          windows: windows,
          hvacAndElectricalInstallations: hvacAndElectricalInstallations,
          machinesAndEquipments: machinesAndEquipments,
          fixturesAndStructures: fixturesAndStructures,
          yardAndProtectiveStructures: yardAndProtectiveStructures,
          reusableAndRecyclableMaterials: reusableAndRecyclableMaterials);

  TotalBituminousMixturesCoalTarProducts
      get totalBituminousMixturesCoalTarProducts =>
          TotalBituminousMixturesCoalTarProducts(
              bituminousMixturesCoalTarProducts:
                  bituminousMixturesCoalTarProducts,
              totalDemolitionWasteAndCosts: totalDemolitionWasteAndCosts);

  TotalConcreteBricksTilesCeramics get totalConcreteBricksTilesCeramics =>
      TotalConcreteBricksTilesCeramics(
          concreteBricksTilesCeramics: concreteBricksTilesCeramics,
          foundations: foundations,
          totalIntermediateFloors: totalIntermediateFloors,
          totalRoofs: totalRoofs,
          totalBuildingFrame: totalBuildingFrame,
          internalWallFramesAndSurfaceMaterial:
              internalWallFramesAndSurfaceMaterial,
          totalDemolitionWasteAndCosts: totalDemolitionWasteAndCosts);

  TotalMetalsAndAlloys get totalMetalsAndAlloys => TotalMetalsAndAlloys(
      metalAndAlloys: metalsAndAlloys,
      totalDemolitionWasteAndCosts: totalDemolitionWasteAndCosts);

  TotalOtherMaterials get totalOtherMaterials => TotalOtherMaterials(
      otherMaterials: otherMaterials,
      totalDemolitionWasteAndCosts: totalDemolitionWasteAndCosts);

  TotalSoilAggregatesDredgingMaterials
      get totalSoilAggregatesDredgingMaterials =>
          TotalSoilAggregatesDredgingMaterials(
              soilAggregatesDredgingMaterials: soilAggregatesDredgingMaterials,
              totalDemolitionWasteAndCosts: totalDemolitionWasteAndCosts);

  TotalWoodGlassPlastics get totalWoodGlassPlastics => TotalWoodGlassPlastics(
      woodGlassPlastics: woodGlassPlastics,
      totalDemolitionWasteAndCosts: totalDemolitionWasteAndCosts);

  void writeToFileSync(File file) {
    file.writeAsStringSync(jsonEncode(toJson()));
  }

  static LargePropertiesRepository readFromFileSync(File file) {
    final fileString = file.readAsStringSync();
    final json = jsonDecode(fileString);
    return LargePropertiesRepository.fromJson(json);
  }
}
