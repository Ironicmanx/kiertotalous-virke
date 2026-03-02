import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'large_property_basic_info_event.dart';

class LargePropertyBasicInfoBloc
    extends Bloc<LargePropertyBasicInfoEvent, LargePropertyEvaluationInfo> {
  LargePropertyBasicInfoBloc() : super(LargePropertyEvaluationInfo()) {
    on<LargePropertyCalcAuthorChanged>((event, emit) {
      logger.d("LargePropertyCalcAuthorChanged fired ${event.author}");
      emit(state.copyWith(author: event.author));
      logger.d(state);
    });

    on<LargePropertyNameChanged>((event, emit) {
      logger.d("LargePropertyNameChanged fired ${event.propertyName}");
      emit(state.copyWith(propertyName: event.propertyName));
      logger.d(state);
    });

    on<LargePropertyBuildingTypeChanged>((event, emit) {
      logger.d("LargePropertyBuildingTypeChanged fired ${event.buildingType}");
      emit(state.copyWith(buildingType: event.buildingType));
      logger.d(state);
    });

    on<LargePropertyAddressChanged>((event, emit) {
      logger.d("LargePropertyAddressChanged fired ${event.address}");
      emit(state.copyWith(address: event.address));
      logger.d(state);
    });

    on<LargePropertyMunicipalityChanged>((event, emit) {
      logger.d("LargePropertyMunicipalityChanged fired ${event.municipality}");
      emit(state.copyWith(municipality: event.municipality));
      logger.d(state);
    });

    on<LargePropertyDateChanged>((event, emit) {
      logger.d("LargePropertyDateChanged fired ${event.date}");
      emit(state.copyWith(date: event.date));
      logger.d(state);
    });

    on<LargePropertyVersionChanged>((event, emit) {
      logger.d("LargePropertyVersionChanged fired ${event.version} ");
      emit(state.copyWith(version: event.version));
      logger.d(state);
    });

    on<LargePropertyDescriptionChanged>((event, emit) {
      logger.d("LargePropertyDescriptionChanged fired ${event.description}");
      emit(state.copyWith(description: event.description));
      logger.d(state);
    });
  }
}
