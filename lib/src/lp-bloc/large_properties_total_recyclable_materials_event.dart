import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalRecyclableComponentsAndFurnitureEvent {}

class TotalIntermediateFloorsChanged
    extends TotalRecyclableComponentsAndFurnitureEvent {
  final TotalIntermediateFloors totalIntermediateFloors;

  TotalIntermediateFloorsChanged(this.totalIntermediateFloors);
}

class TotalRoofsChanged extends TotalRecyclableComponentsAndFurnitureEvent {
  final TotalRoofs totalRoofs;

  TotalRoofsChanged(this.totalRoofs);
}

class TotalBuildingFrameChanged
    extends TotalRecyclableComponentsAndFurnitureEvent {
  final TotalBuildingFrame totalBuildingFrame;

  TotalBuildingFrameChanged(this.totalBuildingFrame);
}

class FixturesAndStructuresChanged
    extends TotalRecyclableComponentsAndFurnitureEvent {
  final FixturesAndStructures fixturesAndStructures;

  FixturesAndStructuresChanged(this.fixturesAndStructures);
}

class FixedFurnitureChanged extends TotalRecyclableComponentsAndFurnitureEvent {
  final FixedFurniture fixedFurniture;

  FixedFurnitureChanged(this.fixedFurniture);
}

class OuterDoorsChanged extends TotalRecyclableComponentsAndFurnitureEvent {
  final OuterDoors outerDoors;

  OuterDoorsChanged(this.outerDoors);
}

class InnerDoorsChanged extends TotalRecyclableComponentsAndFurnitureEvent {
  final InnerDoors innerDoors;

  InnerDoorsChanged(this.innerDoors);
}

class WindowsChanged extends TotalRecyclableComponentsAndFurnitureEvent {
  final Windows windows;

  WindowsChanged(this.windows);
}

class MachinesAndEquipmentsChanged
    extends TotalRecyclableComponentsAndFurnitureEvent {
  final MachinesAndEquipments machinesAndEquipments;

  MachinesAndEquipmentsChanged(this.machinesAndEquipments);
}

class RecyclableComponentsAndFurnitureChanged
    extends TotalRecyclableComponentsAndFurnitureEvent {
  final RecyclableComponentsAndFurniture recyclableMaterials;

  RecyclableComponentsAndFurnitureChanged(this.recyclableMaterials);
}
