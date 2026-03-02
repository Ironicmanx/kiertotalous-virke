import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalWoodGlassPlasticsEvent {}

class WoodGlassPlasticsChanged extends TotalWoodGlassPlasticsEvent {
  final WoodGlassPlastics woodGlassPlastics;
  WoodGlassPlasticsChanged(this.woodGlassPlastics);
}

class TotalDemolitionWasteAndCostsChanged extends TotalWoodGlassPlasticsEvent {
  final TotalDemolitionWasteAndCosts totalDemolitionWasteAndCosts;
  TotalDemolitionWasteAndCostsChanged(this.totalDemolitionWasteAndCosts);
}
