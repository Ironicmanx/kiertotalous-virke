import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class OtherMaterialsEvent {}

class MercuryContainingMaterialsChanged extends OtherMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  MercuryContainingMaterialsChanged(this.value);
}

class PCBContainingDemolitionWasteNotesChanged extends OtherMaterialsEvent {
  final String? value;
  PCBContainingDemolitionWasteNotesChanged(this.value);
}

class OtherHazardousDemolitionWasteChanged extends OtherMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  OtherHazardousDemolitionWasteChanged(this.value);
}

class OtherDemolitionWasteChanged extends OtherMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  OtherDemolitionWasteChanged(this.value);
}

class MercuryContainingMaterialsVolumeChanged extends OtherMaterialsEvent {
  final num? value;
  MercuryContainingMaterialsVolumeChanged(this.value);
}

class MercuryContainingMaterialsTonsChanged extends OtherMaterialsEvent {
  final num? value;
  MercuryContainingMaterialsTonsChanged(this.value);
}

class MercuryContainingMaterialsNotesChanged extends OtherMaterialsEvent {
  final String? value;
  MercuryContainingMaterialsNotesChanged(this.value);
}

class OtherHazardousDemolitionWasteVolumeChanged extends OtherMaterialsEvent {
  final num? value;
  OtherHazardousDemolitionWasteVolumeChanged(this.value);
}

class OtherHazardousDemolitionWasteTonsChanged extends OtherMaterialsEvent {
  final num? value;
  OtherHazardousDemolitionWasteTonsChanged(this.value);
}

class OtherHazardousDemolitionWasteNotesChanged extends OtherMaterialsEvent {
  final String? value;
  OtherHazardousDemolitionWasteNotesChanged(this.value);
}

class OtherDemolitionWasteVolumeChanged extends OtherMaterialsEvent {
  final num? value;
  OtherDemolitionWasteVolumeChanged(this.value);
}

class OtherDemolitionWasteTonsChanged extends OtherMaterialsEvent {
  final num? value;
  OtherDemolitionWasteTonsChanged(this.value);
}

class OtherDemolitionWasteNotesChanged extends OtherMaterialsEvent {
  final String? value;
  OtherDemolitionWasteNotesChanged(this.value);
}
