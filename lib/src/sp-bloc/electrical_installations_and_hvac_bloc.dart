import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'electrical_installations_and_hvac_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertiesElectricalInstallationsAndHvacBloc
    extends Bloc<SPElectricalInstallationsAndHVACEvent, Hvac> {
  SmallPropertiesElectricalInstallationsAndHvacBloc() : super(Hvac()) {
    on<SPElectricalWiresCopperChanged>((event, emit) {
      logger.d("SPElectricalWiresCopperChanged to ${event.value}");
      emit(
        state.copyWith(
          electricalWiresCopper: event.value,
        ),
      );
    });
    on<SPCopperPipesChanged>((event, emit) {
      logger.d("SPCopperPipesChanged to ${event.value}");
      emit(
        state.copyWith(
          copperPipes: event.value,
        ),
      );
    });
    on<SPPlasticPipesWaterChanged>((event, emit) {
      logger.d("SPPlasticPipesWaterChanged to ${event.value}");
      emit(
        state.copyWith(
          plasticPipesWater: event.value,
        ),
      );
    });
    on<SPVentilationPipesD200Changed>((event, emit) {
      logger.d("SPVentilationPipesD200Changed to ${event.value}");
      emit(
        state.copyWith(
          ventilationPipesD200: event.value,
        ),
      );
    });
    on<SPCentralHeatingPipesChanged>((event, emit) {
      logger.d("SPCentralHeatingPipesChanged to ${event.value}");
      emit(
        state.copyWith(
          centralHeatingPipes: event.value,
        ),
      );
    });
    on<SPCastIronPipesChanged>((event, emit) {
      logger.d("SPCastIronPipesChanged to ${event.value}");
      emit(
        state.copyWith(
          castIronPipes: event.value,
        ),
      );
    });
    on<SPSewagePipesPlasticChanged>((event, emit) {
      logger.d("SPSewagePipesPlasticChanged to ${event.value}");
      emit(
        state.copyWith(
          sewagePipesPlastic: event.value,
        ),
      );
    });
    on<SPRainGuttersChanged>((event, emit) {
      logger.d("SPRainGuttersChanged to ${event.value}");
      emit(
        state.copyWith(
          rainGutters: event.value,
        ),
      );
    });
  }
}
