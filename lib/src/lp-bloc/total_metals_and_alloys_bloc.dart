import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/metals_and_alloys_bloc.dart';
import 'total_metals_and_alloys_event.dart';

class TotalMetalsAndAlloysBloc
    extends Bloc<TotalMetalsAndAlloysEvent, TotalMetalsAndAlloys> {
  final MetalsAndAlloysBloc metalsAndAlloysBloc;
  final TotalDemolitionWasteAndCostsBloc totalDemolitionWasteAndCostsBloc;

  TotalMetalsAndAlloysBloc({
    required this.metalsAndAlloysBloc,
    required this.totalDemolitionWasteAndCostsBloc,
  }) : super(TotalMetalsAndAlloys()) {
    on<MetalsAndAlloysChanged>((event, emit) {
      emit(state.copyWith(
        metalAndAlloys: event.metalsAndAlloys,
      ));
    });

    on<TotalDemolitionWasteAndCostsChanged>((event, emit) {
      emit(state.copyWith(
        totalDemolitionWasteAndCosts: event.totalDemolitionWasteAndCosts,
      ));
    });

    // Listen to changes in the metalsAndAlloysBloc
    metalsAndAlloysBloc.stream.listen((state) {
      add(MetalsAndAlloysChanged(state));
    });

    // Listen to changes in the totalDemolitionWasteAndCostsBloc
    totalDemolitionWasteAndCostsBloc.stream.listen((state) {
      add(TotalDemolitionWasteAndCostsChanged(state));
    });
  }
}
