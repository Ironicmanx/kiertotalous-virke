import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalMetalsAndAlloysEvent {}

class MetalsAndAlloysChanged extends TotalMetalsAndAlloysEvent {
  final MetalsAndAlloys metalsAndAlloys;
  MetalsAndAlloysChanged(this.metalsAndAlloys);
}

class TotalDemolitionWasteAndCostsChanged extends TotalMetalsAndAlloysEvent {
  final TotalDemolitionWasteAndCosts totalDemolitionWasteAndCosts;
  TotalDemolitionWasteAndCostsChanged(this.totalDemolitionWasteAndCosts);
}
