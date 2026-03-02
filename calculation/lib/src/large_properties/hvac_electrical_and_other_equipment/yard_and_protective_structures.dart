import 'package:freezed_annotation/freezed_annotation.dart';

import 'yard_or_protective_structures/concrete_paving_slabs.dart';
import 'yard_or_protective_structures/drip_trays_and_protective_metal_sheets.dart';

part 'yard_and_protective_structures.freezed.dart';
part 'yard_and_protective_structures.g.dart';

/// 15. PIHA JA SUOJARAKENTEET
@freezed
abstract class YardAndProtectiveStructures with _$YardAndProtectiveStructures {
  const factory YardAndProtectiveStructures(
      {DripTraysAndProtectiveMetalSheets? dripTraysAndProtectiveMetalSheets,
      ConcretePavingSlabs? concretePavingSlabs}) = _YardAndProtectiveStructures;

  factory YardAndProtectiveStructures.fromJson(Map<String, dynamic> json) =>
      _$YardAndProtectiveStructuresFromJson(json);
}
