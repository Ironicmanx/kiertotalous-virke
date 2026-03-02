import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'thermal_center_event.dart';

class ThermalCenterBloc extends Bloc<ThermalCenterEvent, ThermalCenter> {
  ThermalCenterBloc() : super(ThermalCenter()) {
    on<OnDistrictOrDirectHeatingChanged>((event, emit) {
      emit(state.copyWith(onDisctrictOrDirectHeating: event.value));
    });

    on<ConcreteLengthChanged>((event, emit) {
      emit(state.copyWith(concreteLengthInMeters: event.value));
    });

    on<ConcreteWidthChanged>((event, emit) {
      emit(state.copyWith(concreteWidthInMeters: event.value));
    });

    on<PlinthHeightChanged>((event, emit) {
      emit(state.copyWith(plinthHeightInMeters: event.value));
    });

    on<WallHeightChanged>((event, emit) {
      emit(state.copyWith(wallHeightInMeters: event.value));
    });

    on<GarageWallMaterialChanged>((event, emit) {
      emit(state.copyWith(garageWallMaterial: event.value));
    });

    on<RoofTypeChanged>((event, emit) {
      emit(state.copyWith(roofType: event.value));
    });

    on<WaterRoofTypeChanged>((event, emit) {
      emit(state.copyWith(waterRoofType: event.value));
    });

    on<RoofLengthChanged>((event, emit) {
      emit(state.copyWith(roofLengthInMeters: event.value));
    });

    on<RoofFlatChanged>((event, emit) {
      emit(state.copyWith(roofFlatInMeters: event.value));
    });

    on<AreRecyclableChanged>((event, emit) {
      emit(state.copyWith(areRecyclable: event.value));
    });

    on<HeatingTypeChanged>((event, emit) {
      emit(state.copyWith(heatingType: event.value));
    });

    on<PowerChanged>((event, emit) {
      emit(state.copyWith(powerInKiloWatts: event.value));
    });

    on<HeatingMachinesChanged>((event, emit) {
      emit(state.copyWith(heatingMachinesPcs: event.value));
    });

    on<WaterHeatersChanged>((event, emit) {
      emit(state.copyWith(waterHeatersPcs: event.value));
    });

    on<CarportOrGarageChanged>((event, emit) {
      emit(state.copyWith(carportOrGarage: event.value));
    });
  }
}
