import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/other_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'total_other_materials_event.dart';

class TotalOtherMaterialsBloc
    extends Bloc<TotalOtherMaterialsEvent, TotalOtherMaterials> {
  final OtherMaterialsBloc otherMaterialsBloc;
  final TotalDemolitionWasteAndCostsBloc totalDemolitionWasteAndCostsBloc;

  TotalOtherMaterialsBloc({
    required this.otherMaterialsBloc,
    required this.totalDemolitionWasteAndCostsBloc,
  }) : super(TotalOtherMaterials()) {
    on<OtherMaterialsChanged>((event, emit) {
      emit(state.copyWith(
        otherMaterials: event.otherMaterials,
      ));
    });

    on<TotalDemolitionWasteAndCostsChanged>((event, emit) {
      emit(state.copyWith(
        totalDemolitionWasteAndCosts: event.totalDemolitionWasteAndCosts,
      ));
    });

    // Listen to changes in the otherMaterialsBloc
    otherMaterialsBloc.stream.listen((state) {
      add(OtherMaterialsChanged(state));
    });

    // Listen to changes in the totalDemolitionWasteAndCostsBloc
    totalDemolitionWasteAndCostsBloc.stream.listen((state) {
      add(TotalDemolitionWasteAndCostsChanged(state));
    });
  }
}
