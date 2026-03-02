import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/wood_glass_plastics_bloc.dart';
import 'total_wood_glass_plastics_event.dart';

class TotalWoodGlassPlasticsBloc
    extends Bloc<TotalWoodGlassPlasticsEvent, TotalWoodGlassPlastics> {
  final WoodGlassPlasticsBloc woodGlassPlasticsBloc;
  final TotalDemolitionWasteAndCostsBloc totalDemolitionWasteAndCostsBloc;

  TotalWoodGlassPlasticsBloc({
    required this.woodGlassPlasticsBloc,
    required this.totalDemolitionWasteAndCostsBloc,
  }) : super(TotalWoodGlassPlastics()) {
    on<WoodGlassPlasticsChanged>((event, emit) {
      emit(state.copyWith(
        woodGlassPlastics: event.woodGlassPlastics,
      ));
    });

    on<TotalDemolitionWasteAndCostsChanged>((event, emit) {
      emit(state.copyWith(
        totalDemolitionWasteAndCosts: event.totalDemolitionWasteAndCosts,
      ));
    });

    // Listen to changes in the woodGlassPlasticsBloc
    woodGlassPlasticsBloc.stream.listen((state) {
      add(WoodGlassPlasticsChanged(state));
    });

    // Listen to changes in the totalDemolitionWasteAndCostsBloc
    totalDemolitionWasteAndCostsBloc.stream.listen((state) {
      add(TotalDemolitionWasteAndCostsChanged(state));
    });
  }
}
