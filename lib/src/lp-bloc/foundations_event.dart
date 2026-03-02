import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class FoundationsEvent {}

class BituminousWaterProofingChanged extends FoundationsEvent {
  final bool value;
  BituminousWaterProofingChanged(this.value);
}

// materials
class FalsePlinthMaterialChanged extends FoundationsEvent {
  final FoundationMaterial? material;
  FalsePlinthMaterialChanged(this.material);
}

class CrawlSpaceMaterialChanged extends FoundationsEvent {
  final FoundationMaterial? material;
  CrawlSpaceMaterialChanged(this.material);
}

class PillarMaterialChanged extends FoundationsEvent {
  final FoundationMaterial? material;
  PillarMaterialChanged(this.material);
}

class HollowCoreSlabMaterialChanged extends FoundationsEvent {
  final FoundationMaterial? material;
  HollowCoreSlabMaterialChanged(this.material);
}

// areas
class FalsePlinthAreaChanged extends FoundationsEvent {
  final num value;
  FalsePlinthAreaChanged(this.value);
}

class CrawlSpaceAreaChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceAreaChanged(this.value);
}

class ShallowAreaChanged extends FoundationsEvent {
  final num value;
  ShallowAreaChanged(this.value);
}

class PillarAreaChanged extends FoundationsEvent {
  final num value;
  PillarAreaChanged(this.value);
}

class HollowCoreSlabAreaChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabAreaChanged(this.value);
}

// circumferences
class FalsePlinthCircumferenceChanged extends FoundationsEvent {
  final num value;
  FalsePlinthCircumferenceChanged(this.value);
}

class CrawlSpaceCircumferenceChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceCircumferenceChanged(this.value);
}

class ShallowCircumferenceChanged extends FoundationsEvent {
  final num value;
  ShallowCircumferenceChanged(this.value);
}

class PillarCircumferenceChanged extends FoundationsEvent {
  final num value;
  PillarCircumferenceChanged(this.value);
}

class HollowCoreSlabCircumferenceChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabCircumferenceChanged(this.value);
}
