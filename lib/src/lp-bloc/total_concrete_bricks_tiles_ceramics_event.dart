import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalConcreteBricksTilesCeramicsEvent {}

class ConcreteBricksTilesCeramicsChanged
    extends TotalConcreteBricksTilesCeramicsEvent {
  final ConcreteBricksTilesCeramics concreteBricksTilesCeramics;

  ConcreteBricksTilesCeramicsChanged(this.concreteBricksTilesCeramics);
}

class FoundationsChanged extends TotalConcreteBricksTilesCeramicsEvent {
  final Foundations foundations;

  FoundationsChanged(this.foundations);
}

class TotalIntermediateFloorsChanged
    extends TotalConcreteBricksTilesCeramicsEvent {
  final TotalIntermediateFloors totalIntermediateFloors;

  TotalIntermediateFloorsChanged(this.totalIntermediateFloors);
}

class TotalRoofsChanged extends TotalConcreteBricksTilesCeramicsEvent {
  final TotalRoofs totalRoofs;

  TotalRoofsChanged(this.totalRoofs);
}

class TotalBuildingFrameChanged extends TotalConcreteBricksTilesCeramicsEvent {
  final TotalBuildingFrame totalBuildingFrame;

  TotalBuildingFrameChanged(this.totalBuildingFrame);
}

class InternalWallFramesAndSurfaceMaterialChanged
    extends TotalConcreteBricksTilesCeramicsEvent {
  final InternalWallFramesAndSurfaceMaterial
      internalWallFramesAndSurfaceMaterial;

  InternalWallFramesAndSurfaceMaterialChanged(
      this.internalWallFramesAndSurfaceMaterial);
}

class TotalDemolitionWasteAndCostsChanged
    extends TotalConcreteBricksTilesCeramicsEvent {
  final TotalDemolitionWasteAndCosts totalDemolitionWasteAndCosts;

  TotalDemolitionWasteAndCostsChanged(this.totalDemolitionWasteAndCosts);
}
