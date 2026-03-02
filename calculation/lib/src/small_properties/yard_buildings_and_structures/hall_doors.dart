import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'hall_doors.freezed.dart';
part 'hall_doors.g.dart';

/// Halliovet
/// Sisältää tiedot kaikkien halliovien materiaalimäärista yhteensä
@freezed
abstract class HallDoors with _$HallDoors {
  const HallDoors._();

  const factory HallDoors({
    num? woodenDoors,
    num? aluminiumDoors,
    num? steelDoors,
    @Default(false) bool areHallDoorsRecyclable,
  }) = _HallDoors;

  factory HallDoors.fromJson(Map<String, dynamic> json) =>
      _$HallDoorsFromJson(json);

  /// Puuovi (tonnia)
  num? get woodenDoorTons {
    num? multiply = Utils.multiplyOrNull([
      woodenDoors,
      YardStructureWeights.woodenLiftDoorsAndBigPassageDoors3x5mKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, puuovet
  num? get recyclableWoodenDoorTons {
    if (areHallDoorsRecyclable == true) {
      return woodenDoorTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävät puuovet (kpl)
  num? get recyclableWoodDoorPieces {
    if (areHallDoorsRecyclable == true) {
      return woodenDoors;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, polttokelpoinen puujäte
  num? get burnableWoodTons {
    if (areHallDoorsRecyclable == false) {
      return woodenDoorTons;
    }
    return null;
  }

  /// Alumiiniovi (tonnia)
  num? get aluminiumDoorTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumDoors,
      YardStructureWeights.aluminiumLiftDoorsAndBigPassageDoors3x5mKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Materliaalimäärätaulukkoon luettava arvo, alumiiniovet
  num? get recyclableAluminiumDoorTons {
    if (areHallDoorsRecyclable == true) {
      return aluminiumDoorTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävät alumiiniovet (kpl)
  num? get recyclableAluminiumDoorPieces {
    if (areHallDoorsRecyclable == true) {
      return aluminiumDoors;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, alumiini
  num? get aluminiumTons {
    if (areHallDoorsRecyclable == false) {
      return aluminiumDoorTons;
    }
    return null;
  }

  /// Teräsovi (tonnia)
  num? get steelDoorTons {
    num? multiply = Utils.multiplyOrNull([
      steelDoors,
      YardStructureWeights.steelLiftDoorsAndBigPassageDoors3x5mKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, teräsovet
  num? get recyclableSteelDoorTons {
    if (areHallDoorsRecyclable == true) {
      return steelDoorTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävät teräsovet (kpl)
  num? get recyclableSteelDoorPieces {
    if (areHallDoorsRecyclable == true) {
      return steelDoors;
    }
    return null;
  }
}
