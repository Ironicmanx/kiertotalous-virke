import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'electric_radiators.freezed.dart';
part 'electric_radiators.g.dart';

/// Lämpöpatterit, sähkö
@freezed
abstract class ElectricRadiators extends MachinesOrEquipments
    with _$ElectricRadiators {
  const ElectricRadiators._();

  const factory ElectricRadiators({int? quantity, num? weightKgPerPiece}) =
      _ElectricRadiators;

  factory ElectricRadiators.fromJson(Map<String, dynamic> json) =>
      _$ElectricRadiatorsFromJson(json);

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.radiatorsElectricKgPerPcs;
}
