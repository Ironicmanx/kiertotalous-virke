import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internal_wall_frames_and_surface_material_event.dart';
import 'package:flutter_app/log.dart';

class InternalWallFramesAndSurfaceMaterialBloc extends Bloc<
    InternalWallFramesAndSurfaceMaterialEvent,
    InternalWallFramesAndSurfaceMaterial> {
  InternalWallFramesAndSurfaceMaterialBloc()
      : super(InternalWallFramesAndSurfaceMaterial(
          overallWallLength: null,
          averageWallHeight: null,
          officeSpaces: RoomSpace(),
          lobbiesAndOtherCommonAreas: RoomSpace(),
          restroomsAndWashingFacilities: RoomSpace(),
          kitchens: RoomSpace(),
          teachingAndTreatmentSpaces: RoomSpace(),
          storageAndWorkspaces: RoomSpace(),
          otherSpaces: RoomSpace(),
          surfaceMaterialCoatingContainsAsbestos: false,
        )) {
    on<OverallLengthOfInternalWallsAllFloorsChanged>((event, emit) {
      logger
          .d("OverallLengthOfInternalWallsAllFloorsChanged to ${event.amount}");
      emit(state.copyWith(
        overallWallLength: event.amount,
      ));
    });

    on<AverageHeightOfInternalWallsChanged>((event, emit) {
      logger.d("AverageHeightOfInternalWallsChanged to ${event.amount}");
      emit(state.copyWith(
        averageWallHeight: event.amount,
      ));
    });

    on<OfficeSpacesChanged>((event, emit) {
      logger.d("RoomSpaceChanged to ${event.value}");
      emit(state.copyWith(
        officeSpaces: event.value,
      ));
    });

    on<LobbiesAndOtherCommonAreasChanged>((event, emit) {
      logger.d("RoomSpaceChanged to ${event.value}");
      emit(state.copyWith(
        lobbiesAndOtherCommonAreas: event.value,
      ));
    });

    on<RestroomsAndWashingFacilitiesChanged>((event, emit) {
      logger.d("RoomSpaceChanged to ${event.value}");
      emit(state.copyWith(
        restroomsAndWashingFacilities: event.value,
      ));
    });

    on<KitchensChanged>((event, emit) {
      logger.d("KitchensChanged to ${event.value}");
      emit(state.copyWith(
        kitchens: event.value,
      ));
    });

    on<TeachingAndTreatmentSpacesChanged>((event, emit) {
      logger.d("TeachingAndTreatmentSpacesChanged to ${event.value}");
      emit(state.copyWith(
        teachingAndTreatmentSpaces: event.value,
      ));
    });

    on<StorageAndWorkSpacesChanged>((event, emit) {
      logger.d("StorageAndWorkSpacesChanged to ${event.value}");
      emit(state.copyWith(
        storageAndWorkspaces: event.value,
      ));
    });

    on<OtherSpacesChanged>((event, emit) {
      logger.d("OtherSpacesChanged to ${event.value}");
      emit(state.copyWith(
        otherSpaces: event.value,
      ));
    });

    on<SurfaceMaterialCoatingContainsAsbestosChanged>((event, emit) {
      logger.d(
          "SurfaceMaterialCoatingContainsAsbestosChanged to ${event.containsAsbestos}");
      emit(state.copyWith(
        surfaceMaterialCoatingContainsAsbestos: event.containsAsbestos,
      ));
    });
  }
}
