import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/floor_structures_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloorStructuresBloc extends Bloc<FloorStructuresEvent, FloorStructures> {
  FloorStructuresBloc()
      : super(
          FloorStructures(
            officeSpaces: FloorStructure(),
            lobbiesAndOtherCommonAreas: FloorStructure(),
            restroomsAndWashingFacilities: FloorStructure(),
            kitchens: FloorStructure(),
            teachingAndTreatmentSpaces: FloorStructure(),
            storageAndWorkspaces: FloorStructure(),
            otherSpaces: FloorStructure(),
            surfaceMaterialCoatingContainsAsbestos: false,
          ),
        ) {
    on<OfficeSpacesChanged>((event, emit) {
      logger.d("OfficeSpacesChanged to ${event.floorStructure}");
      emit(state.copyWith(officeSpaces: event.floorStructure));
    });
    on<LobbiesAndOtherCommonAreasChanged>((event, emit) {
      logger.d("LobbiesAndOtherCommonAreasChanged to ${event.floorStructure}");
      emit(state.copyWith(lobbiesAndOtherCommonAreas: event.floorStructure));
    });
    on<RestRoomsAndWashingFacilitiesChanged>((event, emit) {
      logger
          .d("RestRoomsAndWashingFacilitiesChanged to ${event.floorStructure}");
      emit(state.copyWith(restroomsAndWashingFacilities: event.floorStructure));
    });
    on<KitchensChanged>((event, emit) {
      logger.d("KitchensChanged to ${event.floorStructure}");
      emit(state.copyWith(kitchens: event.floorStructure));
    });
    on<TeachingAndTreatmentSpacesChanged>((event, emit) {
      logger.d("TeachingAndTreatmentSpacesChanged to ${event.floorStructure}");
      emit(state.copyWith(teachingAndTreatmentSpaces: event.floorStructure));
    });
    on<StorageAndWorkspacesChanged>((event, emit) {
      logger.d("StorageAndWorkspacesChanged to ${event.floorStructure}");
      emit(state.copyWith(storageAndWorkspaces: event.floorStructure));
    });
    on<OtherSpacesChanged>((event, emit) {
      logger.d("OtherSpacesChanged to ${event.floorStructure}");
      emit(state.copyWith(otherSpaces: event.floorStructure));
    });
    on<SurfaceMaterialCoatingContainsAsbestosChanged>((event, emit) {
      logger.d(
          "SurfaceMaterialCoatingContainsAsbestosChanged to ${event.asbestos}");
      emit(state.copyWith(
          surfaceMaterialCoatingContainsAsbestos: event.asbestos));
    });
  }
}
