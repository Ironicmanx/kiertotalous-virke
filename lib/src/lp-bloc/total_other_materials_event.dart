import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalOtherMaterialsEvent {}

class OtherMaterialsChanged extends TotalOtherMaterialsEvent {
  final OtherMaterials otherMaterials;
  OtherMaterialsChanged(this.otherMaterials);
}

class TotalDemolitionWasteAndCostsChanged extends TotalOtherMaterialsEvent {
  final TotalDemolitionWasteAndCosts totalDemolitionWasteAndCosts;
  TotalDemolitionWasteAndCostsChanged(this.totalDemolitionWasteAndCosts);
}
