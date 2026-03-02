import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bl_demolition_materials/src/shared/doors_info.dart';
import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'small_property_outer_doors.freezed.dart';
part 'small_property_outer_doors.g.dart';

/// Ulko-ovet
/// Sisältää tiedot kaikkien ulko-ovien materiaalimäärista yhteensä
@freezed
abstract class SmallPropertyOuterDoors with _$SmallPropertyOuterDoors {
  const SmallPropertyOuterDoors._();

  const factory SmallPropertyOuterDoors({
    DoorsInfo? woodenDoor,
    DoorsInfo? aluminiumDoor,
    DoorsInfo? steelDoor,
    @Default(false) bool areDoorsRecyclable,
  }) = _SmallPropertyOuterDoors;

  factory SmallPropertyOuterDoors.fromJson(Map<String, dynamic> json) =>
      _$SmallPropertyOuterDoorsFromJson(json);

  num? get woodenDoorTons {
    num? sum = Utils.sumOrNull([
      Utils.multiplyOrNull([
        woodenDoor?.shutDoors,
        DoorsAndWindowsWeights.woodenOutdoor210x180ClosedKg
      ]),
      Utils.multiplyOrNull([
        woodenDoor?.glassDoors,
        DoorsAndWindowsWeights.woodenOutdoors210x180Glass05sqmFrameKg
      ])
    ]);
    if (sum == null) {
      return null;
    }
    return sum / 1000;
  }

  num? get woodenDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      woodenDoor?.glassDoors,
      DoorsAndWindowsWeights.woodenOutdoors210x180Glass05GlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get aluminiumDoorTons {
    num? sum = Utils.sumOrNull([
      Utils.multiplyOrNull([
        aluminiumDoor?.shutDoors,
        DoorsAndWindowsWeights.aluminiumDoorsWithGlassFrameKg
      ]),
      Utils.multiplyOrNull([
        aluminiumDoor?.glassDoors,
        DoorsAndWindowsWeights.aluminiumDoorsWithGlassFrameKg
      ])
    ]);
    if (sum == null) {
      return null;
    }
    return sum / 1000;
  }

  num? get aluminiumDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumDoor?.glassDoors,
      DoorsAndWindowsWeights.aluminiumDoorsWithGlassGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get steelDoorTons {
    num? sum = Utils.sumOrNull([
      Utils.multiplyOrNull(
          [steelDoor?.shutDoors, DoorsAndWindowsWeights.steelDoorsClosedKg]),
      Utils.multiplyOrNull([
        steelDoor?.glassDoors,
        DoorsAndWindowsWeights.aluminiumDoorsWithGlassFrameKg
      ])
    ]);
    if (sum == null) {
      return null;
    }
    return sum / 1000;
  }

  num? get steelDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      steelDoor?.glassDoors,
      DoorsAndWindowsWeights.steelDoorsGlass05sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Next parts are from Laskenta tab, ulko-ovet

  /// Kierrätettävät puiset ulko-ovet, tonnia
  num? get recyclableWoodDoorsTons {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return woodenDoorTons;
  }

  /// Kierrätettävät puiset ulko-ovet, kpl
  num? get recyclableWoodDoorsPieces {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull([woodenDoor?.shutDoors, woodenDoor?.glassDoors]);
  }

  /// Puiset ulko-ovet, romut ja poltettavat
  num? get woodenDoorsScrapAndBurnable {
    if (areDoorsRecyclable == true) {
      return null;
    }
    return woodenDoorTons;
  }

  /// Kierrätettävät alumiiniset ulko-ovet, tonnia
  num? get recyclableAluminiumDoorsTons {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return aluminiumDoorTons;
  }

  /// Kierrätettävät alumiiniset ulko-ovet, kpl
  num? get recyclableAluminiumDoorsPieces {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull(
        [aluminiumDoor?.shutDoors, aluminiumDoor?.glassDoors]);
  }

  /// Alumiiniset ulko-ovet, romut ja poltettavat
  num? get aluminiumDoorsScrapAndBurnable {
    if (areDoorsRecyclable == true) {
      return null;
    }
    return aluminiumDoorTons;
  }

  /// Kierrätettävät teräksiset ulko-ovet, tonnia
  num? get recyclableSteelDoorsTons {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return steelDoorTons;
  }

  /// Kierrätettävät teräksiset ulko-ovet, kpl
  num? get recyclableSteelDoorsPieces {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull([steelDoor?.shutDoors, steelDoor?.glassDoors]);
  }

  /// Teräksiset ulko-ovet, romut ja poltettavat
  num? get steelDoorsScrapAndBurnable {
    if (areDoorsRecyclable == true) {
      return null;
    }
    return steelDoorTons;
  }

  /// Kierrätettävien ulko-ovien lasiosuus, tonnia
  num? get recyclableDoorsGlassTons {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull(
        [woodenDoorGlassTons, aluminiumDoorGlassTons, steelDoorGlassTons]);
  }

  /// Kierrätettävien ulko-ovien lasiosuus, romut ja poltettavat
  num? get doorsGlassScrapAndBurnable {
    if (areDoorsRecyclable == true) {
      return null;
    }
    return Utils.sumOrNull(
        [woodenDoorGlassTons, aluminiumDoorGlassTons, steelDoorGlassTons]);
  }
}
