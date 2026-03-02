import 'package:freezed_annotation/freezed_annotation.dart';

import './hvac_or_electrical_installations/exports.dart';

part 'hvac_and_electrical_installations.freezed.dart';
part 'hvac_and_electrical_installations.g.dart';

/// 12 LVI JA SÄHKÖASENNUKSET
@freezed
abstract class HvacAndElectricalInstallations
    with _$HvacAndElectricalInstallations {
  const factory HvacAndElectricalInstallations(
          {CopperWaterPipes? copperWaterPipes,
          PlasticWaterPipes? plasticWaterPipes,
          CentralHeatingPipes? centralHeatingPipes,
          CastIronSewagePipes? castIronSewagePipes,
          PlasticSewagePipes? plasticSewagePipes,
          SteelVentilationPipes300Dn? steelVentilationPipes300Dn,
          SteelVentilationPipes500Dn? steelVentilationPipes500Dn,
          CopperElectricalWires? copperElectricalWires}) =
      _HvacAndElectricalInstallations;

  factory HvacAndElectricalInstallations.fromJson(Map<String, dynamic> json) =>
      _$HvacAndElectricalInstallationsFromJson(json);
}
