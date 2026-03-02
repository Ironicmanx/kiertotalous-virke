import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'windows.freezed.dart';
part 'windows.g.dart';

/// Ikkunat
@freezed
abstract class Windows with _$Windows {
  const Windows._();

  const factory Windows(
      {num? windowsPcs,
      num? windowsArea,
      num? glassWallArea,
      @Default(false) bool areWindowsRecyclable}) = _Windows;

  factory Windows.fromJson(Map<String, dynamic> json) =>
      _$WindowsFromJson(json);

  num? get totalGlassArea {
    if (Utils.anyNull([windowsPcs, windowsArea])) {
      return null;
    }
    return windowsPcs! * windowsArea!;
  }

  num? get totalWoodenVolume {
    if (totalGlassArea == null) {
      return null;
    }
    return totalGlassArea! *
        (WindowWeights.lowerFramePaintedKgPerSqm +
            WindowWeights.frame175mmKgPerSqm) /
        WindowWeights.lowerFramePaintedKgPerCbm;
  }

  num? get totalGlassVolume {
    if (Utils.allNull([totalGlassArea, glassWallArea])) {
      return null;
    }
    return Utils.sumOrNull([totalGlassArea, glassWallArea])! *
        WindowWeights.threeTimesClosedGlassKgPerSqm /
        WindowWeights.threeTimesClosedGlassKgPerCbm;
  }

  num? get totalWoodTons {
    if (totalGlassArea == null) {
      return null;
    }
    return totalGlassArea! *
        (WindowWeights.lowerFramePaintedKgPerSqm +
            WindowWeights.frame175mmKgPerSqm) /
        1000;
  }

  num? get totalAluminiumTons {
    if (totalGlassArea == null) {
      return null;
    }
    return totalGlassArea! * WindowWeights.outerListsAluminiumKgPerSqm / 1000;
  }

  num? get totalGlassTons {
    if (Utils.allNull([totalGlassArea, glassWallArea])) {
      return null;
    }
    return Utils.sumOrNull([totalGlassArea, glassWallArea])! *
        WindowWeights.threeTimesClosedGlassKgPerSqm /
        1000;
  }
}
