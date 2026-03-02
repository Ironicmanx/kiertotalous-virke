import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/soil_aggregates_dredging_materials_bloc.dart';
import 'total_soil_aggregates_dredging_materials_event.dart';

class TotalSoilAggregatesDredgingMaterialsBloc extends Bloc<
    TotalSoilAggregatesDredgingMaterialsEvent,
    TotalSoilAggregatesDredgingMaterials> {
  final SoilAggregatesDredgingMaterialsBloc soilAggregatesDredgingMaterialsBloc;
  final TotalDemolitionWasteAndCostsBloc totalDemolitionWasteAndCostsBloc;

  TotalSoilAggregatesDredgingMaterialsBloc({
    required this.soilAggregatesDredgingMaterialsBloc,
    required this.totalDemolitionWasteAndCostsBloc,
  }) : super(TotalSoilAggregatesDredgingMaterials()) {
    on<SoilAggregatesDredgingMaterialsChanged>((event, emit) {
      emit(state.copyWith(
        soilAggregatesDredgingMaterials: event.soilAggregatesDredgingMaterials,
      ));
    });

    on<TotalDemolitionWasteAndCostsChanged>((event, emit) {
      emit(state.copyWith(
        totalDemolitionWasteAndCosts: event.totalDemolitionWasteAndCosts,
      ));
    });

    // Listen to changes in the soilAggregatesDredgingMaterialsBloc
    soilAggregatesDredgingMaterialsBloc.stream.listen((state) {
      add(SoilAggregatesDredgingMaterialsChanged(state));
    });

    // Listen to changes in the totalDemolitionWasteAndCostsBloc
    totalDemolitionWasteAndCostsBloc.stream.listen((state) {
      add(TotalDemolitionWasteAndCostsChanged(state));
    });
  }
}
