import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'roofs_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertiesRoofsBloc extends Bloc<SmallPropertiesRoofsEvent, Roof> {
  SmallPropertiesRoofsBloc() : super(Roof()) {
    on<ContainsRecyclableWoodChanged>((event, emit) {
      logger.d("ContainsRecyclableWoodChanged to ${event.value}");
      emit(
        state.copyWith(
          containsRecyclableWood: event.value,
        ),
      );
    });

    on<CoveringMaterialContainsAsbestosChanged>((event, emit) {
      logger.d("CoveringMaterialContainsAsbestosChanged to ${event.value}");
      emit(
        state.copyWith(
          coveringMaterialContainsAsbestos: event.value,
        ),
      );
    });

    on<SlopeLengthInMetersChanged>((event, emit) {
      logger.d("SlopeLengthInMetersChanged to ${event.value}");
      emit(
        state.copyWith(
          slopeLengthInMeters: event.value,
        ),
      );
    });

    on<SlopeWidhthInMetersChanged>((event, emit) {
      logger.d("SlopeWidhthInMetersChanged to ${event.value}");
      emit(
        state.copyWith(
          slopeWidthInMeters: event.value,
        ),
      );
    });

    on<SmallPropertyRoofTypeChanged>((event, emit) {
      logger.d("SmallPropertyRoofTypeChanged to ${event.value}");
      emit(
        state.copyWith(
          roofType: event.value,
        ),
      );
    });

    on<WaterRoofTypeChanged>((event, emit) {
      logger.d("WaterRoofTypeChanged to ${event.waterRoofType}");
      emit(
        state.copyWith(
          waterRoofType: event.waterRoofType,
        ),
      );
    });
  }
}
