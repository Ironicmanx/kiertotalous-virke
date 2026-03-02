import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/hvac_and_electrical_installations_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HvacAndElectricalInstallationsBloc extends Bloc<
    HvacAndElectricalInstallationsEvent, HvacAndElectricalInstallations> {
  HvacAndElectricalInstallationsBloc()
      : super(HvacAndElectricalInstallations(
          copperWaterPipes: null,
          plasticWaterPipes: null,
          centralHeatingPipes: null,
          castIronSewagePipes: null,
          plasticSewagePipes: null,
          steelVentilationPipes300Dn: null,
          steelVentilationPipes500Dn: null,
          copperElectricalWires: null,
        )) {
    // Copper Water Pipes Meters & Weight
    on<CopperWaterPipesMetersChanged>((event, emit) {
      logger.d("CopperWaterPipesMetersChanged fired");
      emit(state.copyWith(
        copperWaterPipes: CopperWaterPipes(
          meters: event.value,
          weightKgPerMeter: state.copperWaterPipes?.weightKgPerMeter,
        ),
      ));
    });
    on<CopperWaterPipesWeightChanged>((event, emit) {
      logger.d("CopperWaterPipesWeightChanged fired");
      emit(state.copyWith(
        copperWaterPipes: CopperWaterPipes(
          weightKgPerMeter: event.value,
          meters: state.copperWaterPipes?.meters,
        ),
      ));
    });

    // Plastic Water Pipes Meters & Weight
    on<PlasticWaterPipesMetersChanged>((event, emit) {
      logger.d("PlasticWaterPipesMetersChanged fired");
      emit(state.copyWith(
        plasticWaterPipes: PlasticWaterPipes(
          meters: event.value,
          weightKgPerMeter: state.plasticWaterPipes?.weightKgPerMeter,
        ),
      ));
    });
    on<PlasticWaterPipesWeightChanged>((event, emit) {
      logger.d("PlasticWaterPipesWeightChanged fired");
      emit(state.copyWith(
        plasticWaterPipes: PlasticWaterPipes(
          weightKgPerMeter: event.value,
          meters: state.plasticWaterPipes?.meters,
        ),
      ));
    });

    // Central Heating Pipes Meters & Weight
    on<CentralHeatingPipesMetersChanged>((event, emit) {
      logger.d("CentralHeatingPipesMetersChanged fired");
      emit(state.copyWith(
        centralHeatingPipes: CentralHeatingPipes(
          meters: event.value,
          weightKgPerMeter: state.centralHeatingPipes?.weightKgPerMeter,
        ),
      ));
    });
    on<CentralHeatingPipesWeightChanged>((event, emit) {
      logger.d("CentralHeatingPipesWeightChanged fired");
      emit(state.copyWith(
        centralHeatingPipes: CentralHeatingPipes(
          weightKgPerMeter: event.value,
          meters: state.centralHeatingPipes?.meters,
        ),
      ));
    });

    // Cast Iron Sewage Pipes Meters & Weight
    on<CastIronSewagePipesMetersChanged>((event, emit) {
      logger.d("CastIronSewagePipesMetersChanged fired");
      emit(state.copyWith(
        castIronSewagePipes: CastIronSewagePipes(
          meters: event.value,
          weightKgPerMeter: state.castIronSewagePipes?.weightKgPerMeter,
        ),
      ));
    });
    on<CastIronSewagePipesWeightChanged>((event, emit) {
      logger.d("CastIronSewagePipesWeightChanged fired");
      emit(state.copyWith(
        castIronSewagePipes: CastIronSewagePipes(
          weightKgPerMeter: event.value,
          meters: state.castIronSewagePipes?.meters,
        ),
      ));
    });

    // Plastic Sewage Pipes Meters & Weight
    on<PlasticSewagePipesMetersChanged>((event, emit) {
      logger.d("PlasticSewagePipesMetersChanged fired");
      emit(state.copyWith(
        plasticSewagePipes: PlasticSewagePipes(
          meters: event.value,
          weightKgPerMeter: state.plasticSewagePipes?.weightKgPerMeter,
        ),
      ));
    });
    on<PlasticSewagePipesWeightChanged>((event, emit) {
      logger.d("PlasticSewagePipesWeightChanged fired");
      emit(state.copyWith(
        plasticSewagePipes: PlasticSewagePipes(
          weightKgPerMeter: event.value,
          meters: state.plasticSewagePipes?.meters,
        ),
      ));
    });

    // Steel Ventilation Pipes 300 DN Meters & Weight
    on<SteelVentilationPipes300DnMetersChanged>((event, emit) {
      logger.d("SteelVentilationPipes300DnMetersChanged fired");
      emit(state.copyWith(
        steelVentilationPipes300Dn: SteelVentilationPipes300Dn(
          meters: event.value,
          weightKgPerMeter: state.steelVentilationPipes300Dn?.weightKgPerMeter,
        ),
      ));
    });
    on<SteelVentilationPipes300DnWeightChanged>((event, emit) {
      logger.d("SteelVentilationPipes300DnWeightChanged fired");
      emit(state.copyWith(
        steelVentilationPipes300Dn: SteelVentilationPipes300Dn(
          weightKgPerMeter: event.value,
          meters: state.steelVentilationPipes300Dn?.meters,
        ),
      ));
    });

    // Steel Ventilation Pipes 500 DN Meters & Weight
    on<SteelVentilationPipes500DnMetersChanged>((event, emit) {
      logger.d("SteelVentilationPipes500DnMetersChanged fired");
      emit(state.copyWith(
        steelVentilationPipes500Dn: SteelVentilationPipes500Dn(
          meters: event.value,
          weightKgPerMeter: state.steelVentilationPipes500Dn?.weightKgPerMeter,
        ),
      ));
    });
    on<SteelVentilationPipes500DnWeightChanged>((event, emit) {
      logger.d("SteelVentilationPipes500DnWeightChanged fired");
      emit(state.copyWith(
        steelVentilationPipes500Dn: SteelVentilationPipes500Dn(
          weightKgPerMeter: event.value,
          meters: state.steelVentilationPipes500Dn?.meters,
        ),
      ));
    });

    // Copper Electrical Wires Meters & Weight
    on<CopperElectricalWiresMetersChanged>((event, emit) {
      logger.d("CopperElectricalWiresMetersChanged fired");
      emit(state.copyWith(
        copperElectricalWires: CopperElectricalWires(
          meters: event.value,
          weightKgPerMeter: state.copperElectricalWires?.weightKgPerMeter,
        ),
      ));
    });
    on<CopperElectricalWiresWeightChanged>((event, emit) {
      logger.d("CopperElectricalWiresWeightChanged fired");
      emit(state.copyWith(
        copperElectricalWires: CopperElectricalWires(
          weightKgPerMeter: event.value,
          meters: state.copperElectricalWires?.meters,
        ),
      ));
    });
  }
}
