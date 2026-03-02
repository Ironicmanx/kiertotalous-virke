import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../..//utils/utils.dart';

part 'small_properties_excavation_area.freezed.dart';
part 'small_properties_excavation_area.g.dart';

/// Poistettavat maa-ainekset, poistettava alue ja määrä
@freezed
abstract class SmallPropertiesExcavationArea
    with _$SmallPropertiesExcavationArea {
  SmallPropertiesExcavationArea._();

  factory SmallPropertiesExcavationArea(
          {num? areOfTheRemovableSoil,
          num? depthInMeters,
          num? asphaltAreaInSquareMeters,
          @Default(100) num removableCleanSoilInPercents}) =
      _SmallPropertiesExcavationArea;

  factory SmallPropertiesExcavationArea.fromJson(Map<String, dynamic> json) =>
      _$SmallPropertiesExcavationAreaFromJson(json);

  /// Poistettava määrä (m3)
  num? get soilToBeRemovedVolume =>
      Utils.multiplyOrNull([areOfTheRemovableSoil, depthInMeters]);

  /// Poistettava maa (yhteensä, tonnia)
  num? get soilToBeRemovedTons {
    num? multiply = Utils.multiplyOrNull(
        [soilToBeRemovedVolume, FoundationWeights.removableSoilKgPerCbm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }

  /// Poistettavasta maasta saastunutta (%)
  num? get contaminatedSoil {
    final cleanSoilFraction =
        Utils.percentageToFraction(removableCleanSoilInPercents);
    if (cleanSoilFraction == null) {
      return null;
    }

    return (1 - cleanSoilFraction) * 100;
  }

  // Asfaltti (tonnia)
  num? get asphaltTons {
    num? multiply = Utils.multiplyOrNull(
        [asphaltAreaInSquareMeters, FoundationWeights.asphaltKgPerSqm]);
    if (multiply == 0) {
      return 0;
    }
    return multiply! / 1000;
  }
}
