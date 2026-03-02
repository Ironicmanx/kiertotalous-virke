abstract class DemolitionWasteAndCostsEvent {}

class DemolitionCostPerTonChanged extends DemolitionWasteAndCostsEvent {
  final num? value;

  DemolitionCostPerTonChanged(this.value);
}
