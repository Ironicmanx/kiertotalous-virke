import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalBuildingFrameEvent {}

class FoundationsChanged extends TotalBuildingFrameEvent {
  final Foundations foundations;
  FoundationsChanged(this.foundations);
}

class BuildingFrameChanged extends TotalBuildingFrameEvent {
  final BuildingFrame buildingFrame;
  BuildingFrameChanged(this.buildingFrame);
}
