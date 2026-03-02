import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class RecyclableComponentsHandlingAndDismantlingCostsEvent {}

class WoodAndFiberboardDoorsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  WoodAndFiberboardDoorsCostsChanged(this.costs);
}

class AluminumDoorsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  AluminumDoorsCostsChanged(this.costs);
}

class SteelDoorsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  SteelDoorsCostsChanged(this.costs);
}

class WoodenWindowsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  WoodenWindowsCostsChanged(this.costs);
}

class SteelFrameWindowsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  SteelFrameWindowsCostsChanged(this.costs);
}

class AluminumFrameWindowsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  AluminumFrameWindowsCostsChanged(this.costs);
}

class PorcelainToiletsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  PorcelainToiletsCostsChanged(this.costs);
}

class CabinetsAndFurnitureCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  CabinetsAndFurnitureCostsChanged(this.costs);
}

class PorcelainSinksCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  PorcelainSinksCostsChanged(this.costs);
}

class StainlessSteelSinksAndTablesCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  StainlessSteelSinksAndTablesCostsChanged(this.costs);
}

class SaunaStovesCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  SaunaStovesCostsChanged(this.costs);
}

class ElectricStovesCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  ElectricStovesCostsChanged(this.costs);
}

class RefrigeratorsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  RefrigeratorsCostsChanged(this.costs);
}

class WaterAccumulatorsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  WaterAccumulatorsCostsChanged(this.costs);
}

class ElectricMotorsCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  ElectricMotorsCostsChanged(this.costs);
}

class VentilationMachinesCostsChanged
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final num? costs;
  VentilationMachinesCostsChanged(this.costs);
}

class RecyclableComponentsHandlingCostsUpdated
    extends RecyclableComponentsHandlingAndDismantlingCostsEvent {
  final RecyclableComponentsHandlingAndDismantlingCosts costs;
  RecyclableComponentsHandlingCostsUpdated(this.costs);
}
