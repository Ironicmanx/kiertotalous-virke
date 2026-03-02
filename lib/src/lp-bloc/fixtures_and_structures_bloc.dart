import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/fixtures_and_structures_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixturesAndStructuresBloc
    extends Bloc<FixturesAndStructuresEvent, FixturesAndStructures> {
  FixturesAndStructuresBloc()
      : super(FixturesAndStructures(
          rainGuttersAndDownSpouts: null,
          fireLaddersAndWalkways: null,
          aluminiumChainLinkFences: null,
          steelChainLinkFences: null,
          fixturesRecyclable: false,
        )) {
    // Rain Gutters Meters & Weight
    on<RainGuttersMetersChanged>((event, emit) {
      logger.d("RainGuttersMetersChanged fired");
      emit(state.copyWith(
        rainGuttersAndDownSpouts: RainGuttersAndDownspouts(
          meters: event.value,
          weightKgPerMeter: state.rainGuttersAndDownSpouts?.weightKgPerMeter,
        ),
      ));
    });
    on<RainGuttersWeightChanged>((event, emit) {
      logger.d("RainGuttersWeightChanged fired");
      emit(state.copyWith(
        rainGuttersAndDownSpouts: RainGuttersAndDownspouts(
          weightKgPerMeter: event.value,
          meters: state.rainGuttersAndDownSpouts?.meters,
        ),
      ));
    });

    // Fire Ladders Meters & Weight
    on<FireLaddersMetersChanged>((event, emit) {
      logger.d("FireLaddersMetersChanged fired");
      emit(state.copyWith(
        fireLaddersAndWalkways: FireLaddersAndWalkways(
          meters: event.value,
          weightKgPerMeter: state.fireLaddersAndWalkways?.weightKgPerMeter,
        ),
      ));
    });
    on<FireLaddersWeightChanged>((event, emit) {
      logger.d("FireLaddersWeightChanged fired");
      emit(state.copyWith(
        fireLaddersAndWalkways: FireLaddersAndWalkways(
          weightKgPerMeter: event.value,
          meters: state.fireLaddersAndWalkways?.meters,
        ),
      ));
    });

    // Aluminium Chain Link Fences Meters & Weight
    on<AluminiumChainLinkFencesMetersChanged>((event, emit) {
      logger.d("AluminiumChainLinkFencesMetersChanged fired");
      emit(state.copyWith(
        aluminiumChainLinkFences: AluminiumChainLinkFences(
          meters: event.value,
          weightKgPerMeter: state.aluminiumChainLinkFences?.weightKgPerMeter,
        ),
      ));
    });
    on<AluminiumChainLinkFencesWeightChanged>((event, emit) {
      logger.d("AluminiumChainLinkFencesWeightChanged fired");
      emit(state.copyWith(
        aluminiumChainLinkFences: AluminiumChainLinkFences(
          weightKgPerMeter: event.value,
          meters: state.aluminiumChainLinkFences?.meters,
        ),
      ));
    });

    // Steel Chain Link Fences Meters & Weight
    on<SteelChainLinkFencesMetersChanged>((event, emit) {
      logger.d("SteelChainLinkFencesMetersChanged fired");
      emit(state.copyWith(
        steelChainLinkFences: SteelChainLinkFences(
          meters: event.value,
          weightKgPerMeter: state.steelChainLinkFences?.weightKgPerMeter,
        ),
      ));
    });
    on<SteelChainLinkFencesWeightChanged>((event, emit) {
      logger.d("SteelChainLinkFencesWeightChanged fired");
      emit(state.copyWith(
        steelChainLinkFences: SteelChainLinkFences(
          weightKgPerMeter: event.value,
          meters: state.steelChainLinkFences?.meters,
        ),
      ));
    });

    // Fixtures Recyclability
    on<FixturesRecyclableChanged>((event, emit) {
      logger.d("FixturesRecyclableChanged fired");
      emit(state.copyWith(
        fixturesRecyclable: event.value,
      ));
    });
  }
}
