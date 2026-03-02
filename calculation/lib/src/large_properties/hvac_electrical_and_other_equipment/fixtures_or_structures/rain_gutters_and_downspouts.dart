import 'package:freezed_annotation/freezed_annotation.dart';

import 'fixtures_or_structures.dart';

part 'rain_gutters_and_downspouts.freezed.dart';
part 'rain_gutters_and_downspouts.g.dart';

/// Sadevesikourut ja rännit
@freezed
abstract class RainGuttersAndDownspouts extends FixturesOrStructures
    with _$RainGuttersAndDownspouts {
  const RainGuttersAndDownspouts._();

  const factory RainGuttersAndDownspouts({num? meters, num? weightKgPerMeter}) =
      _RainGuttersAndDownspouts;

  factory RainGuttersAndDownspouts.fromJson(Map<String, dynamic> json) =>
      _$RainGuttersAndDownspoutsFromJson(json);

  @override
  num get defaultWeightKgPerMeter => 2;
}
