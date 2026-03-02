import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'thermal_center_bloc.dart';
import 'total_thermal_center_event.dart';

class TotalThermalCenterBloc
    extends Bloc<TotalThermalCenterEvent, ThermalCenter> {
  final ThermalCenterBloc thermalCenterBloc;

  TotalThermalCenterBloc({required this.thermalCenterBloc})
      : super(ThermalCenter()) {
    on<ThermalCenterChanged>((event, emit) {
      emit(event.thermalCenter);
    });

    // Listen to changes in the thermalCenterBloc
    thermalCenterBloc.stream.listen((state) {
      add(ThermalCenterChanged(state));
    });
  }
}
