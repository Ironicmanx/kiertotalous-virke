import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_materials_notes.freezed.dart';
part 'recyclable_materials_notes.g.dart';

@freezed
abstract class RecyclableMaterialsNotes with _$RecyclableMaterialsNotes {
  RecyclableMaterialsNotes._();

  factory RecyclableMaterialsNotes(
      {String? cleanSoilNotes,
      String? asphaltWasteNotes,
      String? cleanConcreteNotes,
      String? steelNotes,
      String? wallAndRoofTilesNotes,
      String? cleanUsableWoodNotes,
      String? combustibleWoodWasteNotes,
      String? windProtectionBoardNotes,
      String? glassAndMineralWoolNotes,
      String? gypsumBoardsNotes,
      String? chipboardNotes,
      String? energyWasteNotes,
      String? glassNotes,
      String? aluminiumNotes,
      String? rebarAndSteelScrapNotes,
      String? stainlessSteelNotes,
      String? copperNotes,
      String? concreteBlocksNotes}) = _RecyclableMaterialsNotes;

  factory RecyclableMaterialsNotes.fromJson(Map<String, dynamic> json) =>
      _$RecyclableMaterialsNotesFromJson(json);
}
