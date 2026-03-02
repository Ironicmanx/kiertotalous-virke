import 'package:freezed_annotation/freezed_annotation.dart';

part 'recyclable_components_notes.freezed.dart';
part 'recyclable_components_notes.g.dart';

@freezed
abstract class RecyclableComponentsNotes with _$RecyclableComponentsNotes {
  RecyclableComponentsNotes._();

  factory RecyclableComponentsNotes(
      {String? woodAndFiberboardDoorsNotes,
      String? aluminumDoorsNotes,
      String? steelDoorsNotes,
      String? woodenWindowsNotes,
      String? steelFrameWindowsNotes,
      String? aluminumFrameWindowsNotes,
      String? porcelainToiletsNotes,
      String? cabinetsAndFurnitureNotes,
      String? porcelainSinksNotes,
      String? stainlessSteelSinksAndTablesNotes,
      String? saunaStovesNotes,
      String? electricStovesNotes,
      String? refrigeratorsNotes,
      String? waterAccumulatorsNotes,
      String? electricMotorsNotes,
      String? ventilationMachinesNotes,
      String? thermalBoilerNotes,
      String? districtHeatingExchangerNotes}) = _RecyclableComponentsNotes;

  factory RecyclableComponentsNotes.fromJson(Map<String, dynamic> json) =>
      _$RecyclableComponentsNotesFromJson(json);
}
