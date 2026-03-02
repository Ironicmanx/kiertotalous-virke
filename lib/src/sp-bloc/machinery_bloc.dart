import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'machinery_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class SPMachineryBloc
    extends Bloc<SPMachineryEvent, MachineryEquipmentAndFixedStructures> {
  SPMachineryBloc() : super(MachineryEquipmentAndFixedStructures()) {
    on<SPAreElectricMotorsRecyclableChanged>((event, emit) {
      emit(state.copyWith(areElectricMotorsRecyclable: event.value));
      logger.d("SPAreElectricMotorsRecyclableChanged: ${event.value}");
    });

    on<SPAreVentilationMachinesRecyclableChanged>((event, emit) {
      emit(state.copyWith(areVentilationMachinesRecyclable: event.value));
      logger.d("SPAreVentilationMachinesRecyclableChanged: ${event.value}");
    });

    on<SPElectricMotorsChanged>((event, emit) {
      emit(state.copyWith(electricMotors: event.value));
      logger.d("SPElectricMotorsChanged: ${event.value}");
    });

    on<SPVentilationMachinesChanged>((event, emit) {
      emit(state.copyWith(ventilationMachines: event.value));
      logger.d("SPVentilationMachinesChanged: ${event.value}");
    });

    on<SPElectricalDistributionMachinesAndMetersChanged>((event, emit) {
      emit(
          state.copyWith(electricalDistributionMachinesAndMeters: event.value));
      logger.d(
          "SPElectricalDistributionMachinesAndMetersChanged: ${event.value}");
    });

    on<SPWaterCirculationRadiatorsChanged>((event, emit) {
      emit(state.copyWith(waterCirculationRadiators: event.value));
      logger.d("SPWaterCirculationRadiatorsChanged: ${event.value}");
    });

    on<SPAreConcreteYardTilesAndWallStonesRecyclableChanged>((event, emit) {
      emit(state.copyWith(
          areConcreteYardTilesAndWallStonesRecyclable: event.value));
      logger.d(
          "SPAreConcreteYardTilesAndWallStonesRecyclableChanged: ${event.value}");
    });

    on<SPFencesBetweenApartmentsChanged>((event, emit) {
      emit(state.copyWith(
        fencesBetweenApartments: event.value,
      ));
      logger.d("SPFencesBetweenApartmentsChanged: ${event.value}");
    });

    on<SPConcreteYardTilesAndStonesInSquareMetersChanged>((event, emit) {
      emit(state.copyWith(
          concreteYardTilesAndStonesInSquareMeters: event.value));
      logger.d(
          "SPConcreteYardTilesAndStonesInSquareMetersChanged: ${event.value}");
    });

    on<SPFencesBetweenApartmentsInMetersChanged>((event, emit) {
      emit(state.copyWith(fencesBetweenApartmentsInMeters: event.value));
      logger.d("SPFencesBetweenApartmentsInMetersChanged: ${event.value}");
    });
  }
}
