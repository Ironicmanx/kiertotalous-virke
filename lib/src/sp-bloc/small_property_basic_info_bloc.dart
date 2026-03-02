import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'small_property_basic_info_event.dart';

class SmallPropertyBasicInfoBloc
    extends Bloc<SmallPropertyBasicInfoEvent, SmallPropertyEvaluationInfo> {
  SmallPropertyBasicInfoBloc() : super(SmallPropertyEvaluationInfo()) {
    on<SmallPropertyNameChanged>((event, emit) {
      logger.d("SmallPropertyNameChanged fired ${event.propertyName}");
      emit(state.copyWith(propertyName: event.propertyName));
      logger.d(state);
    });

    on<SmallPropertyBuildingTypeChanged>((event, emit) {
      logger.d("SmallPropertyBuildingTypeChanged fired ${event.buildingType}");
      emit(state.copyWith(buildingType: event.buildingType));
      logger.d(state);
    });

    on<SmallPropertyAddressChanged>((event, emit) {
      logger.d("SmallPropertyAddressChanged fired ${event.address}");
      emit(state.copyWith(address: event.address));
      logger.d(state);
    });

    on<IsHazardousSubstanceSurveyDoneChanged>((event, emit) {
      logger.d("isHazardousSubstanceSurveyDoneChanged fired ${event.value}");
      emit(state.copyWith(isHazardousSubstanceSurveyDone: event.value));
      logger.d(state);
    });
  }
}
