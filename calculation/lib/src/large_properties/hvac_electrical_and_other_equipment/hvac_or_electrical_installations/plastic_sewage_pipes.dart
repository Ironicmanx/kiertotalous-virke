import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

part 'plastic_sewage_pipes.freezed.dart';
part 'plastic_sewage_pipes.g.dart';

/// Viemäriputket, muovi DN 150
@freezed
abstract class PlasticSewagePipes extends HvacOrElectricalInstallations
    with _$PlasticSewagePipes {
  const PlasticSewagePipes._();

  const factory PlasticSewagePipes({num? meters, num? weightKgPerMeter}) =
      _PlasticSewagePipes;

  factory PlasticSewagePipes.fromJson(Map<String, dynamic> json) =>
      _$PlasticSewagePipesFromJson(json);

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.sewagePipesPlasticDn150KgPerM;

  @override
  num get volume =>
      (weightKgPerMeter ?? defaultWeightKgPerMeter) /
      HvacAndElectricalInstallationsWeights.sewagePipesPlasticDn150KgPerCbm;
}
