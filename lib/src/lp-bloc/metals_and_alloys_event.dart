import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class MetalsAndAlloysEvent {}

class CopperBronzeAndBrassNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  CopperBronzeAndBrassNotesChanged(this.value);
}

class AluminiumNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  AluminiumNotesChanged(this.value);
}

class IronAndSteelNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  IronAndSteelNotesChanged(this.value);
}

class MixedMetalsNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  MixedMetalsNotesChanged(this.value);
}

class LeadChanged extends MetalsAndAlloysEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  LeadChanged(this.value);
}

class ZincChanged extends MetalsAndAlloysEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  ZincChanged(this.value);
}

class TinChanged extends MetalsAndAlloysEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  TinChanged(this.value);
}

class ContaminatedMetalWasteChanged extends MetalsAndAlloysEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  ContaminatedMetalWasteChanged(this.value);
}

class HazardousOilAndTarCablesChanged extends MetalsAndAlloysEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  HazardousOilAndTarCablesChanged(this.value);
}

class OtherCablesChanged extends MetalsAndAlloysEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  OtherCablesChanged(this.value);
}

class LeadVolumeChanged extends MetalsAndAlloysEvent {
  final num? value;
  LeadVolumeChanged(this.value);
}

class LeadTonsChanged extends MetalsAndAlloysEvent {
  final num? value;
  LeadTonsChanged(this.value);
}

class LeadNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  LeadNotesChanged(this.value);
}

class ZincVolumeChanged extends MetalsAndAlloysEvent {
  final num? value;
  ZincVolumeChanged(this.value);
}

class ZincTonsChanged extends MetalsAndAlloysEvent {
  final num? value;
  ZincTonsChanged(this.value);
}

class ZincNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  ZincNotesChanged(this.value);
}

class TinVolumeChanged extends MetalsAndAlloysEvent {
  final num? value;
  TinVolumeChanged(this.value);
}

class TinTonsChanged extends MetalsAndAlloysEvent {
  final num? value;
  TinTonsChanged(this.value);
}

class TinNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  TinNotesChanged(this.value);
}

class ContaminatedMetalWasteVolumeChanged extends MetalsAndAlloysEvent {
  final num? value;
  ContaminatedMetalWasteVolumeChanged(this.value);
}

class ContaminatedMetalWasteTonsChanged extends MetalsAndAlloysEvent {
  final num? value;
  ContaminatedMetalWasteTonsChanged(this.value);
}

class ContaminatedMetalWasteNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  ContaminatedMetalWasteNotesChanged(this.value);
}

class HazardousOilAndTarCablesVolumeChanged extends MetalsAndAlloysEvent {
  final num? value;
  HazardousOilAndTarCablesVolumeChanged(this.value);
}

class HazardousOilAndTarCablesTonsChanged extends MetalsAndAlloysEvent {
  final num? value;
  HazardousOilAndTarCablesTonsChanged(this.value);
}

class HazardousOilAndTarCablesNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  HazardousOilAndTarCablesNotesChanged(this.value);
}

class OtherCablesVolumeChanged extends MetalsAndAlloysEvent {
  final num? value;
  OtherCablesVolumeChanged(this.value);
}

class OtherCablesTonsChanged extends MetalsAndAlloysEvent {
  final num? value;
  OtherCablesTonsChanged(this.value);
}

class OtherCablesNotesChanged extends MetalsAndAlloysEvent {
  final String? value;
  OtherCablesNotesChanged(this.value);
}
