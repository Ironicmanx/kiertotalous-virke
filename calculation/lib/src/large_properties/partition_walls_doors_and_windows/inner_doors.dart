import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bl_demolition_materials/src/shared/doors_info.dart';
import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'inner_doors.freezed.dart';
part 'inner_doors.g.dart';

/// Sisäovet
/// Sisältää tiedot kaikkien sisäovien materiaalimäärista yhteensä
@freezed
abstract class InnerDoors with _$InnerDoors {
  const InnerDoors._();

  const factory InnerDoors(
      {DoorsInfo? panelDoors,
      DoorsInfo? woodenDoors,
      DoorsInfo? fireDoors,
      @Default(false) bool areDoorsRecyclable}) = _InnerDoors;

  factory InnerDoors.fromJson(Map<String, dynamic> json) =>
      _$InnerDoorsFromJson(json);

  num? get totalWoodVolume {
    final allNulls = Utils.sumOrNull([
      panelDoors?.shutDoors,
      panelDoors?.glassDoors,
      woodenDoors?.shutDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == null) {
      return null;
    }
    final result = allNulls *
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm;
    return result;
  }

  num? get totalGlassVolume {
    final allNulls = Utils.sumOrNull([
      panelDoors?.glassDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == null) {
      return null;
    }
    final result =
        allNulls * DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg / 1000;
    return result;
  }

  num? get totalWoodTons {
    final allNulls = Utils.sumOrNull([
      panelDoors?.shutDoors,
      panelDoors?.glassDoors,
      woodenDoors?.shutDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == null) {
      return null;
    }
    final result = allNulls *
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
        1000;
    return result;
  }

  num? get totalGlassTons {
    final allNulls = Utils.sumOrNull([
      panelDoors?.glassDoors,
      woodenDoors?.glassDoors,
    ]);
    if (allNulls == null) {
      return null;
    }
    final result = allNulls *
        DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg /
        DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKgPerCbm;
    return result;
  }

  num? get totalSteelTons {
    if (fireDoors?.shutDoors == null) {
      return null;
    }
    final result =
        fireDoors!.shutDoors! * DoorWeights.steelDoorClosedFireDoorKg / 1000;
    return result;
  }
}
