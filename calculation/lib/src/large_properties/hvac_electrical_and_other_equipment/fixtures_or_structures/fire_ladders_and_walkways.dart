import 'package:freezed_annotation/freezed_annotation.dart';

import 'fixtures_or_structures.dart';

part 'fire_ladders_and_walkways.freezed.dart';
part 'fire_ladders_and_walkways.g.dart';

/// Palotikkaat ja kulkusillat
@freezed
abstract class FireLaddersAndWalkways extends FixturesOrStructures
    with _$FireLaddersAndWalkways {
  const FireLaddersAndWalkways._();

  const factory FireLaddersAndWalkways({num? meters, num? weightKgPerMeter}) =
      _FireLaddersAndWalkways;

  factory FireLaddersAndWalkways.fromJson(Map<String, dynamic> json) =>
      _$FireLaddersAndWalkwaysFromJson(json);

  @override
  num get defaultWeightKgPerMeter => 10;
}
