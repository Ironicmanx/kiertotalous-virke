import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import 'machines_or_equipments.dart';

part 'roof_exhaust_fans.freezed.dart';
part 'roof_exhaust_fans.g.dart';

/// Huippuimurit
@freezed
abstract class RoofExhaustFans extends MachinesOrEquipments
    with _$RoofExhaustFans {
  const RoofExhaustFans._();

  const factory RoofExhaustFans({int? quantity, num? weightKgPerPiece}) =
      _RoofExhaustFans;
  factory RoofExhaustFans.fromJson(Map<String, dynamic> json) =>
      _$RoofExhaustFansFromJson(json);

  @override
  num get defaultWeightKgPerPiece =>
      HvacAndElectricalInstallationsWeights.roofExhaustFansKgPerPcs;
}
