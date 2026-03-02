import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'electrical_installations_and_hvac.freezed.dart';
part 'electrical_installations_and_hvac.g.dart';

/// Sähköasennukset ja LVI
@freezed
abstract class Hvac with _$Hvac {
  const Hvac._();

  const factory Hvac({
    num? electricalWiresCopper,
    num? copperPipes,
    num? plasticPipesWater,
    num? ventilationPipesD200,
    num? centralHeatingPipes,
    num? castIronPipes,
    num? sewagePipesPlastic,
    num? rainGutters,
  }) = _Hvac;

  factory Hvac.fromJson(Map<String, dynamic> json) => _$HvacFromJson(json);

  /// Sähköjohdot, kupari (kg)
  num? get electricalWiresCopperWeightKg => Utils.multiplyOrNull([
        electricalWiresCopper,
        PipesAndCablesWeights.electricalWiresCopperKgPerM
      ]);

  /// Kupariputket (kg)
  num? get copperPipesWeightKg => Utils.multiplyOrNull(
      [copperPipes, PipesAndCablesWeights.waterPipesCopperKgPerM]);

  /// Muoviputket, vesi (kg)
  num? get plasticPipesWaterWeightKg => Utils.multiplyOrNull(
      [plasticPipesWater, PipesAndCablesWeights.waterPipesPlasticKgPerM]);

  /// Ilmastointiputket D200 (kg)
  num? get ventilationPipesD200WeightKg => Utils.multiplyOrNull([
        ventilationPipesD200,
        PipesAndCablesWeights.steelVentilationPipes300DnKgPerM
      ]);

  /// Keskuslämmitysputket (kg)
  num? get centralHeatingPipesWeightKg => Utils.multiplyOrNull(
      [centralHeatingPipes, PipesAndCablesWeights.centralHeatingPipesKgPerM]);

  /// Valurautaputket (kg)
  num? get castIronPipesWeightKg => Utils.multiplyOrNull(
      [castIronPipes, PipesAndCablesWeights.sewerPipesCastIronDn150KGPerM]);

  /// Viemäriputket, muovi (kg)
  num? get sewagePipesPlasticWeightKg => Utils.multiplyOrNull(
      [sewagePipesPlastic, PipesAndCablesWeights.sewerPipesPlasticDn150KgPerM]);

  /// Sadevesikourut ja rännit (kg)
  num? get rainGuttersWeightKg => Utils.multiplyOrNull(
      [rainGutters, YardStructureWeights.waterGuttersKgPerSqm]);

  /// Next calculations are from Laskenta tab

  /// Sähköjohdot, kupari (tonnia)
  num? get electricalWiresCopperWeightTons {
    if (electricalWiresCopperWeightKg == null) {
      return null;
    }
    return electricalWiresCopperWeightKg! / 1000;
  }

  /// Kupariputket (tonnia)
  num? get copperPipesWeightTons {
    if (copperPipesWeightKg == null) {
      return null;
    }
    return copperPipesWeightKg! / 1000;
  }

  /// Muoviputket, vesi (tonnia)
  num? get plasticPipesWaterWeightTons {
    if (plasticPipesWaterWeightKg == null) {
      return null;
    }
    return plasticPipesWaterWeightKg! / 1000;
  }

  /// Ilmastointiputket D200 (tonnia)
  num? get ventilationPipesD200WeightTons {
    if (ventilationPipesD200WeightKg == null) {
      return null;
    }
    return ventilationPipesD200WeightKg! / 1000;
  }

  /// Keskuslämmitysputket (tonnia)
  num? get centralHeatingPipesWeightTons {
    if (centralHeatingPipesWeightKg == null) {
      return null;
    }
    return centralHeatingPipesWeightKg! / 1000;
  }

  /// Valurautaputket (tonnia)
  num? get castIronPipesWeightTons {
    if (castIronPipesWeightKg == null) {
      return null;
    }
    return castIronPipesWeightKg! / 1000;
  }

  /// Viemäriputket, muovi (tonnia)
  num? get sewagePipesPlasticWeightTons {
    if (sewagePipesPlasticWeightKg == null) {
      return null;
    }
    return sewagePipesPlasticWeightKg! / 1000;
  }

  /// Sadevesikourut ja rännit (tonnia)
  num? get rainGuttersWeightTons {
    if (rainGuttersWeightKg == null) {
      return null;
    }
    return rainGuttersWeightKg! / 1000;
  }
}
