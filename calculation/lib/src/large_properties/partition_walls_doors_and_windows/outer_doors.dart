import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../shared/doors_info.dart';
import '../../utils/utils.dart';

part 'outer_doors.freezed.dart';
part 'outer_doors.g.dart';

/// Ulko-ovet
/// Sisältää tiedot kaikkien ulko-ovien materiaalimääristä yhteensä
@freezed
abstract class OuterDoors with _$OuterDoors {
  const OuterDoors._();

  const factory OuterDoors(
      {DoorsInfo? woodenDoors,
      DoorsInfo? aluminiumDoors,
      DoorsInfo? steelDoors,
      num? accessAndLoadingDoors,
      @Default(false) bool areDoorsRecyclable}) = _OuterDoors;

  factory OuterDoors.fromJson(Map<String, dynamic> json) =>
      _$OuterDoorsFromJson(json);

  num? get totalWoodVolume {
    final allNulls =
        Utils.allNull([woodenDoors?.shutDoors, woodenDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }

    var shutWoodenDoorsVolume = 0.0;

    if (woodenDoors?.shutDoors != null) {
      shutWoodenDoorsVolume = woodenDoors!.shutDoors! *
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg /
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm;
    }

    var glassWoodenDoorsVolume = 0.0;

    if (woodenDoors?.glassDoors != null) {
      glassWoodenDoorsVolume = woodenDoors!.glassDoors! *
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg /
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKgPerCbm;
    }

    return shutWoodenDoorsVolume + glassWoodenDoorsVolume;
  }

  num? get totalGlassVolume {
    final allNulls = Utils.allNull([
      woodenDoors?.glassDoors,
      aluminiumDoors?.glassDoors,
      steelDoors?.glassDoors,
      accessAndLoadingDoors
    ]);

    if (allNulls) {
      return null;
    }

    final result = Utils.sumOrNull([
          Utils.multiplyOrNull([
            woodenDoors?.glassDoors,
            DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg
          ]),
          Utils.multiplyOrNull([
            aluminiumDoors?.glassDoors,
            DoorWeights.aluminiumDoorWithGlassGlassKg
          ]),
          Utils.multiplyOrNull([
            steelDoors?.glassDoors,
            DoorWeights.steelDoorWithGlass05SqmGlassKg
          ]),
          Utils.multiplyOrNull([
            accessAndLoadingDoors,
            DoorWeights.metallicLiftDoorsAndBigPassageDoorsGlassKg
          ])
        ])! /
        DoorWeights.woodenOuterDoor210x80WithGlass05SqmGlassKgPerCbm;

    return result;
  }

  num? get totalWoodTons {
    final allNulls =
        Utils.allNull([woodenDoors?.shutDoors, woodenDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }

    var shutWoodenDoorsTons = 0.0;

    if (woodenDoors?.shutDoors != null) {
      shutWoodenDoorsTons = woodenDoors!.shutDoors! *
          DoorWeights.woodenOuterDoor210x80WithGlass05SqmTrunkAndSlabKg /
          1000;
    }

    var glassWoodenDoorsTons = 0.0;

    if (woodenDoors?.glassDoors != null) {
      glassWoodenDoorsTons = woodenDoors!.glassDoors! *
          DoorWeights.woodenInnerDoorWithGlass05SqmTrunkAndSlabKg /
          1000;
    }

    final result = shutWoodenDoorsTons + glassWoodenDoorsTons;
    return result;
  }

  num? get totalAluminiumTons {
    final allNulls =
        Utils.allNull([aluminiumDoors?.shutDoors, aluminiumDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
          (Utils.multiplyOrNull([
            aluminiumDoors?.shutDoors,
            DoorWeights.aluminiumDoorWithGlassTrunkAndSlabKg
          ])),
          (Utils.multiplyOrNull([
            aluminiumDoors?.glassDoors,
            DoorWeights.aluminiumDoorWithGlassTrunkAndSlabKg
          ]))
        ])! /
        1000;
    return result;
  }

  num? get totalSteelTons {
    final allNulls =
        Utils.allNull([steelDoors?.shutDoors, steelDoors?.glassDoors]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
          (Utils.multiplyOrNull(
              [steelDoors?.shutDoors, DoorWeights.steelDoorClosedFireDoorKg])),
          (Utils.multiplyOrNull([
            steelDoors?.glassDoors,
            DoorWeights.steelDoorWithGlass05SqmTrunkAndSlabKg
          ])),
          (Utils.multiplyOrNull([
            accessAndLoadingDoors,
            DoorWeights.metallicLiftDoorsAndBigPassageDoorsKg
          ]))
        ])! /
        1000;
    return result;
  }

  num? get totalGlassTons {
    final allNulls = Utils.allNull([
      woodenDoors?.glassDoors,
      aluminiumDoors?.glassDoors,
      steelDoors?.glassDoors
    ]);
    if (allNulls) {
      return null;
    }
    final result = Utils.sumOrNull([
          (Utils.multiplyOrNull([
            woodenDoors?.glassDoors,
            DoorWeights.woodenInnerDoorWithGlass05SqmGlassKg
          ])),
          (Utils.multiplyOrNull([
            aluminiumDoors?.glassDoors,
            DoorWeights.aluminiumDoorWithGlassGlassKg
          ])),
          (Utils.multiplyOrNull([
            steelDoors?.glassDoors,
            DoorWeights.steelDoorWithGlass05SqmGlassKg
          ]))
        ])! /
        1000;
    return result;
  }
}
