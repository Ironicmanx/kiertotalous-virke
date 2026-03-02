import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'passage_doors.freezed.dart';
part 'passage_doors.g.dart';

/// Kulkuovet
/// Sisältää tiedot kaikkien kulkuovien materiaalimäärista yhteensä
@freezed
abstract class PassageDoors with _$PassageDoors {
  const PassageDoors._();

  const factory PassageDoors({
    DoorsInfo? woodenDoor,
    DoorsInfo? aluminiumDoor,
    DoorsInfo? steelDoor,
    @Default(false) bool doorsRecyclable,
  }) = _PassageDoors;

  factory PassageDoors.fromJson(Map<String, dynamic> json) =>
      _$PassageDoorsFromJson(json);

  /// Puuovi (tonnia)
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
    return sum != null ? sum / 1000 : null;
  }

  /// Materiaalimääärätaulukkoon luettava määrä, puuovet
  num? get recyclableWoodenDoorTons {
    if (doorsRecyclable == true) {
      return woodenDoorTons;
    }
    return null;
  }

  /// Materiaalimääärätaulukkoon luettava määrä, kierrätettävät puuovet (kpl)
  num? get recyclableWoodDoorPieces {
    if (doorsRecyclable == true) {
      return Utils.sumOrNull([
        woodenDoor?.shutDoors,
        woodenDoor?.glassDoors,
      ]);
    }
    return null;
  }

  /// Materiaalimääärätaulukkoon luettava määrä, polttokelpoinen puujäte
  num? get burnableWoodTons {
    if (doorsRecyclable == false) {
      return woodenDoorTons;
    }
    return null;
  }

  /// Puuovi, lasia (tonnia)
  num? get woodenDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      woodenDoor?.glassDoors,
      DoorsAndWindowsWeights.woodenOutdoors210x180Glass05GlassKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Materiaalimäärään luettava arvo, lasi
  num? get woodenDoorglassTonsNotRecyclable {
    if (doorsRecyclable == false) {
      return woodenDoorGlassTons;
    }
    return null;
  }

  /// Alumiiniovi (tonnia)
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
    return sum != null ? sum / 1000 : null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, alumiiniovet
  num? get recyclableAluminiumDoorTons {
    if (doorsRecyclable == true) {
      return aluminiumDoorTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, kierrätettävät alumiiniovet (kpl)
  num? get recyclableAluminiumDoorPieces {
    if (doorsRecyclable == true) {
      return Utils.sumOrNull([
        aluminiumDoor?.shutDoors,
        aluminiumDoor?.glassDoors,
      ]);
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, alumiini
  num? get aluminiumTons {
    if (doorsRecyclable == false) {
      return aluminiumDoorTons;
    }
    return null;
  }

  /// Alumiiniovi, lasia (tonnia)
  num? get aluminiumDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumDoor?.glassDoors,
      DoorsAndWindowsWeights.aluminiumDoorsWithGlassGlassKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, lasi
  num? get aluminiumDoorGlassTonsNotRecyclable {
    if (doorsRecyclable == false) {
      return aluminiumDoorGlassTons;
    }
    return null;
  }

  /// Teräsovi (tonnia)
  num? get steelDoorTons {
    num? sum = Utils.sumOrNull([
      Utils.multiplyOrNull(
          [steelDoor?.shutDoors, DoorsAndWindowsWeights.steelDoorsClosedKg]),
      Utils.multiplyOrNull([
        steelDoor?.glassDoors,
        DoorsAndWindowsWeights.steelDoorsGlass05sqmFrameKg
      ])
    ]);
    return sum != null ? sum / 1000 : null;
  }

  /// Materiaalimääärätaulukkoon luettava määrä, teräsovet
  num? get recyclableSteelDoorTons {
    if (doorsRecyclable == true) {
      return steelDoorTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, kierrätettävät teräsovet (kpl)
  num? get recyclableSteelDoorPieces {
    if (doorsRecyclable == true) {
      return Utils.sumOrNull([
        steelDoor?.shutDoors,
        steelDoor?.glassDoors,
      ]);
    }
    return null;
  }

  /// Teräsovi, lasia (tonnia)
  num? get steelDoorGlassTons {
    num? multiply = Utils.multiplyOrNull([
      steelDoor?.glassDoors,
      DoorsAndWindowsWeights.steelDoorsGlass05sqmGlassKg
    ]);
    return multiply != null ? multiply / 1000 : null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, lasi
  num? get steelDoorGlassTonsNotRecyclable {
    if (doorsRecyclable == false) {
      return steelDoorGlassTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava määrä, betoniteräkset, peltikatto ja muu teräsromu
  num? get steelTons {
    if (doorsRecyclable == true) {
      return steelDoorTons;
    }
    return null;
  }
}
