import 'package:freezed_annotation/freezed_annotation.dart';

import 'exports.dart';

part 'concrete_bricks_tiles_ceramics.freezed.dart';
part 'concrete_bricks_tiles_ceramics.g.dart';

/// betoni, tiilet, laatat ja keramiikka
@freezed
abstract class ConcreteBricksTilesCeramics with _$ConcreteBricksTilesCeramics {
  ConcreteBricksTilesCeramics._();

  factory ConcreteBricksTilesCeramics(
          {String? concreteNotes,
          String? brickNotes,
          String? ceramicTilesNotes,
          String? hazardousConcreteBrickTileCeramicMixturesNotes,
          WasteLawDemolitionMaterialEstimateEntry? otherMaterials}) =
      _ConcreteBricksTilesCeramics;

  factory ConcreteBricksTilesCeramics.fromJson(Map<String, dynamic> json) =>
      _$ConcreteBricksTilesCeramicsFromJson(json);
}
