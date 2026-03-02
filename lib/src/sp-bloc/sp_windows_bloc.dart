import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpWindowsBloc extends Bloc<SpWindowsEvent, SmallPropertyWindows> {
  SpWindowsBloc() : super(SmallPropertyWindows()) {
    on<WoodenFramePcsChanged>((event, emit) {
      emit(
        state.copyWith(
          woodenFramePcs: event.value,
        ),
      );
      logger.d("SpWindowsBloc.woodenFramePcs changed to ${event.value}");
    });
    on<SteelPcsChanged>((event, emit) {
      emit(
        state.copyWith(
          steelPcs: event.value,
        ),
      );
      logger.d("SpWindowsBloc.steelPcs changed to ${event.value}");
    });
    on<AluminiumPcsChanged>((event, emit) {
      emit(
        state.copyWith(
          aluminiumPcs: event.value,
        ),
      );
      logger.d("SpWindowsBloc.aluminiumPcs changed to ${event.value}");
    });
    on<AreWindowsRecyclableChanged>((event, emit) {
      emit(
        state.copyWith(
          areWindowsRecyclable: event.value,
        ),
      );
      logger.d("SpWindowsBloc.areWindowsRecyclable changed to ${event.value}");
    });
  }
}
