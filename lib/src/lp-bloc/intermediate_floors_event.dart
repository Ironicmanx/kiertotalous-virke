import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class IntermediateFloorsEvent {}

class WoodFramePercentageChanged extends IntermediateFloorsEvent {
  final num value;
  WoodFramePercentageChanged(this.value);
}

class ConcreteCastingPercentageChanged extends IntermediateFloorsEvent {
  final num value;
  ConcreteCastingPercentageChanged(this.value);
}

class HollowCoreSlabPercentageChanged extends IntermediateFloorsEvent {
  final num value;
  HollowCoreSlabPercentageChanged(this.value);
}

class GlulamBeamPercentageChanged extends IntermediateFloorsEvent {
  final num value;
  GlulamBeamPercentageChanged(this.value);
}

class TotalBuildingDimensionsChanged extends IntermediateFloorsEvent {
  final TotalBuildingDimensions value;
  TotalBuildingDimensionsChanged(this.value);
}

class FoundationsChanged extends IntermediateFloorsEvent {
  final Foundations value;
  FoundationsChanged(this.value);
}

class HollowCoreSlabsAndGlulamBeamRecyclableChanged
    extends IntermediateFloorsEvent {
  final bool value;
  HollowCoreSlabsAndGlulamBeamRecyclableChanged(this.value);
}
