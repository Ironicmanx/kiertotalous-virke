import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'small_electrical_water_accumulators.freezed.dart';
part 'small_electrical_water_accumulators.g.dart';

/// Vesivaraajat (sähkö, pienet)
@freezed
abstract class SmallElectricalWaterAccumulators extends MachinesOrEquipments
    with _$SmallElectricalWaterAccumulators {
  const SmallElectricalWaterAccumulators._();

  const factory SmallElectricalWaterAccumulators(
      {int? quantity,
      num? weightKgPerPiece}) = _SmallElectricalWaterAccumulators;

  factory SmallElectricalWaterAccumulators.fromJson(
          Map<String, dynamic> json) =>
      _$SmallElectricalWaterAccumulatorsFromJson(json);

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .waterAccumulatorsElectricSmallKgPerPcs;
}
