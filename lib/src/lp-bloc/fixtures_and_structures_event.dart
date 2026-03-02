abstract class FixturesAndStructuresEvent {}

// Rain Gutters and Downspouts Meters & Weight
class RainGuttersMetersChanged extends FixturesAndStructuresEvent {
  final num value;
  RainGuttersMetersChanged(this.value);
}

class RainGuttersWeightChanged extends FixturesAndStructuresEvent {
  final num value;
  RainGuttersWeightChanged(this.value);
}

// Fire Ladders and Walkways Meters & Weight
class FireLaddersMetersChanged extends FixturesAndStructuresEvent {
  final num value;
  FireLaddersMetersChanged(this.value);
}

class FireLaddersWeightChanged extends FixturesAndStructuresEvent {
  final num value;
  FireLaddersWeightChanged(this.value);
}

// Aluminium Chain Link Fences Meters & Weight
class AluminiumChainLinkFencesMetersChanged extends FixturesAndStructuresEvent {
  final num value;
  AluminiumChainLinkFencesMetersChanged(this.value);
}

class AluminiumChainLinkFencesWeightChanged extends FixturesAndStructuresEvent {
  final num value;
  AluminiumChainLinkFencesWeightChanged(this.value);
}

// Steel Chain Link Fences Meters & Weight
class SteelChainLinkFencesMetersChanged extends FixturesAndStructuresEvent {
  final num value;
  SteelChainLinkFencesMetersChanged(this.value);
}

class SteelChainLinkFencesWeightChanged extends FixturesAndStructuresEvent {
  final num value;
  SteelChainLinkFencesWeightChanged(this.value);
}

// Fixtures Recyclability Change
class FixturesRecyclableChanged extends FixturesAndStructuresEvent {
  final bool value;
  FixturesRecyclableChanged(this.value);
}
