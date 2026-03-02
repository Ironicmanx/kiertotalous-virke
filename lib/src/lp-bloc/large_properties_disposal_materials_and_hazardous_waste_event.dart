abstract class DisposalMaterialsAndHazardousWasteEvent {
  const DisposalMaterialsAndHazardousWasteEvent();
}

class NonRecyclableBrickWasteDemolitionOrProcessingCostChanged
    extends DisposalMaterialsAndHazardousWasteEvent {
  final num? value;

  const NonRecyclableBrickWasteDemolitionOrProcessingCostChanged(this.value);
}

class ContaminatedSoilDemolitionOrProcessingCostChanged
    extends DisposalMaterialsAndHazardousWasteEvent {
  final num? value;

  const ContaminatedSoilDemolitionOrProcessingCostChanged(this.value);
}

class AsbestosOrBCPConcreteDemolitionOrProcessingCostChanged
    extends DisposalMaterialsAndHazardousWasteEvent {
  final num? value;

  const AsbestosOrBCPConcreteDemolitionOrProcessingCostChanged(this.value);
}

class BitumenDemolitionOrProcessingCostChanged
    extends DisposalMaterialsAndHazardousWasteEvent {
  final num? value;

  const BitumenDemolitionOrProcessingCostChanged(this.value);
}

class OtherAsbestosContainingMaterialDemolitionOrProcessingCostChanged
    extends DisposalMaterialsAndHazardousWasteEvent {
  final num? value;

  const OtherAsbestosContainingMaterialDemolitionOrProcessingCostChanged(
      this.value);
}
