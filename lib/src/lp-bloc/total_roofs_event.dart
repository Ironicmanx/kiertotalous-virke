import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalRoofsEvent {}

class TotalRoofsChanged extends TotalRoofsEvent {
  final TotalRoofs totalRoofs;
  TotalRoofsChanged(this.totalRoofs);
}

class FoundationsChanged extends TotalRoofsEvent {
  final Foundations foundations;
  FoundationsChanged(this.foundations);
}

class RoofsChanged extends TotalRoofsEvent {
  final Roofs roofs;
  RoofsChanged(this.roofs);
}

class BituminousWaterProofingChanged extends TotalRoofsEvent {
  final bool bituminousWaterProofing;
  BituminousWaterProofingChanged(this.bituminousWaterProofing);
}
