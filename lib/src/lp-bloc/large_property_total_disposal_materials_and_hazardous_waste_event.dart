import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalDisposalMaterialsAndHazardousWasteEvent {}

class DisposalMaterialsAndHazardousWasteChanged
    extends TotalDisposalMaterialsAndHazardousWasteEvent {
  final DisposalMaterialsAndHazardousWaste disposalMaterialsAndHazardousWaste;

  DisposalMaterialsAndHazardousWasteChanged(
      this.disposalMaterialsAndHazardousWaste);
}

class ExcavationAreaChanged
    extends TotalDisposalMaterialsAndHazardousWasteEvent {
  final ExcavationArea excavationArea;

  ExcavationAreaChanged(this.excavationArea);
}

class CellarChanged extends TotalDisposalMaterialsAndHazardousWasteEvent {
  final Cellar cellar;

  CellarChanged(this.cellar);
}

class FixedFurnitureChanged
    extends TotalDisposalMaterialsAndHazardousWasteEvent {
  final FixedFurniture fixedFurniture;

  FixedFurnitureChanged(this.fixedFurniture);
}

class FloorStructuresChanged
    extends TotalDisposalMaterialsAndHazardousWasteEvent {
  final FloorStructures floorStructures;

  FloorStructuresChanged(this.floorStructures);
}

class FoundationsChanged extends TotalDisposalMaterialsAndHazardousWasteEvent {
  final Foundations foundations;

  FoundationsChanged(this.foundations);
}

class InternalWallFramesAndSurfaceMaterialChanged
    extends TotalDisposalMaterialsAndHazardousWasteEvent {
  final InternalWallFramesAndSurfaceMaterial
      internalWallFramesAndSurfaceMaterial;

  InternalWallFramesAndSurfaceMaterialChanged(
      this.internalWallFramesAndSurfaceMaterial);
}
