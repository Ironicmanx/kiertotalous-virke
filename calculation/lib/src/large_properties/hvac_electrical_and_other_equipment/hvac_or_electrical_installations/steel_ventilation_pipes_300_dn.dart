import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

part 'steel_ventilation_pipes_300_dn.freezed.dart';
part 'steel_ventilation_pipes_300_dn.g.dart';

/// Ilmastointiputket teräs DN 300
@freezed
abstract class SteelVentilationPipes300Dn extends HvacOrElectricalInstallations
    with _$SteelVentilationPipes300Dn {
  const SteelVentilationPipes300Dn._();

  const factory SteelVentilationPipes300Dn(
      {num? meters, num? weightKgPerMeter}) = _SteelVentilationPipes300Dn;

  factory SteelVentilationPipes300Dn.fromJson(Map<String, dynamic> json) =>
      _$SteelVentilationPipes300DnFromJson(json);

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.steelVentilationPipes300DnKgPerM;
}
