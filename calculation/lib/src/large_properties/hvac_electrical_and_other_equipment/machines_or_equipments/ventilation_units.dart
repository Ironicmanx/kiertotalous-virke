import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'ventilation_units.freezed.dart';
part 'ventilation_units.g.dart';

/// Ilmanvaihtokoneet
@freezed
abstract class VentilationUnits extends MachinesOrEquipments
    with _$VentilationUnits {
  const VentilationUnits._();

  const factory VentilationUnits({int? quantity, num? weightKgPerPiece}) =
      _VentilationUnits;
  factory VentilationUnits.fromJson(Map<String, dynamic> json) =>
      _$VentilationUnitsFromJson(json);

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.ventilationUnitsKgPerPcs;
}
