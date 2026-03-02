import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalReusableAndRecyclableMaterialsEvent {}

class ExcavationAreaChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final ExcavationArea excavationArea;

  ExcavationAreaChanged(this.excavationArea);
}

class FoundationsChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final Foundations foundations;

  FoundationsChanged(this.foundations);
}

class TotalIntermediateFloorsChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  final TotalIntermediateFloors totalIntermediateFloors;

  TotalIntermediateFloorsChanged(this.totalIntermediateFloors);
}

class TotalRoofsChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final TotalRoofs totalRoofs;

  TotalRoofsChanged(this.totalRoofs);
}

class TotalBuildingFrameChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  final TotalBuildingFrame totalBuildingFrame;

  TotalBuildingFrameChanged(this.totalBuildingFrame);
}

class OuterDoorsChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final OuterDoors outerDoors;

  OuterDoorsChanged(this.outerDoors);
}

class InnerDoorsChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final InnerDoors innerDoors;

  InnerDoorsChanged(this.innerDoors);
}

class FixedFurnitureChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final FixedFurniture fixedFurniture;

  FixedFurnitureChanged(this.fixedFurniture);
}

class CellarChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final Cellar cellar;

  CellarChanged(this.cellar);
}

class FloorStructuresChanged extends TotalReusableAndRecyclableMaterialsEvent {
  final FloorStructures floorStructures;

  FloorStructuresChanged(this.floorStructures);
}

class InternalWallFramesAndSurfaceMaterialChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  final InternalWallFramesAndSurfaceMaterial
      internalWallFramesAndSurfaceMaterial;

  InternalWallFramesAndSurfaceMaterialChanged(
      this.internalWallFramesAndSurfaceMaterial);
}

class WindowsChanged extends TotalReusableAndRecyclableMaterialsEvent {
  Windows windows;

  WindowsChanged(this.windows);
}

class HvacAndElectricalInstallationsChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  HvacAndElectricalInstallations hvacAndElectricalInstallations;

  HvacAndElectricalInstallationsChanged(this.hvacAndElectricalInstallations);
}

class MachinesAndEquipmentsChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  final MachinesAndEquipments machinesAndEquipments;

  MachinesAndEquipmentsChanged(this.machinesAndEquipments);
}

class FixturesAndStructuresChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  final FixturesAndStructures fixturesAndStructures;

  FixturesAndStructuresChanged(this.fixturesAndStructures);
}

class YardAndProtectiveStructuresChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  final YardAndProtectiveStructures yardAndProtectiveStructures;

  YardAndProtectiveStructuresChanged(this.yardAndProtectiveStructures);
}

class ReusableAndRecyclableMaterialsChanged
    extends TotalReusableAndRecyclableMaterialsEvent {
  final ReusableAndRecyclableMaterials reusableAndRecyclableMaterials;

  ReusableAndRecyclableMaterialsChanged(this.reusableAndRecyclableMaterials);
}
