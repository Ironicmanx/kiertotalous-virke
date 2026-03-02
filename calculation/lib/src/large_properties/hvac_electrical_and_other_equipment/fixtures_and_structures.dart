import 'package:freezed_annotation/freezed_annotation.dart';

import 'fixtures_or_structures/exports.dart';

part 'fixtures_and_structures.freezed.dart';
part 'fixtures_and_structures.g.dart';

/// 14. RAKENNUKSEEN LIITTYVÄT KIINTOKALUSTEET JA RAKENTEET
@freezed
abstract class FixturesAndStructures with _$FixturesAndStructures {
  const factory FixturesAndStructures(
      {RainGuttersAndDownspouts? rainGuttersAndDownSpouts,
      FireLaddersAndWalkways? fireLaddersAndWalkways,
      AluminiumChainLinkFences? aluminiumChainLinkFences,
      SteelChainLinkFences? steelChainLinkFences,
      @Default(false) bool fixturesRecyclable}) = _FixturesAndStructures;

  factory FixturesAndStructures.fromJson(Map<String, dynamic> json) =>
      _$FixturesAndStructuresFromJson(json);
}
