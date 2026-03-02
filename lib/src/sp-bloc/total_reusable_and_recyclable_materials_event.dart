import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {}

class SmallPropertiesExcavationAreaChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertiesExcavationArea excavationArea;
  SmallPropertiesExcavationAreaChanged(this.excavationArea);
}

class SmallPropertiesFoundationChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertiesFoundation foundation;
  SmallPropertiesFoundationChanged(this.foundation);
}

class SmallPropertyInnerDoorsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertyInnerDoors innerDoors;
  SmallPropertyInnerDoorsChanged(this.innerDoors);
}

class SmallPropertyOuterDoorsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertyOuterDoors outerDoors;
  SmallPropertyOuterDoorsChanged(this.outerDoors);
}

class SmallPropertyWindowsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertyWindows windows;
  SmallPropertyWindowsChanged(this.windows);
}

class SmallPropertiesReusableAndRecyclableMaterialsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertiesReusableAndRecyclableMaterials
      reusableAndRecyclableMaterials;
  SmallPropertiesReusableAndRecyclableMaterialsChanged(
      this.reusableAndRecyclableMaterials);
}

class ApartmentChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final Apartment apartment;
  ApartmentChanged(this.apartment);
}

class ApartmentSizeChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final ApartmentSize apartmentSize;
  ApartmentSizeChanged(this.apartmentSize);
}

class ApartmentsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final Apartments apartments;
  ApartmentsChanged(this.apartments);
}

class CarportOrGarageChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final CarportOrGarage carportOrGarage;
  CarportOrGarageChanged(this.carportOrGarage);
}

class CounterChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final Counter counter;
  CounterChanged(this.counter);
}

class HallDoorsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final HallDoors hallDoors;
  HallDoorsChanged(this.hallDoors);
}

class HvacChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final Hvac hvac;
  HvacChanged(this.hvac);
}

class MachineryEquipmentAndFixedStructuresChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final MachineryEquipmentAndFixedStructures
      machineryEquipmentAndFixedStructures;
  MachineryEquipmentAndFixedStructuresChanged(
      this.machineryEquipmentAndFixedStructures);
}

class PassageDoorsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final PassageDoors passageDoors;
  PassageDoorsChanged(this.passageDoors);
}

class RecyclableMaterialsNotesChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final RecyclableMaterialsNotes recyclableMaterialsNotes;
  RecyclableMaterialsNotesChanged(this.recyclableMaterialsNotes);
}

class RecyclableMaterialsMaterialValueChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final RecyclableMaterialsMaterialValue materialValue;
  RecyclableMaterialsMaterialValueChanged(this.materialValue);
}

class RecyclableMaterialsHandlingAndDismantlingCostsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final RecyclableMaterialsHandlingAndDismantlingCosts
      handlingAndDismantlingCosts;
  RecyclableMaterialsHandlingAndDismantlingCostsChanged(
      this.handlingAndDismantlingCosts);
}

class RoofChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final Roof roof;
  RoofChanged(this.roof);
}

class SmallPropertyEvaluationInfoChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final SmallPropertyEvaluationInfo smallPropertyEvaluationInfo;
  SmallPropertyEvaluationInfoChanged(this.smallPropertyEvaluationInfo);
}

class ThermalCenterChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final ThermalCenter thermalCenter;
  ThermalCenterChanged(this.thermalCenter);
}

class WallsChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final Walls walls;
  WallsChanged(this.walls);
}

class YardRoofChanged
    extends SmallPropertiesTotalReusableAndRecyclableMaterialsEvent {
  final YardRoof yardRoof;
  YardRoofChanged(this.yardRoof);
}
