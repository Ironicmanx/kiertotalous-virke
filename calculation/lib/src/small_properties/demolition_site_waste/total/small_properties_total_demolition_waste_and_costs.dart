import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../demolition_site_waste/total/exports.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../yard_buildings_and_structures/exports.dart';

part 'small_properties_total_demolition_waste_and_costs.freezed.dart';

/// Purkujätteet ja kustannukset
@freezed
abstract class SmallPropertiesTotalDemolitionWasteAndCosts
    with _$SmallPropertiesTotalDemolitionWasteAndCosts {
  SmallPropertiesTotalDemolitionWasteAndCosts._();

  factory SmallPropertiesTotalDemolitionWasteAndCosts({
    SmallPropertiesTotalReusableAndRecyclableMaterials?
        totalReusableAndRecyclableMaterials,
    SmallPropertiesTotalRecyclableComponentsAndFurniture?
        totalRecyclableComponentsAndFurniture,
    SmallPropertiesTotalDisposalMaterialsAndHazardousWaste?
        totalDisposalMaterialsAndHazardousWaste,
    SmallPropertiesFoundation? foundation,
    CarportOrGarage? carportOrGarage,
    ThermalCenter? thermalCenter,
    Walls? walls,
  }) = _TotalDemolitionWasteAndCosts;

  /// Kokonaispurkujätemäärä (tonnit)
  num? get totalTons => Utils.sumOrNull([
        totalReusableAndRecyclableMaterials?.totalQuantityEstimate,
        totalRecyclableComponentsAndFurniture?.totalQuantityEstimate,
        totalDisposalMaterialsAndHazardousWaste?.totalQuantityEstimate
      ]);

  /// Purkukustannus arvio (€)
  num? get estimatedDemolitionCost => Utils.sumOrNull([
        totalReusableAndRecyclableMaterials?.totalDemolitionCost,
        totalRecyclableComponentsAndFurniture?.totalDemolitionCost,
        totalDisposalMaterialsAndHazardousWaste?.totalDemolitionBatchPrice
      ]);

  /// Purkukustannus/neliö (€/m2)
  num? get demolitionCostPerSquareMeter {
    if (estimatedDemolitionCost == null) {
      return null;
    }
    num? totalArea = Utils.sumOrNull([
      foundation?.concreteSlabAreaInSquareMeters,
      Utils.multiplyOrNull([
        carportOrGarage?.buildingLengthInMeters,
        carportOrGarage?.buildingWidthInMeters
      ]),
      Utils.multiplyOrNull([
        thermalCenter?.concreteLengthInMeters,
        thermalCenter?.concreteWidthInMeters
      ])
    ]);
    return totalArea == null ? null : estimatedDemolitionCost! / totalArea;
  }

  /// Purkukustannus/rakennuskuutio (€/m3)
  num? get demolitionCostPerCubicMeter {
    if (estimatedDemolitionCost == null) {
      return null;
    }
    num? totalVolume = Utils.sumOrNull([
      Utils.multiplyOrNull(
          [foundation?.concreteSlabAreaInSquareMeters, walls?.heightInMeters]),
      Utils.multiplyOrNull([
        carportOrGarage?.buildingLengthInMeters,
        carportOrGarage?.buildingWidthInMeters,
        carportOrGarage?.wallAverageHeight
      ]),
      Utils.multiplyOrNull([
        thermalCenter?.concreteLengthInMeters,
        thermalCenter?.concreteWidthInMeters,
        thermalCenter?.wallHeightInMeters
      ])
    ]);
    return totalVolume == null ? null : estimatedDemolitionCost! / totalVolume;
  }

  /// Myytävät materiaalierät (€)
  num? get sellableMaterialBatchesPrice => Utils.sumOrNull([
        totalReusableAndRecyclableMaterials?.totalMaterialPrice,
        totalRecyclableComponentsAndFurniture?.totalBatchPrice
      ]);
}
