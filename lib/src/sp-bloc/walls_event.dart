import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/small_properties/data_types/exports.dart';

abstract class WallsEvent {}

// Recyclable events
class TrunkWoodRecyclableChanged extends WallsEvent {
  final bool value;
  TrunkWoodRecyclableChanged(this.value);
}

class InsulationWoolRecyclableChanged extends WallsEvent {
  final bool value;
  InsulationWoolRecyclableChanged(this.value);
}

class AggregateRecyclableChanged extends WallsEvent {
  final bool value;
  AggregateRecyclableChanged(this.value);
}

// Measurement events
class LengthInMetersChanged extends WallsEvent {
  final num value;
  LengthInMetersChanged(this.value);
}

class WidthInMetersChanged extends WallsEvent {
  final num value;
  WidthInMetersChanged(this.value);
}

class HeightInMetersChanged extends WallsEvent {
  final num value;
  HeightInMetersChanged(this.value);
}

class StoneOrBrickWallsChanged extends WallsEvent {
  final num value;
  StoneOrBrickWallsChanged(this.value);
}

// Material selection events
class WoodMaterialTypeChanged extends WallsEvent {
  final WoodMaterialType? value;
  WoodMaterialTypeChanged(this.value);
}

class WallMaterialChanged extends WallsEvent {
  final WallMaterial? value;
  WallMaterialChanged(this.value);
}

class InsulationMaterialThicknessChanged extends WallsEvent {
  final InsulationMaterialThickness? value;
  InsulationMaterialThicknessChanged(this.value);
}

class OuterWallSurfaceMaterialChanged extends WallsEvent {
  final OuterWallSurfaceMaterial? value;
  OuterWallSurfaceMaterialChanged(this.value);
}
