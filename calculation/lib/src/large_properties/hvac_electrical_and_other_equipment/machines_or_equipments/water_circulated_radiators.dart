import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'water_circulated_radiators.freezed.dart';
part 'water_circulated_radiators.g.dart';

/// Lämpöpatterit, vesikiertoiset
@freezed
abstract class WaterCirculatedRadiators extends MachinesOrEquipments
    with _$WaterCirculatedRadiators {
  const WaterCirculatedRadiators._();

  const factory WaterCirculatedRadiators(
      {int? quantity, num? weightKgPerPiece}) = _WaterCirculatedRadiators;

  factory WaterCirculatedRadiators.fromJson(Map<String, dynamic> json) =>
      _$WaterCirculatedRadiatorsFromJson(json);

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.radiatorsWaterCirculationKgPerPcs;
}
