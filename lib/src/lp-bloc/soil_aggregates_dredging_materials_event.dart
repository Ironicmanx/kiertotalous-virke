import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SoilAggregatesDredgingMaterialsEvent {}

class HazardousSoilAndRockNotesChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final String? value;
  HazardousSoilAndRockNotesChanged(this.value);
}

class SoilAndRockChanged extends SoilAggregatesDredgingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  SoilAndRockChanged(this.value);
}

class HazardousDredgingSpoilChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  HazardousDredgingSpoilChanged(this.value);
}

class DredgingSpoilChanged extends SoilAggregatesDredgingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  DredgingSpoilChanged(this.value);
}

class HazardousRailwayBallastChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  HazardousRailwayBallastChanged(this.value);
}

class RailwayBallastChanged extends SoilAggregatesDredgingMaterialsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  RailwayBallastChanged(this.value);
}

class SoilAndRockVolumeChanged extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  SoilAndRockVolumeChanged(this.value);
}

class SoilAndRockTonsChanged extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  SoilAndRockTonsChanged(this.value);
}

class SoilAndRockNotesChanged extends SoilAggregatesDredgingMaterialsEvent {
  final String? value;
  SoilAndRockNotesChanged(this.value);
}

class HazardousDredgingSpoilVolumeChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  HazardousDredgingSpoilVolumeChanged(this.value);
}

class HazardousDredgingSpoilTonsChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  HazardousDredgingSpoilTonsChanged(this.value);
}

class HazardousDredgingSpoilNotesChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final String? value;
  HazardousDredgingSpoilNotesChanged(this.value);
}

class DredgingSpoilVolumeChanged extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  DredgingSpoilVolumeChanged(this.value);
}

class DredgingSpoilTonsChanged extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  DredgingSpoilTonsChanged(this.value);
}

class DredgingSpoilNotesChanged extends SoilAggregatesDredgingMaterialsEvent {
  final String? value;
  DredgingSpoilNotesChanged(this.value);
}

class HazardousRailwayBallastVolumeChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  HazardousRailwayBallastVolumeChanged(this.value);
}

class HazardousRailwayBallastTonsChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  HazardousRailwayBallastTonsChanged(this.value);
}

class HazardousRailwayBallastNotesChanged
    extends SoilAggregatesDredgingMaterialsEvent {
  final String? value;
  HazardousRailwayBallastNotesChanged(this.value);
}

class RailwayBallastVolumeChanged extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  RailwayBallastVolumeChanged(this.value);
}

class RailwayBallastTonsChanged extends SoilAggregatesDredgingMaterialsEvent {
  final num? value;
  RailwayBallastTonsChanged(this.value);
}

class RailwayBallastNotesChanged extends SoilAggregatesDredgingMaterialsEvent {
  final String? value;
  RailwayBallastNotesChanged(this.value);
}
