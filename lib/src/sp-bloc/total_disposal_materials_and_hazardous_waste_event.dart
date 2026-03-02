import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {}

class ApartmentChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final Apartment? apartment;
  ApartmentChanged(this.apartment);
}

class ApartmentSizeChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final ApartmentSize? apartmentSize;
  ApartmentSizeChanged(this.apartmentSize);
}

class ApartmentsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final Apartments? apartments;
  ApartmentsChanged(this.apartments);
}

class CarportOrGarageChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final CarportOrGarage? carportOrGarage;
  CarportOrGarageChanged(this.carportOrGarage);
}

class CounterChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final Counter? counter;
  CounterChanged(this.counter);
}

class DisposableAndHazardousNotesChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final DisposableAndHazardousNotes? disposableAndHazardousNotes;
  DisposableAndHazardousNotesChanged(this.disposableAndHazardousNotes);
}

class DisposableAndHazardousCostsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final DisposableAndHazardousDemolitionOrProcessingCosts? costs;
  DisposableAndHazardousCostsChanged(this.costs);
}

class HallDoorsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final HallDoors? hallDoors;
  HallDoorsChanged(this.hallDoors);
}

class HvacChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final Hvac? hvac;
  HvacChanged(this.hvac);
}

class MachineryEquipmentChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final MachineryEquipmentAndFixedStructures?
      machineryEquipmentAndFixedStructures;
  MachineryEquipmentChanged(this.machineryEquipmentAndFixedStructures);
}

class PassageDoorsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final PassageDoors? passageDoors;
  PassageDoorsChanged(this.passageDoors);
}

class RoofChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final Roof? roof;
  RoofChanged(this.roof);
}

class ExcavationAreaChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final SmallPropertiesExcavationArea? smallPropertiesExcavationArea;
  ExcavationAreaChanged(this.smallPropertiesExcavationArea);
}

class FoundationChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final SmallPropertiesFoundation? foundation;
  FoundationChanged(this.foundation);
}

class EvaluationInfoChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo;
  EvaluationInfoChanged(this.smallPropertyEvaluationInfo);
}

class InnerDoorsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final SmallPropertyInnerDoors? innerDoors;
  InnerDoorsChanged(this.innerDoors);
}

class OuterDoorsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final SmallPropertyOuterDoors? outerDoors;
  OuterDoorsChanged(this.outerDoors);
}

class WindowsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final SmallPropertyWindows? windows;
  WindowsChanged(this.windows);
}

class ThermalCenterChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final ThermalCenter? thermalCenter;
  ThermalCenterChanged(this.thermalCenter);
}

class WallsChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final Walls? walls;
  WallsChanged(this.walls);
}

class YardRoofChanged
    extends SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent {
  final YardRoof? yardRoof;
  YardRoofChanged(this.yardRoof);
}
