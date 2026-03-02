import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'yard_or_protective_structures.dart';

part 'drip_trays_and_protective_metal_sheets.freezed.dart';
part 'drip_trays_and_protective_metal_sheets.g.dart';

/// Tippapellit ja suojapellitykset (0,8 mm teräslevy)
@freezed
abstract class DripTraysAndProtectiveMetalSheets
    extends YardOrProtectiveStructures
    with _$DripTraysAndProtectiveMetalSheets {
  const DripTraysAndProtectiveMetalSheets._();

  const factory DripTraysAndProtectiveMetalSheets(
      {num? squareMeters,
      num? weightKgPerSquareMeter}) = _DripTraysAndProtectiveMetalSheets;

  factory DripTraysAndProtectiveMetalSheets.fromJson(
          Map<String, dynamic> json) =>
      _$DripTraysAndProtectiveMetalSheetsFromJson(json);

  @override
  num get defaultWeightKgPerSquareMeter => FixturesAndStructuresWeights
      .dripTraysAndProtectiveSheeting08mmSteelDiskKgPerSqm;
}
