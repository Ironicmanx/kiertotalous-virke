import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SmallPropertiesTotalDemolitionWasteAndCostsEvent {}

class TotalReusableAndRecyclableMaterialsChanged
    extends SmallPropertiesTotalDemolitionWasteAndCostsEvent {
  final SmallPropertiesTotalReusableAndRecyclableMaterials?
      totalReusableAndRecyclableMaterials;
  TotalReusableAndRecyclableMaterialsChanged(
      this.totalReusableAndRecyclableMaterials);
}

class TotalRecyclableComponentsAndFurnitureChanged
    extends SmallPropertiesTotalDemolitionWasteAndCostsEvent {
  final SmallPropertiesTotalRecyclableComponentsAndFurniture?
      totalRecyclableComponentsAndFurniture;
  TotalRecyclableComponentsAndFurnitureChanged(
      this.totalRecyclableComponentsAndFurniture);
}

class TotalDisposalMaterialsAndHazardousWasteChanged
    extends SmallPropertiesTotalDemolitionWasteAndCostsEvent {
  final SmallPropertiesTotalDisposalMaterialsAndHazardousWaste?
      totalDisposalMaterialsAndHazardousWaste;
  TotalDisposalMaterialsAndHazardousWasteChanged(
      this.totalDisposalMaterialsAndHazardousWaste);
}

class FoundationChanged
    extends SmallPropertiesTotalDemolitionWasteAndCostsEvent {
  final SmallPropertiesFoundation? foundation;
  FoundationChanged(this.foundation);
}

class CarportOrGarageChanged
    extends SmallPropertiesTotalDemolitionWasteAndCostsEvent {
  final CarportOrGarage? carportOrGarage;
  CarportOrGarageChanged(this.carportOrGarage);
}

class ThermalCenterChanged
    extends SmallPropertiesTotalDemolitionWasteAndCostsEvent {
  final ThermalCenter? thermalCenter;
  ThermalCenterChanged(this.thermalCenter);
}

class WallsChanged extends SmallPropertiesTotalDemolitionWasteAndCostsEvent {
  final Walls? walls;
  WallsChanged(this.walls);
}
