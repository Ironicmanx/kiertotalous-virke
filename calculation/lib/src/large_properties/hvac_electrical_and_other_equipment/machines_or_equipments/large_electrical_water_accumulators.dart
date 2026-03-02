import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'large_electrical_water_accumulators.freezed.dart';
part 'large_electrical_water_accumulators.g.dart';

/// Vesivaraajat, suuret (sähkö, kaukolämpö 500-1000l)
@freezed
abstract class LargeElectricalWaterAccumulators extends MachinesOrEquipments
    with _$LargeElectricalWaterAccumulators {
  const LargeElectricalWaterAccumulators._();

  const factory LargeElectricalWaterAccumulators(
      {int? quantity,
      num? weightKgPerPiece}) = _LargeElectricalWaterAccumulators;

  factory LargeElectricalWaterAccumulators.fromJson(
          Map<String, dynamic> json) =>
      _$LargeElectricalWaterAccumulatorsFromJson(json);

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .waterAccumulatorsElectricBigDistrictHeating500To1000LitersKgPerPcs;
}
