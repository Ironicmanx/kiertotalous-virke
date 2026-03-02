abstract class RoomSpaceEvent {}

class WoodFrameWallsChanged extends RoomSpaceEvent {
  final num value;
  WoodFrameWallsChanged(this.value);
}

class BrickWallsChanged extends RoomSpaceEvent {
  final num value;
  BrickWallsChanged(this.value);
}

class ConcreteElementOrCastingWallsChanged extends RoomSpaceEvent {
  final num value;
  ConcreteElementOrCastingWallsChanged(this.value);
}

class ChipboardPortionPercentageChanged extends RoomSpaceEvent {
  final num value;
  ChipboardPortionPercentageChanged(this.value);
}

class CybrocPortionPercentageChanged extends RoomSpaceEvent {
  final num value;
  CybrocPortionPercentageChanged(this.value);
}

class BoardPanelPortionPercentageChanged extends RoomSpaceEvent {
  final num value;
  BoardPanelPortionPercentageChanged(this.value);
}

class CeramicTileWallsPortionPercentageChanged extends RoomSpaceEvent {
  final num value;
  CeramicTileWallsPortionPercentageChanged(this.value);
}

class PaintedPlasteredBrickWallPortionPercentageChanged extends RoomSpaceEvent {
  final num value;
  PaintedPlasteredBrickWallPortionPercentageChanged(this.value);
}

class PlasticCarpetPortionPercentageChanged extends RoomSpaceEvent {
  final num value;
  PlasticCarpetPortionPercentageChanged(this.value);
}
