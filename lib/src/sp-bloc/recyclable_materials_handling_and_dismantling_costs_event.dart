import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class RecyclableMaterialsHandlingAndDismantlingCostsEvent {}

class CleanSoilHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  CleanSoilHandlingCostsChanged(this.costs);
}

class AsphaltWasteHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  AsphaltWasteHandlingCostsChanged(this.costs);
}

class CleanConcreteHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  CleanConcreteHandlingCostsChanged(this.costs);
}

class SteelHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  SteelHandlingCostsChanged(this.costs);
}

class WallAndRoofTilesHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  WallAndRoofTilesHandlingCostsChanged(this.costs);
}

class CleanUsableWoodHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  CleanUsableWoodHandlingCostsChanged(this.costs);
}

class CombustibleWoodWasteHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  CombustibleWoodWasteHandlingCostsChanged(this.costs);
}

class WindProtectionBoardHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  WindProtectionBoardHandlingCostsChanged(this.costs);
}

class GlassAndMineralWoolHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  GlassAndMineralWoolHandlingCostsChanged(this.costs);
}

class GypsumBoardsHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  GypsumBoardsHandlingCostsChanged(this.costs);
}

class ChipboardHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  ChipboardHandlingCostsChanged(this.costs);
}

class EnergyWasteHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  EnergyWasteHandlingCostsChanged(this.costs);
}

class GlassHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  GlassHandlingCostsChanged(this.costs);
}

class AluminiumHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  AluminiumHandlingCostsChanged(this.costs);
}

class RebarAndSteelScrapHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  RebarAndSteelScrapHandlingCostsChanged(this.costs);
}

class StainlessSteelHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  StainlessSteelHandlingCostsChanged(this.costs);
}

class CopperHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  CopperHandlingCostsChanged(this.costs);
}

class ConcreteBlocksHandlingCostsChanged
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final num? costs;
  ConcreteBlocksHandlingCostsChanged(this.costs);
}

class RecyclableMaterialsHandlingCostsUpdated
    extends RecyclableMaterialsHandlingAndDismantlingCostsEvent {
  final RecyclableMaterialsHandlingAndDismantlingCosts costs;
  RecyclableMaterialsHandlingCostsUpdated(this.costs);
}
