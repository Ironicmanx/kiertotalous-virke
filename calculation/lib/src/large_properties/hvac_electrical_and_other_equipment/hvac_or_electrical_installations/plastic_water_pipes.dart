import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

part 'plastic_water_pipes.freezed.dart';
part 'plastic_water_pipes.g.dart';

/// Vesiputket, muovi
@freezed
abstract class PlasticWaterPipes extends HvacOrElectricalInstallations
    with _$PlasticWaterPipes {
  const PlasticWaterPipes._();

  const factory PlasticWaterPipes({num? meters, num? weightKgPerMeter}) =
      _PlasticWaterPipes;

  factory PlasticWaterPipes.fromJson(Map<String, dynamic> json) =>
      _$PlasticWaterPipesFromJson(json);

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.waterPipesPlasticKgPerM;

  @override
  num get volume =>
      (weightKgPerMeter ?? defaultWeightKgPerMeter) /
      HvacAndElectricalInstallationsWeights.waterPipesPlasticKgPerCbm;
}
