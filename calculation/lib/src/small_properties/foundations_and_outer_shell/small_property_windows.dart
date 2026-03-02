import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'small_property_windows.freezed.dart';
part 'small_property_windows.g.dart';

/// Ikkunat
/// Sisältää tiedot kaikkien ikkunoiden kappalemääristä ja materiaalimääristä yhteensä
@freezed
abstract class SmallPropertyWindows with _$SmallPropertyWindows {
  const SmallPropertyWindows._();

  const factory SmallPropertyWindows({
    num? woodenFramePcs,
    num? steelPcs,
    num? aluminiumPcs,
    @Default(false) bool areWindowsRecyclable,
  }) = _SmallPropertyWindows;

  factory SmallPropertyWindows.fromJson(Map<String, dynamic> json) =>
      _$SmallPropertyWindowsFromJson(json);

  num? get woodenFrameWindowWoodTons {
    num? multiply = Utils.multiplyOrNull([
      woodenFramePcs,
      DoorsAndWindowsWeights.woodenWindows140x140glass2x1_5sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimääärätaulukkoon luettava määrä, puuikkunat
  num? get recyclableWoodenFrameWindowTons {
    if (areWindowsRecyclable == true) {
      return woodenFrameWindowWoodTons;
    }
    return null;
  }

  num? get woodenFrameWindowGlassTons {
    num? multiply = Utils.multiplyOrNull([
      woodenFramePcs,
      DoorsAndWindowsWeights.woodenWindows140x140glass2x1_5sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get steelWindowSteelTons {
    num? multiply = Utils.multiplyOrNull([
      steelPcs,
      DoorsAndWindowsWeights.steelFramedWindows140x140glass2x1_5sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimääärätaulukkoon luettava määrä, teräsikkunat
  num? get recyclableSteelWindowTons {
    if (areWindowsRecyclable == true) {
      return steelWindowSteelTons;
    }
    return null;
  }

  num? get steelWindowGlassTons {
    num? multiply = Utils.multiplyOrNull([
      steelPcs,
      DoorsAndWindowsWeights.steelFramedWindows140x140glass2x1_5sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  num? get aluminiumWindowAluminiumTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumPcs,
      DoorsAndWindowsWeights.aluminiumFramedWindows140x140glass2x1_5sqmFrameKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimääärätaulukkoon luettava määrä, alumiini-ikkunat
  num? get recyclableAluminiumWindowTons {
    if (areWindowsRecyclable == true) {
      return aluminiumWindowAluminiumTons;
    }
    return null;
  }

  num? get aluminiumWindowGlassTons {
    num? multiply = Utils.multiplyOrNull([
      aluminiumPcs,
      DoorsAndWindowsWeights.aluminiumFramedWindows140x140glass2x1_5sqmGlassKg
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Next parts are form Laskenta tab, ikkunat

  /// Kierrätettävät ikkunat, puuta (tonnia)
  num? get recyclableWindowsWoodTons {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return woodenFrameWindowWoodTons;
  }

  /// Kierrätettävät ikkunat, puuta (kpl)
  num? get recyclableWoodWindowsPieces {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return woodenFramePcs;
  }

  /// Ikkunat, puuta, romut ja poltettavat (tonnia)
  num? get woodenWindowsScrapAndBurnable {
    if (areWindowsRecyclable == true) {
      return 0;
    }
    return woodenFrameWindowWoodTons;
  }

  /// Kierrätettävät ikkunat, terästä (tonnia)
  num? get recyclableSteelWindowsTons {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return steelWindowSteelTons;
  }

  /// Kierrätettävät ikkunat, terästä (kpl)
  num? get recyclableSteelWindowsPieces {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return steelPcs;
  }

  /// Ikkunat, terästä, romut ja poltettavat (tonnia)
  num? get steelWindowsScrapAndBurnable {
    if (areWindowsRecyclable == true) {
      return 0;
    }
    return steelWindowSteelTons;
  }

  /// Kierrätettävät ikkunat, alumiinia (tonnia)
  num? get recyclableAluminiumWindowsTons {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return aluminiumWindowAluminiumTons;
  }

  /// Kierrätettävät ikkunat, alumiinia (kpl)
  num? get recyclableAluminiumWindowsPieces {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return aluminiumPcs;
  }

  /// Ikkunat, alumiinia, romut ja poltettavat (tonnia)
  num? get aluminiumWindowsScrapAndBurnable {
    if (areWindowsRecyclable == true) {
      return 0;
    }
    return aluminiumWindowAluminiumTons;
  }

  /// Kierrätettävien ikkunoiden lasiosuus, tonnia
  num? get recyclableWindowsGlassTons {
    if (areWindowsRecyclable == true) {
      return null;
    }
    return Utils.sumOrNull([
      woodenFrameWindowGlassTons,
      steelWindowGlassTons,
      aluminiumWindowGlassTons
    ]);
  }

  /// Ikkunoiden lasiosuus, romut ja poltettavat
  num? get windowsGlassScrapAndBurnable {
    if (areWindowsRecyclable == false) {
      return null;
    }
    return Utils.sumOrNull([
      woodenFrameWindowGlassTons,
      steelWindowGlassTons,
      aluminiumWindowGlassTons
    ]);
  }
}
