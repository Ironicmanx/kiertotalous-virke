import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalDemolitionWasteAndCostsEvent {}

class DemolitionWasteAndCostsChanged extends TotalDemolitionWasteAndCostsEvent {
  final DemolitionWasteAndCosts demolitionWasteAndCosts;

  DemolitionWasteAndCostsChanged(this.demolitionWasteAndCosts);
}

class TotalReusableAndRecyclableMaterialsChanged
    extends TotalDemolitionWasteAndCostsEvent {
  final TotalReusableAndRecyclableMaterials totalReusableAndRecyclableMaterials;

  TotalReusableAndRecyclableMaterialsChanged(
      this.totalReusableAndRecyclableMaterials);
}

class TotalRecyclableComponentsAndFurnitureChanged
    extends TotalDemolitionWasteAndCostsEvent {
  final TotalRecyclableComponentsAndFurniture
      totalRecyclableComponentsAndFurniture;

  TotalRecyclableComponentsAndFurnitureChanged(
      this.totalRecyclableComponentsAndFurniture);
}

class TotalDisposalMaterialsAndHazardousWasteChanged
    extends TotalDemolitionWasteAndCostsEvent {
  final TotalDisposalMaterialsAndHazardousWaste
      totalDisposalMaterialsAndHazardousWaste;

  TotalDisposalMaterialsAndHazardousWasteChanged(
      this.totalDisposalMaterialsAndHazardousWaste);
}

class TotalBuildingDimensionsChanged extends TotalDemolitionWasteAndCostsEvent {
  final TotalBuildingDimensions totalBuildingDimensions;

  TotalBuildingDimensionsChanged(this.totalBuildingDimensions);
}
