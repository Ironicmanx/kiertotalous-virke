import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class GypsumBasedBuildingMaterialsEvent {}

class ContaminatedGypsumBasedMaterialsChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  ContaminatedGypsumBasedMaterialsChanged(this.value);
}

class OtherGypsumBasedMaterialsChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  OtherGypsumBasedMaterialsChanged(this.value);
}

class ContaminatedGypsumBasedMaterialsVolumeChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final num? value;
  ContaminatedGypsumBasedMaterialsVolumeChanged(this.value);
}

class ContaminatedGypsumBasedMaterialsTonsChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final num? value;
  ContaminatedGypsumBasedMaterialsTonsChanged(this.value);
}

class ContaminatedGypsumBasedMaterialsNotesChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final String? value;
  ContaminatedGypsumBasedMaterialsNotesChanged(this.value);
}

class OtherGypsumBasedMaterialsVolumeChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final num? value;
  OtherGypsumBasedMaterialsVolumeChanged(this.value);
}

class OtherGypsumBasedMaterialsTonsChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final num? value;
  OtherGypsumBasedMaterialsTonsChanged(this.value);
}

class OtherGypsumBasedMaterialsNotesChanged
    extends GypsumBasedBuildingMaterialsEvent {
  final String? value;
  OtherGypsumBasedMaterialsNotesChanged(this.value);
}
