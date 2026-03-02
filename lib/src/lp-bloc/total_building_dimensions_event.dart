import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalBuildingDimensionsEvent {}

class BuildingDimensionsChanged extends TotalBuildingDimensionsEvent {
  final BuildingDimensions buildingDimensions;
  BuildingDimensionsChanged(this.buildingDimensions);
}

class CellarChanged extends TotalBuildingDimensionsEvent {
  final Cellar cellar;
  CellarChanged(this.cellar);
}

class FoundationsChanged extends TotalBuildingDimensionsEvent {
  final Foundations foundations;
  FoundationsChanged(this.foundations);
}

class BuildingFrameChanged extends TotalBuildingDimensionsEvent {
  final BuildingFrame buildingFrame;
  BuildingFrameChanged(this.buildingFrame);
}
