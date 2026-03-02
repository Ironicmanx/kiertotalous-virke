import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_roofs_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalRoofsBloc extends Bloc<TotalRoofsEvent, TotalRoofs> {
  final FoundationsBloc foundationsBloc;
  TotalRoofsBloc(
    this.foundationsBloc,
  ) : super(
          TotalRoofs().copyWith(
            foundations: foundationsBloc.state,
            roofs: Roofs(
              ceilingArea: 0,
              ridgeOrGableRoofPortionPercentage: 0,
              ridgeOrGableRoofType: RoofType.concreteBeam,
              ridgeOrGableWaterRoofType: WaterRoofType.metalRoof,
              flatOrMonoPitchedRoofType: RoofType.concreteBeam,
              flatOrMonoPitchedWaterRoofType: WaterRoofType.metalRoof,
            ),
          ),
        ) {
    on<FoundationsChanged>((event, emit) {
      logger.d("TotalRoofsBloc's Foundations changed to ${event.foundations}");
      emit(
        state.copyWith(foundations: event.foundations),
      );
    });
    on<TotalRoofsChanged>((event, emit) {
      logger.d('TotalRoofsChanged to ${event.totalRoofs}');
      emit(event.totalRoofs);
    });
    on<RoofsChanged>((event, emit) {
      logger.d('RoofsChanged to ${event.roofs}');
      emit(
        state.copyWith(roofs: event.roofs),
      );
    });
    on<BituminousWaterProofingChanged>((event, emit) {
      logger.d(
          'BituminousWaterProofingChanged to ${event.bituminousWaterProofing}');
      emit(
        state.copyWith.foundations!.call(
          bituminousWaterProofing: event.bituminousWaterProofing,
        ),
      );
    });

    foundationsBloc.stream.listen((foundationsState) {
      logger.d(
          'TotalRoofsBloc received an update from FoundationsBloc: $foundationsState');
      add(FoundationsChanged(foundationsState));
    });
  }
}
