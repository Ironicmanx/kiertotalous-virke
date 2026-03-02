import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class InsulationAndAsbestosContainingMaterialsEvent {}

class AsbestosContainingInsulationMaterialsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  AsbestosContainingInsulationMaterialsChanged(this.value);
}

class OtherHazardousInsulationMaterialsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  OtherHazardousInsulationMaterialsChanged(this.value);
}

class OtherInsulationMaterialsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  OtherInsulationMaterialsChanged(this.value);
}

class AsbestosContainingBuildingMaterialsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  AsbestosContainingBuildingMaterialsChanged(this.value);
}

class AsbestosContainingInsulationMaterialsVolumeChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  AsbestosContainingInsulationMaterialsVolumeChanged(this.value);
}

class OtherHazardousInsulationMaterialsVolumeChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  OtherHazardousInsulationMaterialsVolumeChanged(this.value);
}

class OtherInsulationMaterialsVolumeChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  OtherInsulationMaterialsVolumeChanged(this.value);
}

class AsbestosContainingBuildingMaterialsVolumeChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  AsbestosContainingBuildingMaterialsVolumeChanged(this.value);
}

class AsbestosContainingInsulationMaterialsTonsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  AsbestosContainingInsulationMaterialsTonsChanged(this.value);
}

class OtherHazardousInsulationMaterialsTonsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  OtherHazardousInsulationMaterialsTonsChanged(this.value);
}

class OtherInsulationMaterialsTonsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  OtherInsulationMaterialsTonsChanged(this.value);
}

class AsbestosContainingBuildingMaterialsTonsChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final num? value;
  AsbestosContainingBuildingMaterialsTonsChanged(this.value);
}

class AsbestosContainingInsulationMaterialsNotesChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final String? value;
  AsbestosContainingInsulationMaterialsNotesChanged(this.value);
}

class OtherHazardousInsulationMaterialsNotesChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final String? value;
  OtherHazardousInsulationMaterialsNotesChanged(this.value);
}

class OtherInsulationMaterialsNotesChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final String? value;
  OtherInsulationMaterialsNotesChanged(this.value);
}

class AsbestosContainingBuildingMaterialsNotesChanged
    extends InsulationAndAsbestosContainingMaterialsEvent {
  final String? value;
  AsbestosContainingBuildingMaterialsNotesChanged(this.value);
}
