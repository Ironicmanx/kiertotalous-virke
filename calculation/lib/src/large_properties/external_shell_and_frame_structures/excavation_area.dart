import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'excavation_area.freezed.dart';
part 'excavation_area.g.dart';

@freezed
abstract class ExcavationArea with _$ExcavationArea {
  const ExcavationArea._();

  const factory ExcavationArea(
      {num? areaToRemoveSize,
      num? areaToRemoveDepth,
      num? asphaltArea,
      @Default(100) num cleanSoilPortionPercentage}) = _ExcavationArea;

  factory ExcavationArea.fromJson(Map<String, dynamic> json) =>
      _$ExcavationAreaFromJson(json);

  num? get volumeToRemove {
    if (areaToRemoveSize == null || areaToRemoveDepth == null) {
      return null;
    }

    return areaToRemoveSize! * areaToRemoveDepth!;
  }

  num? get contaminatedSoil {
    if (volumeToRemove == null) {
      return null;
    }

    return (1 - Utils.percentageToFraction(cleanSoilPortionPercentage)!) *
        volumeToRemove!;
  }

  num? get cleanLandTons {
    if (volumeToRemove == null) {
      return null;
    }

    return volumeToRemove! *
        Utils.percentageToFraction(cleanSoilPortionPercentage)! *
        YardStructureWeights.soilToRemoveDensityKgPerCbm /
        1000;
  }

  num? get contaminatedLandTons {
    if (volumeToRemove == null) {
      return null;
    }

    return (1 - Utils.percentageToFraction(cleanSoilPortionPercentage)!) *
        volumeToRemove! *
        YardStructureWeights.soilToRemoveDensityKgPerCbm;
  }

  num? get asphaltTons {
    if (asphaltArea == null) {
      return null;
    }

    return asphaltArea! * YardStructureWeights.asphaltWeightKgPerSqm / 1000;
  }

  num? get asphaltVolume {
    if (asphaltArea == null) {
      return null;
    }

    return asphaltArea! *
        YardStructureWeights.asphaltWeightKgPerSqm /
        YardStructureWeights.asphaltDensityKgPerCbm;
  }
}
