import 'package:freezed_annotation/freezed_annotation.dart';

import 'fixtures_or_structures.dart';

part 'steel_chain_link_fences.freezed.dart';
part 'steel_chain_link_fences.g.dart';

/// Panssariverkko aita, alumiini korkeus 2 m
@freezed
abstract class SteelChainLinkFences extends FixturesOrStructures
    with _$SteelChainLinkFences {
  const SteelChainLinkFences._();

  const factory SteelChainLinkFences({num? meters, num? weightKgPerMeter}) =
      _SteelChainLinkFences;

  factory SteelChainLinkFences.fromJson(Map<String, dynamic> json) =>
      _$SteelChainLinkFencesFromJson(json);

  @override
  num get defaultWeightKgPerMeter => 5;
}
