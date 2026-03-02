import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bl_demolition_materials/src/large_properties/partition_walls_doors_and_windows/exports.dart';
import '../../utils/utils.dart';

part 'total_room_space.freezed.dart';

@freezed
abstract class TotalRoomSpace with _$TotalRoomSpace {
  const TotalRoomSpace._();

  const factory TotalRoomSpace(
      {InternalWallFramesAndSurfaceMaterial?
          internalWallFramesAndSurfaceMaterial,
      RoomSpace? roomSpace}) = _TotalRoomSpace;

  /// Tilan seinäpinta-ala yhteensä (neliömetrit)
  num? get totalWallArea {
    return Utils.multiplyOrNull([
      roomSpace?.totalWallLength,
      internalWallFramesAndSurfaceMaterial?.averageWallHeight
    ]);
  }

  /// Tilan osuus seinienkokonaispinta-alasta %
  num? get totalWallAreaPortionPercentage {
    if (Utils.anyNull(
        [totalWallArea, internalWallFramesAndSurfaceMaterial?.totalArea])) {
      return null;
    }
    return totalWallArea! / internalWallFramesAndSurfaceMaterial!.totalArea!;
  }

  num? get chipboardArea => Utils.multiplyOrNull(
      [roomSpace?.chipboardPortionPercentage, totalWallArea]);

  num? get cybrocArea =>
      Utils.multiplyOrNull([roomSpace?.cybrocPortionPercentage, totalWallArea]);

  num? get boardPanelArea => Utils.multiplyOrNull(
      [roomSpace?.boardPanelPortionPercentage, totalWallArea]);

  num? get ceramicTileWallsArea => Utils.multiplyOrNull(
      [roomSpace?.ceramicTileWallsPortionPercentage, totalWallArea]);

  num? get paintedPlasteredBrickWallArea => Utils.multiplyOrNull(
      [roomSpace?.paintedPlasteredBrickWallPortionPercentage, totalWallArea]);

  num? get plasticCarpetArea => Utils.multiplyOrNull(
      [roomSpace?.plasticCarpetPortionPercentage, totalWallArea]);
}
