import 'package:freezed_annotation/freezed_annotation.dart';

part 'disposable_and_hazardous_demolition_or_processing_costs.freezed.dart';
part 'disposable_and_hazardous_demolition_or_processing_costs.g.dart';

@freezed
abstract class DisposableAndHazardousDemolitionOrProcessingCosts
    with _$DisposableAndHazardousDemolitionOrProcessingCosts {
  DisposableAndHazardousDemolitionOrProcessingCosts._();

  factory DisposableAndHazardousDemolitionOrProcessingCosts(
          {@Default(15)
          num?
              ceramicTilePorcelainAndGlassAndInsulationWoolDemolitionOrProcessingCosts,
          @Default(15) num? nonRecyclableBrickWasteDemolitionOrProcessingCosts,
          @Default(15) num? nonRecyclablePlasterBoardDemolitionOrProcessingCosts,
          @Default(20) num? contaminatedSoilDemolitionOrProcessingCosts,
          @Default(20) num? concreteContainingAsbestosDemolitionOrProcessingCosts,
          @Default(20)
          num? mineriteOrFeltContainingAsbestosDemolitionOrProcessingCosts,
          @Default(20)
          num? concreteContainingPcbPaintingDemolitionOrProcessingCosts}) =
      _DisposableAndHazardousDemolitionOrProcessingCosts;

  factory DisposableAndHazardousDemolitionOrProcessingCosts.fromJson(
          Map<String, dynamic> json) =>
      _$DisposableAndHazardousDemolitionOrProcessingCostsFromJson(json);
}
