import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'yard_roof_event.dart';

class YardRoofBloc extends Bloc<YardRoofEvent, YardRoof> {
  YardRoofBloc() : super(YardRoof(carportOrGarage: CarportOrGarage())) {
    on<RoofTypeChanged>((event, emit) {
      emit(state.copyWith(roofType: event.value));
    });

    on<WaterRoofTypeChanged>((event, emit) {
      emit(state.copyWith(waterRoofType: event.value));
    });

    on<LapelLengthChanged>((event, emit) {
      emit(state.copyWith(lapelLengthInMeters: event.value));
    });

    on<LapelWidthChanged>((event, emit) {
      emit(state.copyWith(lapelWidthInMeters: event.value));
    });

    on<CarportOrGarageChanged>((event, emit) {
      emit(state.copyWith(carportOrGarage: event.value));
    });
  }
}
