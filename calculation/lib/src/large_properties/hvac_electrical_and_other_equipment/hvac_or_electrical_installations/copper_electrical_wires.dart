import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'hvac_or_electrical_installations.dart';

part 'copper_electrical_wires.freezed.dart';
part 'copper_electrical_wires.g.dart';

/// Sähköjohdot, kupari
@freezed
abstract class CopperElectricalWires extends HvacOrElectricalInstallations
    with _$CopperElectricalWires {
  const CopperElectricalWires._();

  const factory CopperElectricalWires({num? meters, num? weightKgPerMeter}) =
      _CopperElectricalWires;

  factory CopperElectricalWires.fromJson(Map<String, dynamic> json) =>
      _$CopperElectricalWiresFromJson(json);

  @override
  num get defaultWeightKgPerMeter =>
      HvacAndElectricalInstallationsWeights.electricalWiresCopperKgPerM;
}
