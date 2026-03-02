import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/cellar_bloc.dart';
import 'package:flutter_app/src/lp-bloc/excavation_area_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixed_furniture_bloc.dart';
import 'package:flutter_app/src/lp-bloc/floor_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_property_total_disposal_materials_and_hazardous_waste_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalDisposalMaterialsAndHazardousWasteBloc extends Bloc<
    TotalDisposalMaterialsAndHazardousWasteEvent,
    TotalDisposalMaterialsAndHazardousWaste> {
  final DisposalMaterialsAndHazardousWasteBloc
      disposalMaterialsAndHazardousWasteBloc;
  final ExcavationAreaBloc excavationAreaBloc;
  final CellarBloc cellarBloc;
  final FixedFurnitureBloc fixedFurnitureBloc;
  final FloorStructuresBloc floorStructuresBloc;
  final FoundationsBloc foundationsBloc;
  final InternalWallFramesAndSurfaceMaterialBloc
      internalWallFramesAndSurfaceMaterialBloc;

  TotalDisposalMaterialsAndHazardousWasteBloc({
    required this.disposalMaterialsAndHazardousWasteBloc,
    required this.excavationAreaBloc,
    required this.cellarBloc,
    required this.fixedFurnitureBloc,
    required this.floorStructuresBloc,
    required this.foundationsBloc,
    required this.internalWallFramesAndSurfaceMaterialBloc,
  }) : super(
          TotalDisposalMaterialsAndHazardousWaste().copyWith(
            disposalMaterialsAndHazardousWaste:
                disposalMaterialsAndHazardousWasteBloc.state,
            excavationArea: excavationAreaBloc.state,
            cellar: cellarBloc.state,
            fixedFurniture: fixedFurnitureBloc.state,
            floorStructures: floorStructuresBloc.state,
            foundations: foundationsBloc.state,
            internalWallFramesAndSurfaceMaterial:
                internalWallFramesAndSurfaceMaterialBloc.state,
          ),
        ) {
    on<DisposalMaterialsAndHazardousWasteChanged>((event, emit) {
      emit(
        state.copyWith(
          disposalMaterialsAndHazardousWaste:
              event.disposalMaterialsAndHazardousWaste,
        ),
      );
      logger.d(
          "TotalDisposalMaterialsAndHazardousWaste.disposalMaterialsAndHazardousWaste changed to: ${event.disposalMaterialsAndHazardousWaste}");
    });

    on<ExcavationAreaChanged>((event, emit) {
      emit(
        state.copyWith(
          excavationArea: event.excavationArea,
        ),
      );
      logger.d(
          "TotalDisposalMaterialsAndHazardousWaste.excavationArea changed to: ${event.excavationArea}");
    });

    on<CellarChanged>((event, emit) {
      emit(
        state.copyWith(
          cellar: event.cellar,
        ),
      );
      logger.d(
          "TotalDisposalMaterialsAndHazardousWaste.cellar changed to: ${event.cellar}");
    });

    on<FixedFurnitureChanged>((event, emit) {
      emit(
        state.copyWith(
          fixedFurniture: event.fixedFurniture,
        ),
      );
      logger.d(
          "TotalDisposalMaterialsAndHazardousWaste.fixedFurniture changed to: ${event.fixedFurniture}");
    });

    on<FloorStructuresChanged>((event, emit) {
      emit(
        state.copyWith(
          floorStructures: event.floorStructures,
        ),
      );
      logger.d(
          "TotalDisposalMaterialsAndHazardousWaste.floorStructures changed to: ${event.floorStructures}");
    });

    on<FoundationsChanged>((event, emit) {
      emit(
        state.copyWith(
          foundations: event.foundations,
        ),
      );
      logger.d(
          "TotalDisposalMaterialsAndHazardousWaste.foundations changed to: ${event.foundations}");
    });

    on<InternalWallFramesAndSurfaceMaterialChanged>((event, emit) {
      emit(
        state.copyWith(
          internalWallFramesAndSurfaceMaterial:
              event.internalWallFramesAndSurfaceMaterial,
        ),
      );
      logger.d(
          "TotalDisposalMaterialsAndHazardousWaste.internalWallFramesAndSurfaceMaterial changed to: ${event.internalWallFramesAndSurfaceMaterial}");
    });

    // Listen to changes in child blocs
    disposalMaterialsAndHazardousWasteBloc.stream.listen((state) {
      add(DisposalMaterialsAndHazardousWasteChanged(state));
    });

    excavationAreaBloc.stream.listen((state) {
      add(ExcavationAreaChanged(state));
    });

    cellarBloc.stream.listen((state) {
      add(CellarChanged(state));
    });

    fixedFurnitureBloc.stream.listen((state) {
      add(FixedFurnitureChanged(state));
    });

    floorStructuresBloc.stream.listen((state) {
      add(FloorStructuresChanged(state));
    });

    foundationsBloc.stream.listen((state) {
      add(FoundationsChanged(state));
    });

    internalWallFramesAndSurfaceMaterialBloc.stream.listen((state) {
      add(InternalWallFramesAndSurfaceMaterialChanged(state));
    });
  }
}
