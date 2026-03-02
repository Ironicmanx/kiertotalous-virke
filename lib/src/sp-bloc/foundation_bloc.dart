import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/foundation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertiesFoundationBloc
    extends Bloc<SmallPropertiesFoundationEvent, SmallPropertiesFoundation> {
  SmallPropertiesFoundationBloc() : super(SmallPropertiesFoundation()) {
    on<ContainsAsbestosChanged>((event, emit) {
      emit(state.copyWith(containsAsbestos: event.value));
    });

    on<ContainsPcbPaintsChanged>((event, emit) {
      emit(state.copyWith(containsPcbPaints: event.value));
    });

    on<PlinthLengthChanged>((event, emit) {
      emit(state.copyWith(plinthLengthInLinearMeters: event.value));
    });

    on<PlinthThicknessChanged>((event, emit) {
      emit(state.copyWith(plinthThicknessInMeters: event.value));
    });

    on<ConcreteSlabAreaChanged>((event, emit) {
      emit(state.copyWith(concreteSlabAreaInSquareMeters: event.value));
    });

    on<PlinthHeightChanged>((event, emit) {
      emit(state.copyWith(plinthHeightInMeters: event.value));
    });

    on<ConcreteSlabThicknessChanged>((event, emit) {
      emit(state.copyWith(concreteSlabThicknessInMeters: event.value));
    });
  }
}
