import 'package:freezed_annotation/freezed_annotation.dart';

part 'demolition_waste_and_costs.freezed.dart';
part 'demolition_waste_and_costs.g.dart';

/// Purkujätteet ja kustannukset
@freezed
abstract class DemolitionWasteAndCosts with _$DemolitionWasteAndCosts {
  DemolitionWasteAndCosts._();

  factory DemolitionWasteAndCosts({num? demolitionCostPerTon}) =
      _DemolitionWasteAndCosts;

  factory DemolitionWasteAndCosts.fromJson(Map<String, dynamic> json) =>
      _$DemolitionWasteAndCostsFromJson(json);
}
