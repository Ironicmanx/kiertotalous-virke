abstract class DisposableAndHazardousCostsEvent {}

class CeramicTileCostsChanged extends DisposableAndHazardousCostsEvent {
  final num?
      ceramicTilePorcelainAndGlassAndInsulationWoolDemolitionOrProcessingCosts;
  CeramicTileCostsChanged(
      this.ceramicTilePorcelainAndGlassAndInsulationWoolDemolitionOrProcessingCosts);
}

class BrickWasteCostsChanged extends DisposableAndHazardousCostsEvent {
  final num? nonRecyclableBrickWasteDemolitionOrProcessingCosts;
  BrickWasteCostsChanged(
      this.nonRecyclableBrickWasteDemolitionOrProcessingCosts);
}

class PlasterBoardCostsChanged extends DisposableAndHazardousCostsEvent {
  final num? nonRecyclablePlasterBoardDemolitionOrProcessingCosts;
  PlasterBoardCostsChanged(
      this.nonRecyclablePlasterBoardDemolitionOrProcessingCosts);
}

class ContaminatedSoilCostsChanged extends DisposableAndHazardousCostsEvent {
  final num? contaminatedSoilDemolitionOrProcessingCosts;
  ContaminatedSoilCostsChanged(
      this.contaminatedSoilDemolitionOrProcessingCosts);
}

class AsbestosConcreteCostsChanged extends DisposableAndHazardousCostsEvent {
  final num? concreteContainingAsbestosDemolitionOrProcessingCosts;
  AsbestosConcreteCostsChanged(
      this.concreteContainingAsbestosDemolitionOrProcessingCosts);
}

class MineriteFeltCostsChanged extends DisposableAndHazardousCostsEvent {
  final num? mineriteOrFeltContainingAsbestosDemolitionOrProcessingCosts;
  MineriteFeltCostsChanged(
      this.mineriteOrFeltContainingAsbestosDemolitionOrProcessingCosts);
}

class PcbPaintCostsChanged extends DisposableAndHazardousCostsEvent {
  final num? concreteContainingPcbPaintingDemolitionOrProcessingCosts;
  PcbPaintCostsChanged(
      this.concreteContainingPcbPaintingDemolitionOrProcessingCosts);
}
