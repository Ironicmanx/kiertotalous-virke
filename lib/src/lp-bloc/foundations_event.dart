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

// FalsePlinth sizing
class FalsePlinthPileSpacingChanged extends FoundationsEvent {
  final num value;
  FalsePlinthPileSpacingChanged(this.value);
}

class FalsePlinthBlockHeightChanged extends FoundationsEvent {
  final num value;
  FalsePlinthBlockHeightChanged(this.value);
}

class FalsePlinthFrostStyrofoamChanged extends FoundationsEvent {
  final num value;
  FalsePlinthFrostStyrofoamChanged(this.value);
}

class FalsePlinthFinnFoamChanged extends FoundationsEvent {
  final num value;
  FalsePlinthFinnFoamChanged(this.value);
}

class FalsePlinthSlabThicknessChanged extends FoundationsEvent {
  final num value;
  FalsePlinthSlabThicknessChanged(this.value);
}

class FalsePlinthMineralWoolChanged extends FoundationsEvent {
  final num value;
  FalsePlinthMineralWoolChanged(this.value);
}

class FalsePlinthStyrofoamChanged extends FoundationsEvent {
  final num value;
  FalsePlinthStyrofoamChanged(this.value);
}

class FalsePlinthConcreteCastingChanged extends FoundationsEvent {
  final num value;
  FalsePlinthConcreteCastingChanged(this.value);
}

// CrawlSpace sizing
class CrawlSpacePileSpacingChanged extends FoundationsEvent {
  final num value;
  CrawlSpacePileSpacingChanged(this.value);
}

class CrawlSpaceCastFoundationWidthChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceCastFoundationWidthChanged(this.value);
}

class CrawlSpaceCastFoundationHeightChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceCastFoundationHeightChanged(this.value);
}

class CrawlSpaceBlockHeightChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceBlockHeightChanged(this.value);
}

class CrawlSpaceWoodShavingsChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceWoodShavingsChanged(this.value);
}

class CrawlSpaceWoodFrameWeightChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceWoodFrameWeightChanged(this.value);
}

class CrawlSpaceSolidBoardingChanged extends FoundationsEvent {
  final num value;
  CrawlSpaceSolidBoardingChanged(this.value);
}

// Shallow sizing
class ShallowFrostStyrofoamChanged extends FoundationsEvent {
  final num value;
  ShallowFrostStyrofoamChanged(this.value);
}

class ShallowFinnFoamChanged extends FoundationsEvent {
  final num value;
  ShallowFinnFoamChanged(this.value);
}

class ShallowSlabThicknessChanged extends FoundationsEvent {
  final num value;
  ShallowSlabThicknessChanged(this.value);
}

class ShallowMineralWoolChanged extends FoundationsEvent {
  final num value;
  ShallowMineralWoolChanged(this.value);
}

class ShallowStyrofoamChanged extends FoundationsEvent {
  final num value;
  ShallowStyrofoamChanged(this.value);
}

class ShallowConcreteCastingChanged extends FoundationsEvent {
  final num value;
  ShallowConcreteCastingChanged(this.value);
}

// Pillar sizing
class PillarPileSpacingChanged extends FoundationsEvent {
  final num value;
  PillarPileSpacingChanged(this.value);
}

class PillarBlockHeightChanged extends FoundationsEvent {
  final num value;
  PillarBlockHeightChanged(this.value);
}

class PillarFrostStyrofoamChanged extends FoundationsEvent {
  final num value;
  PillarFrostStyrofoamChanged(this.value);
}

class PillarFinnFoamChanged extends FoundationsEvent {
  final num value;
  PillarFinnFoamChanged(this.value);
}

class PillarWoodFrameWeightChanged extends FoundationsEvent {
  final num value;
  PillarWoodFrameWeightChanged(this.value);
}

class PillarSolidBoardingChanged extends FoundationsEvent {
  final num value;
  PillarSolidBoardingChanged(this.value);
}

// HollowCoreSlab sizing
class HollowCoreSlabPileSpacingChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabPileSpacingChanged(this.value);
}

class HollowCoreSlabBlockHeightChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabBlockHeightChanged(this.value);
}

class HollowCoreSlabFrostStyrofoamChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabFrostStyrofoamChanged(this.value);
}

class HollowCoreSlabFinnFoamChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabFinnFoamChanged(this.value);
}

class HollowCoreSlabHollowCoreSlabWeightChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabHollowCoreSlabWeightChanged(this.value);
}

class HollowCoreSlabMineralWoolChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabMineralWoolChanged(this.value);
}

class HollowCoreSlabStyrofoamChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabStyrofoamChanged(this.value);
}

class HollowCoreSlabConcreteCastingChanged extends FoundationsEvent {
  final num value;
  HollowCoreSlabConcreteCastingChanged(this.value);
}
