import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'small_property_inner_doors.freezed.dart';
part 'small_property_inner_doors.g.dart';

/// Sisäovet
/// Sisältää tiedot kaikkien sisäovien materiaalimäärista yhteensä
@freezed
abstract class SmallPropertyInnerDoors with _$SmallPropertyInnerDoors {
  const SmallPropertyInnerDoors._();

  const factory SmallPropertyInnerDoors({
    DoorsInfo? woodenDoor,
    DoorsInfo? panelDoor,
    @Default(false) bool areDoorsRecyclable,
  }) = _SmallPropertyInnerDoors;

  factory SmallPropertyInnerDoors.fromJson(Map<String, dynamic> json) =>
      _$SmallPropertyInnerDoorsFromJson(json);

  num? get woodenDoorWoodTons {
    num? multiply = Utils.multiplyOrNull([
      Utils.sumOrNull([woodenDoor?.shutDoors, woodenDoor?.glassDoors]),
      DoorsAndWindowsWeights.woodenInnerDoorsGlass05sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get woodenDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      woodenDoor?.glassDoors,
      DoorsAndWindowsWeights.woodenInnerDoorsGlass05sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get panelDoorWoodTons {
    num? multiply = Utils.multiplyOrNull([
      Utils.sumOrNull([panelDoor?.shutDoors, panelDoor?.glassDoors]),
      DoorsAndWindowsWeights.fiberDoorsGlass05sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get panelDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      panelDoor?.glassDoors,
      DoorsAndWindowsWeights.fiberDoorsGlass05sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Next parts are from Laskenta tab, sisäovet

  /// Kierrätettävät puiset sisäovet, tonnia
  num? get recyclableWoodenInnerDoorsTons {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return woodenDoorWoodTons;
  }

  /// Kierrätettävät puiset sisäovet, kpl
  num? get recyclableWoodenInnerDoorsPieces {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull([woodenDoor?.shutDoors, woodenDoor?.glassDoors]);
  }

  /// Puiset sisäovet, romut ja poltettavat
  num? get woodenInnerDoorsScrapAndBurnable {
    if (areDoorsRecyclable == true) {
      return null;
    }
    return Utils.sumOrNull([woodenDoor?.shutDoors, woodenDoor?.glassDoors]);
  }

  /// Kierrätettävät kuitulevysisäovet, tonnia
  num? get recyclablePanelInnerDoorsTons {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return panelDoorWoodTons;
  }

  /// Kierrätettävät kuitulevysisäovet, kpl
  num? get recyclablePanelInnerDoorsPieces {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull([panelDoor?.shutDoors, panelDoor?.glassDoors]);
  }

  /// Kuitulevysisäovet, romut ja poltettavat
  num? get panelInnerDoorsScrapAndBurnable {
    if (areDoorsRecyclable == true) {
      return null;
    }
    return panelDoorWoodTons;
  }

  /// Kierrätettävien sisäovien lasiosuus, tonnia
  num? get recyclableInnerDoorsGlassTons {
    if (areDoorsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull([woodenDoorGlassTons, panelDoorGlassTons]);
  }

  /// Sisäovien lasiosuus, romut ja poltettavat
  num? get innerDoorsGlassScrapAndBurnable {
    if (areDoorsRecyclable == true) {
      return null;
    }
    return Utils.sumOrNull([woodenDoorGlassTons, panelDoorGlassTons]);
  }
}
