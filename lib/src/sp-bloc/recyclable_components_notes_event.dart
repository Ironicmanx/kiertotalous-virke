import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class RecyclableComponentsNotesEvent {}

class WoodAndFiberboardDoorsNotesChanged
    extends RecyclableComponentsNotesEvent {
  final String? notes;
  WoodAndFiberboardDoorsNotesChanged(this.notes);
}

class AluminumDoorsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  AluminumDoorsNotesChanged(this.notes);
}

class SteelDoorsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  SteelDoorsNotesChanged(this.notes);
}

class WoodenWindowsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  WoodenWindowsNotesChanged(this.notes);
}

class SteelFrameWindowsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  SteelFrameWindowsNotesChanged(this.notes);
}

class AluminumFrameWindowsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  AluminumFrameWindowsNotesChanged(this.notes);
}

class PorcelainToiletsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  PorcelainToiletsNotesChanged(this.notes);
}

class CabinetsAndFurnitureNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  CabinetsAndFurnitureNotesChanged(this.notes);
}

class PorcelainSinksNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  PorcelainSinksNotesChanged(this.notes);
}

class StainlessSteelSinksAndTablesNotesChanged
    extends RecyclableComponentsNotesEvent {
  final String? notes;
  StainlessSteelSinksAndTablesNotesChanged(this.notes);
}

class SaunaStovesNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  SaunaStovesNotesChanged(this.notes);
}

class ElectricStovesNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  ElectricStovesNotesChanged(this.notes);
}

class RefrigeratorsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  RefrigeratorsNotesChanged(this.notes);
}

class WaterAccumulatorsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  WaterAccumulatorsNotesChanged(this.notes);
}

class ElectricMotorsNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  ElectricMotorsNotesChanged(this.notes);
}

class VentilationMachinesNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  VentilationMachinesNotesChanged(this.notes);
}

class ThermalBoilerNotesChanged extends RecyclableComponentsNotesEvent {
  final String? notes;
  ThermalBoilerNotesChanged(this.notes);
}

class DistrictHeatingExchangerNotesChanged
    extends RecyclableComponentsNotesEvent {
  final String? notes;
  DistrictHeatingExchangerNotesChanged(this.notes);
}

class RecyclableComponentsNotesUpdated extends RecyclableComponentsNotesEvent {
  final RecyclableComponentsNotes notes;
  RecyclableComponentsNotesUpdated(this.notes);
}
