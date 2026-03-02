import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class CellarEvent {}

// Changing material
class CellarMaterialChanged extends CellarEvent {
  final CellarExteriorMaterial? material;
  CellarMaterialChanged(this.material);
}

// Changing floor area
class CellarFloorAreaChanged extends CellarEvent {
  final num value;
  CellarFloorAreaChanged(this.value);
}

// Changing perimeter
class CellarPerimeterChanged extends CellarEvent {
  final num value;
  CellarPerimeterChanged(this.value);
}

// Changing wall height
class CellarWallHeightChanged extends CellarEvent {
  final num value;
  CellarWallHeightChanged(this.value);
}
