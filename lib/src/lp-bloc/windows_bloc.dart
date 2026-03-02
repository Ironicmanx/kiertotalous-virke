import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/windows_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WindowsBloc extends Bloc<WindowsEvent, Windows> {
  WindowsBloc()
      : super(const Windows(
          windowsPcs: null,
          windowsArea: null,
          glassWallArea: null,
          areWindowsRecyclable: false,
        )) {
    on<WindowsPcsChanged>((event, emit) {
      logger.d("WindowsPcsChanged fired");
      emit(state.copyWith(windowsPcs: event.value));
    });

    on<WindowsAreaChanged>((event, emit) {
      logger.d("WindowsAreaChanged fired");
      emit(state.copyWith(windowsArea: event.value));
    });

    on<GlassWallAreaChanged>((event, emit) {
      logger.d("GlassWallAreaChanged fired");
      emit(state.copyWith(glassWallArea: event.value));
    });

    on<WindowsRecyclabilityChanged>((event, emit) {
      logger.d("WindowsRecyclabilityChanged fired");
      emit(state.copyWith(areWindowsRecyclable: event.isRecyclable));
    });
  }
}
