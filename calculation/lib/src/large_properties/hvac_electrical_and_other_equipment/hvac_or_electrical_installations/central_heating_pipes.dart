import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

part 'central_heating_pipes.freezed.dart';
part 'central_heating_pipes.g.dart';

/// Keskusämmitysputket, vesikiertoinen lämmitys (teräs)
@freezed
abstract class CentralHeatingPipes extends HvacOrElectricalInstallations
    with _$CentralHeatingPipes {
  const CentralHeatingPipes._();

  const factory CentralHeatingPipes({num? meters, num? weightKgPerMeter}) =
      _CentralHeatingPipes;

  factory CentralHeatingPipes.fromJson(Map<String, dynamic> json) =>
      _$CentralHeatingPipesFromJson(json);

  @override
  num get defaultWeightKgPerMeter => HvacAndElectricalInstallationsWeights
      .centralHeatingPipesWaterCirculationHeatingKgPerM;
}
