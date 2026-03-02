abstract class ExcavationAreaEvent {}

class AreaToRemoveSizeChanged extends ExcavationAreaEvent {
  final num amount;
  AreaToRemoveSizeChanged(this.amount);
}

class AreaToRemoveDepthChanged extends ExcavationAreaEvent {
  final num amount;
  AreaToRemoveDepthChanged(this.amount);
}

class CleanSoilPortionPercentageChanged extends ExcavationAreaEvent {
  final num amount;
  CleanSoilPortionPercentageChanged(this.amount);
}

class AsphaltAreaChanged extends ExcavationAreaEvent {
  final num amount;
  AsphaltAreaChanged(this.amount);
}
