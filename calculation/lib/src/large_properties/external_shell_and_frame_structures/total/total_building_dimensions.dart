import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import '../building_dimensions.dart';
import '../building_frame.dart';
import '../exports.dart';

part 'total_building_dimensions.freezed.dart';

@freezed
abstract class TotalBuildingDimensions with _$TotalBuildingDimensions {
  const TotalBuildingDimensions._();

  const factory TotalBuildingDimensions(
      {BuildingDimensions? buildingDimensions,
      Cellar? cellar,
      Foundations? foundations,
      BuildingFrame? buildingFrame}) = _TotalBuildingDimensions;

  num? get grossFloorArea => buildingDimensions?.grossFloorArea;

  num? get volume => buildingDimensions?.volume;

  int? get floorCountExcludingBasements =>
      buildingDimensions?.floorCountExcludingCellars;

  num? get averageArea => buildingDimensions?.averageArea;

  num? get grossFloorAreaExcludingCellars {
    num grossArea;

    if (grossFloorArea != null) {
      grossArea = grossFloorArea!;
    } else if (floorCountExcludingBasements != null && averageArea != null) {
      grossArea = floorCountExcludingBasements! * averageArea!;
    } else {
      return null;
    }

    return grossArea - (cellar?.floorArea ?? 0);
  }

  num? get calculatedGrossFloorArea {
    if (grossFloorArea == null) {
      if (grossFloorAreaExcludingCellars == null && cellar?.floorArea == null) {
        return null;
      }

      return grossFloorAreaExcludingCellars ?? 0 + (cellar?.floorArea ?? 0);
    }

    return grossFloorArea;
  }

  num? get calculatedVolume {
    if (volume != null) {
      return volume;
    }

    if (cellar?.floorArea == null &&
        cellar?.wallHeight == null &&
        foundations?.area == null &&
        buildingFrame?.externalWallsAverageHeight == null) {
      return null;
    }

    return ((foundations?.area ?? 0) *
            (buildingFrame?.externalWallsAverageHeight ?? 0)) +
        ((cellar?.floorArea ?? 0) * (cellar?.wallHeight ?? 0));
  }

  num? get calculatedAreaPerFloor {
    final grossFloorArea = grossFloorAreaExcludingCellars;

    if (grossFloorArea == null || floorCountExcludingBasements == null) {
      return null;
    }

    return grossFloorArea / floorCountExcludingBasements!;
  }
}
