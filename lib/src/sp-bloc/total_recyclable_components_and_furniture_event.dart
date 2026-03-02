import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {}

class ApartmentChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final Apartment apartment;
  ApartmentChanged(this.apartment);
}

class ApartmentSizeChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final ApartmentSize apartmentSize;
  ApartmentSizeChanged(this.apartmentSize);
}

class ApartmentsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final Apartments apartments;
  ApartmentsChanged(this.apartments);
}

class CarportOrGarageChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final CarportOrGarage carportOrGarage;
  CarportOrGarageChanged(this.carportOrGarage);
}

class CounterChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final Counter counter;
  CounterChanged(this.counter);
}

class HallDoorsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final HallDoors hallDoors;
  HallDoorsChanged(this.hallDoors);
}

class HvacChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final Hvac hvac;
  HvacChanged(this.hvac);
}

class MachineryEquipmentChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final MachineryEquipmentAndFixedStructures machineryEquipment;
  MachineryEquipmentChanged(this.machineryEquipment);
}

class PassageDoorsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final PassageDoors passageDoors;
  PassageDoorsChanged(this.passageDoors);
}

class RecyclableComponentsNotesChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final RecyclableComponentsNotes notes;
  RecyclableComponentsNotesChanged(this.notes);
}

class RecyclableComponentsCostsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final RecyclableComponentsHandlingAndDismantlingCosts costs;
  RecyclableComponentsCostsChanged(this.costs);
}

class RecyclableComponentsUnitPriceChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final RecyclableComponentsUnitPrice unitPrice;
  RecyclableComponentsUnitPriceChanged(this.unitPrice);
}

class RoofChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final Roof roof;
  RoofChanged(this.roof);
}

class ExcavationAreaChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final SmallPropertiesExcavationArea excavationArea;
  ExcavationAreaChanged(this.excavationArea);
}

class FoundationChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final SmallPropertiesFoundation foundation;
  FoundationChanged(this.foundation);
}

class ReusableAndRecyclableMaterialsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final SmallPropertiesTotalReusableAndRecyclableMaterials materials;
  ReusableAndRecyclableMaterialsChanged(this.materials);
}

class EvaluationInfoChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final SmallPropertyEvaluationInfo evaluationInfo;
  EvaluationInfoChanged(this.evaluationInfo);
}

class InnerDoorsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final SmallPropertyInnerDoors innerDoors;
  InnerDoorsChanged(this.innerDoors);
}

class OuterDoorsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final SmallPropertyOuterDoors outerDoors;
  OuterDoorsChanged(this.outerDoors);
}

class WindowsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final SmallPropertyWindows windows;
  WindowsChanged(this.windows);
}

class ThermalCenterChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final ThermalCenter thermalCenter;
  ThermalCenterChanged(this.thermalCenter);
}

class WallsChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final Walls walls;
  WallsChanged(this.walls);
}

class YardRoofChanged
    extends SmallPropertiesTotalRecyclableComponentsAndFurnitureEvent {
  final YardRoof yardRoof;
  YardRoofChanged(this.yardRoof);
}
