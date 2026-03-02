import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class QuantitiesToMaterialFormEvent {}

class QuantitiesToMaterialFormApartmentChanged
    extends QuantitiesToMaterialFormEvent {
  final Apartment? apartment;
  QuantitiesToMaterialFormApartmentChanged(this.apartment);
}

class QuantitiesToMaterialFormApartmentSizeChanged
    extends QuantitiesToMaterialFormEvent {
  final ApartmentSize? apartmentSize;
  QuantitiesToMaterialFormApartmentSizeChanged(this.apartmentSize);
}

class QuantitiesToMaterialFormApartmentsChanged
    extends QuantitiesToMaterialFormEvent {
  final Apartments? apartments;
  QuantitiesToMaterialFormApartmentsChanged(this.apartments);
}

class QuantitiesToMaterialFormHvacChanged
    extends QuantitiesToMaterialFormEvent {
  final Hvac? hvac;
  QuantitiesToMaterialFormHvacChanged(this.hvac);
}

class QuantitiesToMaterialFormExcavationAreaChanged
    extends QuantitiesToMaterialFormEvent {
  final SmallPropertiesExcavationArea? excavationArea;
  QuantitiesToMaterialFormExcavationAreaChanged(this.excavationArea);
}

class QuantitiesToMaterialFormFoundationChanged
    extends QuantitiesToMaterialFormEvent {
  final SmallPropertiesFoundation? foundation;
  QuantitiesToMaterialFormFoundationChanged(this.foundation);
}

class QuantitiesToMaterialFormInnerDoorsChanged
    extends QuantitiesToMaterialFormEvent {
  final SmallPropertyInnerDoors? innerDoors;
  QuantitiesToMaterialFormInnerDoorsChanged(this.innerDoors);
}

class QuantitiesToMaterialFormMachineryEquipmentChanged
    extends QuantitiesToMaterialFormEvent {
  final MachineryEquipmentAndFixedStructures? machineryEquipment;
  QuantitiesToMaterialFormMachineryEquipmentChanged(this.machineryEquipment);
}

class QuantitiesToMaterialFormOuterDoorsChanged
    extends QuantitiesToMaterialFormEvent {
  final SmallPropertyOuterDoors? outerDoors;
  QuantitiesToMaterialFormOuterDoorsChanged(this.outerDoors);
}

class QuantitiesToMaterialFormRoofChanged
    extends QuantitiesToMaterialFormEvent {
  final Roof? roof;
  QuantitiesToMaterialFormRoofChanged(this.roof);
}

class QuantitiesToMaterialFormEvaluationInfoChanged
    extends QuantitiesToMaterialFormEvent {
  final SmallPropertyEvaluationInfo? evaluationInfo;
  QuantitiesToMaterialFormEvaluationInfoChanged(this.evaluationInfo);
}

class QuantitiesToMaterialFormWallsChanged
    extends QuantitiesToMaterialFormEvent {
  final Walls? walls;
  QuantitiesToMaterialFormWallsChanged(this.walls);
}

class QuantitiesToMaterialFormWindowsChanged
    extends QuantitiesToMaterialFormEvent {
  final SmallPropertyWindows? windows;
  QuantitiesToMaterialFormWindowsChanged(this.windows);
}

class QuantitiesToMaterialFormCarportOrGarageChanged
    extends QuantitiesToMaterialFormEvent {
  final CarportOrGarage? carportOrGarage;
  QuantitiesToMaterialFormCarportOrGarageChanged(this.carportOrGarage);
}

class QuantitiesToMaterialFormHallDoorsChanged
    extends QuantitiesToMaterialFormEvent {
  final HallDoors? hallDoors;
  QuantitiesToMaterialFormHallDoorsChanged(this.hallDoors);
}

class QuantitiesToMaterialFormPassageDoorsChanged
    extends QuantitiesToMaterialFormEvent {
  final PassageDoors? passageDoors;
  QuantitiesToMaterialFormPassageDoorsChanged(this.passageDoors);
}

class QuantitiesToMaterialFormYardRoofChanged
    extends QuantitiesToMaterialFormEvent {
  final YardRoof? yardRoof;
  QuantitiesToMaterialFormYardRoofChanged(this.yardRoof);
}

class QuantitiesToMaterialFormThermalCenterChanged
    extends QuantitiesToMaterialFormEvent {
  final ThermalCenter? thermalCenter;
  QuantitiesToMaterialFormThermalCenterChanged(this.thermalCenter);
}
