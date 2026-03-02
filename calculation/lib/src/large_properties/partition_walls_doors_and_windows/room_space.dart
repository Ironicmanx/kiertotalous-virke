import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';

part 'room_space.freezed.dart';

part 'room_space.g.dart';

/// Toimisto, aula, luokka, asumis, yms. tavanomaiset huonetilat
/// Sisältää jokaiselle huoneelle olevat solut ja huoneen sisaiset laskettavat arvot
@freezed
abstract class RoomSpace with _$RoomSpace {
  const RoomSpace._();

  const factory RoomSpace({
    num? woodFramedWalls,
    num? brickWalls,
    num? concreteElementOrCastingWalls,
    num? chipboardPortionPercentage,
    num? cybrocPortionPercentage,
    num? boardPanelPortionPercentage,
    num? ceramicTileWallsPortionPercentage,
    num? paintedPlasteredBrickWallPortionPercentage,
    num? plasticCarpetPortionPercentage,
  }) = _RoomSpace;

  factory RoomSpace.fromJson(Map<String, dynamic> json) =>
      _$RoomSpaceFromJson(json);

  /// Tilan seinäpituus yhteensä (jm)
  num? get totalWallLength => Utils.sumOrNull(
      [woodFramedWalls, brickWalls, concreteElementOrCastingWalls]);

  /// Väliseinien rakenteet yhteensä
  num? get totalPartitionWallsStructuresPortionPercentage => Utils.sumOrNull([
        chipboardPortionPercentage,
        cybrocPortionPercentage,
        boardPanelPortionPercentage,
        ceramicTileWallsPortionPercentage,
        paintedPlasteredBrickWallPortionPercentage,
        plasticCarpetPortionPercentage
      ]);
}
