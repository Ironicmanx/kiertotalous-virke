import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class CarportOrGarageEvent {}

class BuildingLengthInMetersChanged extends CarportOrGarageEvent {
  num value;
  BuildingLengthInMetersChanged(this.value);
}

class BuildingWidthInMetersChanged extends CarportOrGarageEvent {
  num value;
  BuildingWidthInMetersChanged(this.value);
}

class FoundationTypeChanged extends CarportOrGarageEvent {
  FoundationType? value;
  FoundationTypeChanged(this.value);
}

class BuildingFoundationAndWallsContainAsbestosOrPcbPaintsChanged
    extends CarportOrGarageEvent {
  bool value;
  BuildingFoundationAndWallsContainAsbestosOrPcbPaintsChanged(this.value);
}

class CoveringMaterialContainsAsbestosChanged extends CarportOrGarageEvent {
  bool value;
  CoveringMaterialContainsAsbestosChanged(this.value);
}

class GarageWallMaterialChanged extends CarportOrGarageEvent {
  GarageWallMaterial? value;
  GarageWallMaterialChanged(this.value);
}

class InsulationMaterialThicknessChanged extends CarportOrGarageEvent {
  InsulationMaterialThickness? value;
  InsulationMaterialThicknessChanged(this.value);
}

class WallAverageHeightChanged extends CarportOrGarageEvent {
  num value;
  WallAverageHeightChanged(this.value);
}

class BuildingWallLengthTotalChanged extends CarportOrGarageEvent {
  num value;
  BuildingWallLengthTotalChanged(this.value);
}
