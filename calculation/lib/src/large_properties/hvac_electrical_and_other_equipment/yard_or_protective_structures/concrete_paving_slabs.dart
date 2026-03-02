import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'yard_or_protective_structures.dart';

part 'concrete_paving_slabs.freezed.dart';
part 'concrete_paving_slabs.g.dart';

/// Tippapellit ja suojapellitykset (0,8 mm teräslevy)
@freezed
abstract class ConcretePavingSlabs extends YardOrProtectiveStructures
    with _$ConcretePavingSlabs {
  const ConcretePavingSlabs._();

  const factory ConcretePavingSlabs(
      {num? squareMeters, num? weightKgPerSquareMeter}) = _ConcretePavingSlabs;

  factory ConcretePavingSlabs.fromJson(Map<String, dynamic> json) =>
      _$ConcretePavingSlabsFromJson(json);

  @override
  num get defaultWeightKgPerSquareMeter =>
      YardStructureWeights.concreteYardTilesKgPerSqm;
}
