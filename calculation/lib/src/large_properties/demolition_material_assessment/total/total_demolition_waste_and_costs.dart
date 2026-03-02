import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../external_shell_and_frame_structures/total/exports.dart';
import '../demolition_waste_and_costs.dart';
import 'exports.dart';

part 'total_demolition_waste_and_costs.freezed.dart';

/// Purkujätteet ja kustannukset
@freezed
abstract class TotalDemolitionWasteAndCosts
    with _$TotalDemolitionWasteAndCosts {
  TotalDemolitionWasteAndCosts._();

  factory TotalDemolitionWasteAndCosts(
      {DemolitionWasteAndCosts? demolitionWasteAndCosts,
      TotalReusableAndRecyclableMaterials? totalReusableAndRecyclableMaterials,
      TotalRecyclableComponentsAndFurniture?
          totalRecyclableComponentsAndFurniture,
      TotalDisposalMaterialsAndHazardousWaste?
          totalDisposalMaterialsAndHazardousWaste,
      TotalBuildingDimensions?
          totalBuildingDimensions}) = _TotalDemolitionWasteAndCosts;

  /// Kokonaispurkujätemäärä (tilavuus)
  num? get totalVolume => Utils.sumOrNull([
        totalReusableAndRecyclableMaterials?.totalVolume,
        totalRecyclableComponentsAndFurniture?.totalVolume,
        totalDisposalMaterialsAndHazardousWaste?.totalVolume
      ]);

  /// Kokonaispurkujätemäärä (tonnit)
  num? get totalTons => Utils.sumOrNull([
        totalReusableAndRecyclableMaterials?.totalTons,
        totalRecyclableComponentsAndFurniture?.totalTons,
        totalDisposalMaterialsAndHazardousWaste?.totalTons
      ]);

  /// Rakennuksen purkujätemäärä (ei sisällä poistettavaa maata) (tilavuus)
  num? get totalVolumeExcludingExcavatedLand => totalVolume == null
      ? null
      : totalVolume! -
          (totalReusableAndRecyclableMaterials?.cleanSoil.volume ?? 0);

  /// Rakennuksen purkujätemäärä (ei sisällä poistettavaa maata) (tonnit)
  num? get totalTonsExcludingExcavatedLand => totalTons == null
      ? null
      : totalTons! - (totalReusableAndRecyclableMaterials?.cleanSoil.tons ?? 0);

  /// Purettavan rakennuksen kerrosala (m2)
  num? get buildingGrossFloorArea => totalBuildingDimensions?.grossFloorArea;

  /// Purettavan rakennuksen tilavuus (m3)
  num? get buildingVolume => totalBuildingDimensions?.volume;

  /// Purkumateriaalien mukaan laskettu purkukustannus (€/tonni)
  num? get demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials {
    if (Utils.anyNull([
      totalReusableAndRecyclableMaterials?.totalBatchPrice,
      totalDisposalMaterialsAndHazardousWaste?.totalBatchPrice,
      totalVolume
    ])) {
      return 0;
    }

    return (totalReusableAndRecyclableMaterials!.totalBatchPrice! +
            totalDisposalMaterialsAndHazardousWaste!.totalBatchPrice!) /
        totalVolume!;
  }

  /// Purkukustannus arvio (€)
  num? get estimatedDemolitionCost {
    if (demolitionWasteAndCosts?.demolitionCostPerTon != null) {
      if (totalTons == null) {
        return 0;
      }

      return demolitionWasteAndCosts!.demolitionCostPerTon! * totalTons!;
    }

    if (demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials == null ||
        totalVolume == null) {
      return 0;
    }

    return demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials! *
        totalVolume!;
  }

  /// Rakennuksen purkustannus (ei sisällä maanpoistoa)
  num? get estimatedDemolitionCostExcludingExcavations {
    if (demolitionWasteAndCosts?.demolitionCostPerTon != null) {
      if (totalTonsExcludingExcavatedLand == null) {
        return 0;
      }

      return demolitionWasteAndCosts!.demolitionCostPerTon! *
          totalTonsExcludingExcavatedLand!;
    }

    if (demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials == null ||
        totalVolumeExcludingExcavatedLand == null) {
      return 0;
    }

    return demolitionCostMaterialPerTonCalculatedFromDemolitionMaterials! *
        totalVolumeExcludingExcavatedLand!;
  }

  /// Purkukustannus/neliö (€/m2)
  num? get demolitionCostPerSquareMeter =>
      estimatedDemolitionCost == null || buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCost! / buildingGrossFloorArea!;

  /// Purkukustannus/neliö, ei sisällä maanpoistoa (€/m2)
  num? get demolitionCostPerSquareMeterExcludingExcavations =>
      estimatedDemolitionCostExcludingExcavations == null ||
              buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCostExcludingExcavations! /
              buildingGrossFloorArea!;

  /// Purkukustannus/rakennuskuutio (€/m3)
  num? get demolitionCostPerCubicMeter =>
      estimatedDemolitionCost == null || buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCost! / buildingVolume!;

  /// Purkukustannus/rakennuskuutio, ei sisällä maanpoistoa (€/m3)
  num? get demolitionCostPerCubicMeterExcludingExcavations =>
      estimatedDemolitionCostExcludingExcavations == null ||
              buildingGrossFloorArea == null
          ? 0
          : estimatedDemolitionCostExcludingExcavations! / buildingVolume!;

  /// Myytävät materiaalierät (€)
  num? get sellableMaterialBatchesPrice => Utils.sumOrNull([
        totalReusableAndRecyclableMaterials?.totalBatchPrice,
        totalRecyclableComponentsAndFurniture?.totalBatchPrice
      ]);
}
