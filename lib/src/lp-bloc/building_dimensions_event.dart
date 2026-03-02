abstract class BuildingDimensionsEvent {}

class GrossFloorAreaChanged extends BuildingDimensionsEvent {
  final num? value;
  GrossFloorAreaChanged(this.value);
}

class VolumeChanged extends BuildingDimensionsEvent {
  final num? value;
  VolumeChanged(this.value);
}

class FloorCountExcludingCellarsChanged extends BuildingDimensionsEvent {
  final int? value;
  FloorCountExcludingCellarsChanged(this.value);
}

class AverageAreaChanged extends BuildingDimensionsEvent {
  final num? value;
  AverageAreaChanged(this.value);
}
