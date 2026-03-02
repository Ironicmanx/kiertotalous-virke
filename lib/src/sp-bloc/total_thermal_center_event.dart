import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalThermalCenterEvent {}

class ThermalCenterChanged extends TotalThermalCenterEvent {
  final ThermalCenter thermalCenter;
  ThermalCenterChanged(this.thermalCenter);
}
