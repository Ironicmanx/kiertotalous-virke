import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_disposal_materials_and_hazardous_waste_event.dart';

class DisposalMaterialsAndHazardousWasteBloc extends Bloc<
    DisposalMaterialsAndHazardousWasteEvent,
    DisposalMaterialsAndHazardousWaste> {
  DisposalMaterialsAndHazardousWasteBloc()
      : super(DisposalMaterialsAndHazardousWaste()) {
    on<NonRecyclableBrickWasteDemolitionOrProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          nonRecyclableBrickWasteDemolitionOrProcessingCost: event.value,
        ),
      );
      logger.d(
          'nonRecyclableBrickWasteDemolitionOrProcessingCost changed to ${event.value}');
    });
    on<ContaminatedSoilDemolitionOrProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          contaminatedSoilDemolitionOrProcessingCost: event.value,
        ),
      );
      logger.d(
          'contaminatedSoilDemolitionOrProcessingCost changed to ${event.value}');
    });
    on<AsbestosOrBCPConcreteDemolitionOrProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          asbestosOrBCPConcreteDemolitionOrProcessingCost: event.value,
        ),
      );
      logger.d(
          'asbestosOrBCPConcreteDemolitionOrProcessingCost changed to ${event.value}');
    });
    on<BitumenDemolitionOrProcessingCostChanged>((event, emit) {
      emit(
        state.copyWith(
          bitumenDemolitionOrProcessingCost: event.value,
        ),
      );
      logger.d('bitumenDemolitionOrProcessingCost changed to ${event.value}');
    });
    on<OtherAsbestosContainingMaterialDemolitionOrProcessingCostChanged>(
        (event, emit) {
      emit(
        state.copyWith(
          otherAsbestosContainingMaterialDemolitionOrProcessingCost:
              event.value,
        ),
      );
      logger.d(
          'otherAsbestosContainingMaterialDemolitionOrProcessingCost changed to ${event.value}');
    });
  }
}
