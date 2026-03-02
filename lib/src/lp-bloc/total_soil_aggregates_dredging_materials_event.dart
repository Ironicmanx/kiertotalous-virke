import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalSoilAggregatesDredgingMaterialsEvent {}

class SoilAggregatesDredgingMaterialsChanged
    extends TotalSoilAggregatesDredgingMaterialsEvent {
  final SoilAggregatesDredgingMaterials soilAggregatesDredgingMaterials;
  SoilAggregatesDredgingMaterialsChanged(this.soilAggregatesDredgingMaterials);
}

class TotalDemolitionWasteAndCostsChanged
    extends TotalSoilAggregatesDredgingMaterialsEvent {
  final TotalDemolitionWasteAndCosts totalDemolitionWasteAndCosts;
  TotalDemolitionWasteAndCostsChanged(this.totalDemolitionWasteAndCosts);
}
