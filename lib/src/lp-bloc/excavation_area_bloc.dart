import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/excavation_area_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExcavationAreaBloc extends Bloc<ExcavationAreaEvent, ExcavationArea> {
  ExcavationAreaBloc() : super(ExcavationArea()) {
    on<AreaToRemoveSizeChanged>((event, emit) {
      logger.d("AreaToRemoveSizeChanged to ${event.amount}");
      emit(
        state.copyWith(
          areaToRemoveSize: event.amount,
        ),
      );
    });
    on<AreaToRemoveDepthChanged>((event, emit) {
      logger.d("AreaToRemoveDepthChanged to ${event.amount}");
      emit(
        state.copyWith(
          areaToRemoveDepth: event.amount,
        ),
      );
    });
    on<AsphaltAreaChanged>((event, emit) {
      logger.d("AsphaltAreaChanged to ${event.amount}");
      emit(
        state.copyWith(
          asphaltArea: event.amount,
        ),
      );
    });
    on<CleanSoilPortionPercentageChanged>((event, emit) {
      logger.d("CleanSoilPortionPercentageChanged to ${event.amount}");
      emit(
        state.copyWith(
          cleanSoilPortionPercentage: event.amount,
        ),
      );
    });
  }
}
