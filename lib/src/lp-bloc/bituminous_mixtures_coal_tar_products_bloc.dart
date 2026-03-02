import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'bituminous_mixtures_coal_tar_products_event.dart';

class BituminousMixturesCoalTarProductsBloc extends Bloc<
    BituminousMixturesCoalTarProductsEvent, BituminousMixturesCoalTarProducts> {
  BituminousMixturesCoalTarProductsBloc()
      : super(BituminousMixturesCoalTarProducts()) {
    on<CoalTarContainingBituminousMixturesNotesChanged>((event, emit) {
      emit(state.copyWith(
          coalTarContainingBituminousMixturesNotes: event.value));
    });
    on<OtherBituminousMixturesChanged>((event, emit) {
      emit(state.copyWith(otherBituminousMixtures: event.value));
    });
    on<UnnamedChanged>((event, emit) {
      emit(state.copyWith(unnamed: event.value));
    });
    on<CoalTarAndTarProductsChanged>((event, emit) {
      emit(state.copyWith(coalTarAndTarProducts: event.value));
    });

    on<OtherBituminousMixturesVolumeChanged>((event, emit) {
      final current = state.otherBituminousMixtures ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherBituminousMixtures: current.copyWith(volume: event.value),
      ));
    });

    on<OtherBituminousMixturesTonsChanged>((event, emit) {
      final current = state.otherBituminousMixtures ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherBituminousMixtures: current.copyWith(tons: event.value),
      ));
    });

    on<OtherBituminousMixturesNotesChanged>((event, emit) {
      final current = state.otherBituminousMixtures ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherBituminousMixtures: current.copyWith(notes: event.value),
      ));
    });

    on<UnnamedVolumeChanged>((event, emit) {
      final current =
          state.unnamed ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        unnamed: current.copyWith(volume: event.value),
      ));
    });

    on<UnnamedTonsChanged>((event, emit) {
      final current =
          state.unnamed ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        unnamed: current.copyWith(tons: event.value),
      ));
    });

    on<UnnamedNotesChanged>((event, emit) {
      final current =
          state.unnamed ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        unnamed: current.copyWith(notes: event.value),
      ));
    });

    on<CoalTarAndTarProductsVolumeChanged>((event, emit) {
      final current = state.coalTarAndTarProducts ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        coalTarAndTarProducts: current.copyWith(volume: event.value),
      ));
    });

    on<CoalTarAndTarProductsTonsChanged>((event, emit) {
      final current = state.coalTarAndTarProducts ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        coalTarAndTarProducts: current.copyWith(tons: event.value),
      ));
    });

    on<CoalTarAndTarProductsNotesChanged>((event, emit) {
      final current = state.coalTarAndTarProducts ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        coalTarAndTarProducts: current.copyWith(notes: event.value),
      ));
    });
  }
}
