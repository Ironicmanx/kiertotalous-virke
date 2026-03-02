abstract class DisposableAndHazardousNotesEvent {}

class CeramicTileNotesChanged extends DisposableAndHazardousNotesEvent {
  final String? ceramicTilePorcelainAndGlassAndInsulationWoolNotes;
  CeramicTileNotesChanged(
      this.ceramicTilePorcelainAndGlassAndInsulationWoolNotes);
}

class BrickWasteNotesChanged extends DisposableAndHazardousNotesEvent {
  final String? nonRecyclableBrickWasteNotes;
  BrickWasteNotesChanged(this.nonRecyclableBrickWasteNotes);
}

class PlasterBoardNotesChanged extends DisposableAndHazardousNotesEvent {
  final String? nonRecyclablePlasterBoardNotes;
  PlasterBoardNotesChanged(this.nonRecyclablePlasterBoardNotes);
}

class ContaminatedSoilNotesChanged extends DisposableAndHazardousNotesEvent {
  final String? contaminatedSoilNotes;
  ContaminatedSoilNotesChanged(this.contaminatedSoilNotes);
}

class AsbestosConcreteNotesChanged extends DisposableAndHazardousNotesEvent {
  final String? concreteContainingAsbestosNotes;
  AsbestosConcreteNotesChanged(this.concreteContainingAsbestosNotes);
}

class MineriteFeltNotesChanged extends DisposableAndHazardousNotesEvent {
  final String? mineriteOrFeltContainingAsbestosNotes;
  MineriteFeltNotesChanged(this.mineriteOrFeltContainingAsbestosNotes);
}

class PcbPaintNotesChanged extends DisposableAndHazardousNotesEvent {
  final String? concreteContainingPcbPaintingNotes;
  PcbPaintNotesChanged(this.concreteContainingPcbPaintingNotes);
}
