import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';

part 'floor_structure.freezed.dart';
part 'floor_structure.g.dart';

@freezed
abstract class FloorStructure with _$FloorStructure {
  const FloorStructure._();

  const factory FloorStructure(
      {num? totalArea,
      num? chipBoardMidsolePortionPercentage,
      num? gypsumBoardingMidsolePortionPercentage,
      num? solidBoardingMidsolePortionPercentage,
      num? floorPanelFloorPortionPercentage,
      num? plasticCarpetOrPlasticTileFloorPortionPercentage,
      num? parquetFloorPortionPercentage,
      num? ceramicTileFloorPortionPercentage}) = _FloorStructure;

  factory FloorStructure.fromJson(Map<String, dynamic> json) =>
      _$FloorStructureFromJson(json);

  num? get midsolePortionPercentageTotal => Utils.sumOrNull([
        chipBoardMidsolePortionPercentage,
        gypsumBoardingMidsolePortionPercentage,
        solidBoardingMidsolePortionPercentage
      ]);

  num? get floorPortionPercentageTotal => Utils.sumOrNull([
        floorPanelFloorPortionPercentage,
        plasticCarpetOrPlasticTileFloorPortionPercentage,
        parquetFloorPortionPercentage,
        ceramicTileFloorPortionPercentage
      ]);

  num? get chipBoardMidsoleArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(chipBoardMidsolePortionPercentage)
      ]);

  num? get gypsumBoardingMidsoleArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(gypsumBoardingMidsolePortionPercentage)
      ]);

  num? get solidBoardingMidsoleArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(solidBoardingMidsolePortionPercentage)
      ]);

  num? get floorPanelFloorArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(floorPanelFloorPortionPercentage)
      ]);

  num? get plasticCarpetOrPlasticTileFloorArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(
            plasticCarpetOrPlasticTileFloorPortionPercentage)
      ]);

  num? get parquetFloorArea => Utils.multiplyOrNull(
      [totalArea, Utils.percentageToFraction(parquetFloorPortionPercentage)]);

  num? get ceramicTileFloorArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(ceramicTileFloorPortionPercentage)
      ]);
}
