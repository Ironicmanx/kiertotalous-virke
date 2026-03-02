import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'electrical_distribution_cabinets_and_meters.freezed.dart';
part 'electrical_distribution_cabinets_and_meters.g.dart';

/// Sähköjakokaapit ja mittarit
@freezed
abstract class ElectricalDistributionCabinetsAndMeters
    extends MachinesOrEquipments
    with _$ElectricalDistributionCabinetsAndMeters {
  const ElectricalDistributionCabinetsAndMeters._();

  const factory ElectricalDistributionCabinetsAndMeters(
      {int? quantity,
      num? weightKgPerPiece}) = _ElectricalDistributionCabinetsAndMeters;

  factory ElectricalDistributionCabinetsAndMeters.fromJson(
          Map<String, dynamic> json) =>
      _$ElectricalDistributionCabinetsAndMetersFromJson(json);

  @override
  num get defaultWeightKgPerPiece => HvacAndElectricalInstallationsWeights
      .electricalDistributionCabinetsAndMetersKgPerPcs;
}
