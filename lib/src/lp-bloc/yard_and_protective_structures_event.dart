abstract class YardAndProtectiveStructuresEvent {}

// Drip Trays & Protective Metal Sheets - Square Meters & Weight
class DripTraysSquareMetersChanged extends YardAndProtectiveStructuresEvent {
  final num value;
  DripTraysSquareMetersChanged(this.value);
}

class DripTraysWeightChanged extends YardAndProtectiveStructuresEvent {
  final num value;
  DripTraysWeightChanged(this.value);
}

// Concrete Paving Slabs - Square Meters & Weight
class ConcretePavingSlabsSquareMetersChanged
    extends YardAndProtectiveStructuresEvent {
  final num value;
  ConcretePavingSlabsSquareMetersChanged(this.value);
}

class ConcretePavingSlabsWeightChanged
    extends YardAndProtectiveStructuresEvent {
  final num value;
  ConcretePavingSlabsWeightChanged(this.value);
}
