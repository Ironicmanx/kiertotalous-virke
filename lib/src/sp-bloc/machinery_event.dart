import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SPMachineryEvent {}

class SPAreElectricMotorsRecyclableChanged extends SPMachineryEvent {
  final bool value;
  SPAreElectricMotorsRecyclableChanged(this.value);
}

class SPAreVentilationMachinesRecyclableChanged extends SPMachineryEvent {
  final bool value;
  SPAreVentilationMachinesRecyclableChanged(this.value);
}

class SPElectricMotorsChanged extends SPMachineryEvent {
  final num value;
  SPElectricMotorsChanged(this.value);
}

class SPVentilationMachinesChanged extends SPMachineryEvent {
  final num value;
  SPVentilationMachinesChanged(this.value);
}

class SPElectricalDistributionMachinesAndMetersChanged
    extends SPMachineryEvent {
  final num value;
  SPElectricalDistributionMachinesAndMetersChanged(this.value);
}

class SPWaterCirculationRadiatorsChanged extends SPMachineryEvent {
  final num value;
  SPWaterCirculationRadiatorsChanged(this.value);
}

class SPAreConcreteYardTilesAndWallStonesRecyclableChanged
    extends SPMachineryEvent {
  final bool value;
  SPAreConcreteYardTilesAndWallStonesRecyclableChanged(this.value);
}

class SPFencesBetweenApartmentsChanged extends SPMachineryEvent {
  final FencesBetweenApartments? value;
  SPFencesBetweenApartmentsChanged(this.value);
}

class SPConcreteYardTilesAndStonesInSquareMetersChanged
    extends SPMachineryEvent {
  final num value;
  SPConcreteYardTilesAndStonesInSquareMetersChanged(this.value);
}

class SPFencesBetweenApartmentsInMetersChanged extends SPMachineryEvent {
  final num value;
  SPFencesBetweenApartmentsInMetersChanged(this.value);
}
