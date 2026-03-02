import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

part 'steel_ventilation_pipes_500_dn.freezed.dart';
part 'steel_ventilation_pipes_500_dn.g.dart';

/// Ilmastointiputket teräs DN 500
@freezed
abstract class SteelVentilationPipes500Dn extends HvacOrElectricalInstallations
    with _$SteelVentilationPipes500Dn {
  const SteelVentilationPipes500Dn._();

  const factory SteelVentilationPipes500Dn(
      {num? meters, num? weightKgPerMeter}) = _SteelVentilationPipes500Dn;

  factory SteelVentilationPipes500Dn.fromJson(Map<String, dynamic> json) =>
      _$SteelVentilationPipes500DnFromJson(json);

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.steelVentilationPipes500DnKgPerM;
}
