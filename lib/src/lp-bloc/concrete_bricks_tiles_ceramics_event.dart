import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class ConcreteBricksTilesCeramicsEvent {}

class ConcreteNotesChanged extends ConcreteBricksTilesCeramicsEvent {
  String? value;
  ConcreteNotesChanged(this.value);
}

class BrickNotesChanged extends ConcreteBricksTilesCeramicsEvent {
  String? value;
  BrickNotesChanged(this.value);
}

class CeramicTilesNotesChanged extends ConcreteBricksTilesCeramicsEvent {
  String? value;
  CeramicTilesNotesChanged(this.value);
}

class HazardousMixturesNotesChanged extends ConcreteBricksTilesCeramicsEvent {
  String? value;
  HazardousMixturesNotesChanged(this.value);
}

class OtherMaterialsChanged extends ConcreteBricksTilesCeramicsEvent {
  WasteLawDemolitionMaterialEstimateEntry? value;
  OtherMaterialsChanged(this.value);
}

class OtherMaterialsVolumeChanged extends ConcreteBricksTilesCeramicsEvent {
  num? value;
  OtherMaterialsVolumeChanged(this.value);
}

class OtherMaterialsTonsChanged extends ConcreteBricksTilesCeramicsEvent {
  num? value;
  OtherMaterialsTonsChanged(this.value);
}

class OtherMaterialsNotesChanged extends ConcreteBricksTilesCeramicsEvent {
  String? value;
  OtherMaterialsNotesChanged(this.value);
}
