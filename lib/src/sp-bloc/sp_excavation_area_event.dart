abstract class SBExcavationAreaEvent {}

class AreaofTheRemovableSoilChanged extends SBExcavationAreaEvent {
  final num value;
  AreaofTheRemovableSoilChanged(this.value);
}

class DepthInMetersChanged extends SBExcavationAreaEvent {
  final num value;
  DepthInMetersChanged(this.value);
}

class AsphaltAreaInSquareMetersChanged extends SBExcavationAreaEvent {
  final num value;
  AsphaltAreaInSquareMetersChanged(this.value);
}

class CleanSoilPortionPercentageChanged extends SBExcavationAreaEvent {
  final num value;
  CleanSoilPortionPercentageChanged(this.value);
}
