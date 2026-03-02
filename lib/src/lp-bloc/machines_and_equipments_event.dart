abstract class MachinesAndEquipmentsEvent {}

// Small Electrical Water Accumulators weight change
class SmallElectricalWaterAccumulatorsWeightChanged
    extends MachinesAndEquipmentsEvent {
  final num value;
  SmallElectricalWaterAccumulatorsWeightChanged(this.value);
}

// Small Electrical Water Accumulators quantity change
class SmallElectricalWaterAccumulatorsQuantityChanged
    extends MachinesAndEquipmentsEvent {
  final int value;
  SmallElectricalWaterAccumulatorsQuantityChanged(this.value);
}

// Large Electrical Water Accumulators weight change
class LargeElectricalWaterAccumulatorsWeightChanged
    extends MachinesAndEquipmentsEvent {
  final num value;
  LargeElectricalWaterAccumulatorsWeightChanged(this.value);
}

// Large Electrical Water Accumulators quantity change
class LargeElectricalWaterAccumulatorsQuantityChanged
    extends MachinesAndEquipmentsEvent {
  final int value;
  LargeElectricalWaterAccumulatorsQuantityChanged(this.value);
}

// Electric Radiators weight change
class ElectricRadiatorsWeightChanged extends MachinesAndEquipmentsEvent {
  final num value;
  ElectricRadiatorsWeightChanged(this.value);
}

// Electric Radiators quantity change
class ElectricRadiatorsQuantityChanged extends MachinesAndEquipmentsEvent {
  final int value;
  ElectricRadiatorsQuantityChanged(this.value);
}

// Water Circulated Radiators weight change
class WaterCirculatedRadiatorsWeightChanged extends MachinesAndEquipmentsEvent {
  final num value;
  WaterCirculatedRadiatorsWeightChanged(this.value);
}

// Water Circulated Radiators quantity change
class WaterCirculatedRadiatorsQuantityChanged
    extends MachinesAndEquipmentsEvent {
  final int value;
  WaterCirculatedRadiatorsQuantityChanged(this.value);
}

// Ventilation Units weight change
class VentilationUnitsWeightChanged extends MachinesAndEquipmentsEvent {
  final num value;
  VentilationUnitsWeightChanged(this.value);
}

// Ventilation Units quantity change
class VentilationUnitsQuantityChanged extends MachinesAndEquipmentsEvent {
  final int value;
  VentilationUnitsQuantityChanged(this.value);
}

// Electrical Distribution Cabinets and Meters weight change
class ElectricalDistributionCabinetsAndMetersWeightChanged
    extends MachinesAndEquipmentsEvent {
  final num value;
  ElectricalDistributionCabinetsAndMetersWeightChanged(this.value);
}

// Electrical Distribution Cabinets and Meters quantity change
class ElectricalDistributionCabinetsAndMetersQuantityChanged
    extends MachinesAndEquipmentsEvent {
  final int value;
  ElectricalDistributionCabinetsAndMetersQuantityChanged(this.value);
}

// Electric Motors and Circulation Pumps weight change
class ElectricMotorsAndCirculationPumpsWeightChanged
    extends MachinesAndEquipmentsEvent {
  final num value;
  ElectricMotorsAndCirculationPumpsWeightChanged(this.value);
}

// Electric Motors and Circulation Pumps quantity change
class ElectricMotorsAndCirculationPumpsQuantityChanged
    extends MachinesAndEquipmentsEvent {
  final int value;
  ElectricMotorsAndCirculationPumpsQuantityChanged(this.value);
}

// Roof Exhaust Fans weight change
class RoofExhaustFansWeightChanged extends MachinesAndEquipmentsEvent {
  final num value;
  RoofExhaustFansWeightChanged(this.value);
}

// Roof Exhaust Fans quantity change
class RoofExhaustFansQuantityChanged extends MachinesAndEquipmentsEvent {
  final int value;
  RoofExhaustFansQuantityChanged(this.value);
}

// Machines Recyclable change
class MachinesRecyclableChanged extends MachinesAndEquipmentsEvent {
  final bool value;
  MachinesRecyclableChanged(this.value);
}
