import 'package:freezed_annotation/freezed_annotation.dart';

import 'machines_or_equipments/exports.dart';

part 'machines_and_equipments.freezed.dart';
part 'machines_and_equipments.g.dart';

/// 13. KONEET JA LAITTEET
@freezed
abstract class MachinesAndEquipments with _$MachinesAndEquipments {
  const factory MachinesAndEquipments(
      {SmallElectricalWaterAccumulators? smallElectricalAccumulators,
      LargeElectricalWaterAccumulators? largeElectricalAccumulators,
      ElectricRadiators? electricRadiators,
      WaterCirculatedRadiators? waterCirculatedRadiators,
      VentilationUnits? ventilationUnits,
      ElectricalDistributionCabinetsAndMeters?
          electricalDistributionCabinetsAndMeters,
      ElectricMotorsAndCirculationPumps? electricMotorsAndCirculationPumps,
      RoofExhaustFans? roofExhaustFans,
      @Default(false) bool machinesRecyclable}) = _MachinesAndEquipments;

  factory MachinesAndEquipments.fromJson(Map<String, dynamic> json) =>
      _$MachinesAndEquipmentsFromJson(json);
}
