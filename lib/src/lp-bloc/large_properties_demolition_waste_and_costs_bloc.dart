import 'package:flutter_app/src/lp-bloc/large_properties_demolition_waste_and_costs_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class DemolitionWasteAndCostsBloc
    extends Bloc<DemolitionWasteAndCostsEvent, DemolitionWasteAndCosts> {
  DemolitionWasteAndCostsBloc() : super(DemolitionWasteAndCosts()) {
    on<DemolitionCostPerTonChanged>((event, emit) {
      emit(state.copyWith(demolitionCostPerTon: event.value));
      logger.d('demolitionCostPerTon changed to ${event.value}');
    });
  }
}
