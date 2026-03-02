import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/concrete_bricks_tiles_ceramics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_concrete_bricks_tiles_ceramics_event.dart';
import 'package:flutter_app/src/lp-bloc/total_roofs_bloc.dart';

class TotalConcreteBricksTilesCeramicsBloc extends Bloc<
    TotalConcreteBricksTilesCeramicsEvent, TotalConcreteBricksTilesCeramics> {
  final ConcreteBricksTilesCeramicsBloc concreteBricksTilesCeramicsBloc;
  final FoundationsBloc foundationsBloc;
  final IntermediateFloorsBloc totalIntermediateFloorsBloc;
  final TotalRoofsBloc totalRoofsBloc;
  final TotalBuildingFrameBloc totalBuildingFrameBloc;
  final InternalWallFramesAndSurfaceMaterialBloc
      internalWallFramesAndSurfaceMaterialBloc;
  final TotalDemolitionWasteAndCostsBloc totalDemolitionWasteAndCostsBloc;

  TotalConcreteBricksTilesCeramicsBloc({
    required this.concreteBricksTilesCeramicsBloc,
    required this.foundationsBloc,
    required this.totalIntermediateFloorsBloc,
    required this.totalRoofsBloc,
    required this.totalBuildingFrameBloc,
    required this.internalWallFramesAndSurfaceMaterialBloc,
    required this.totalDemolitionWasteAndCostsBloc,
  }) : super(
          TotalConcreteBricksTilesCeramics().copyWith(
            concreteBricksTilesCeramics: concreteBricksTilesCeramicsBloc.state,
            foundations: foundationsBloc.state,
            totalIntermediateFloors: totalIntermediateFloorsBloc.state,
            totalRoofs: totalRoofsBloc.state,
            totalBuildingFrame: totalBuildingFrameBloc.state,
            internalWallFramesAndSurfaceMaterial:
                internalWallFramesAndSurfaceMaterialBloc.state,
            totalDemolitionWasteAndCosts:
                totalDemolitionWasteAndCostsBloc.state,
          ),
        ) {
    on<ConcreteBricksTilesCeramicsChanged>((event, emit) {
      emit(
        state.copyWith(
          concreteBricksTilesCeramics: event.concreteBricksTilesCeramics,
        ),
      );
      logger.d(
          "TotalConcreteBricksTilesCeramics.concreteBricksTilesCeramics changed");
    });

    on<FoundationsChanged>((event, emit) {
      emit(
        state.copyWith(
          foundations: event.foundations,
        ),
      );
      logger.d("TotalConcreteBricksTilesCeramics.foundations changed");
    });

    on<TotalIntermediateFloorsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalIntermediateFloors: event.totalIntermediateFloors,
        ),
      );
      logger.d(
          "TotalConcreteBricksTilesCeramics.totalIntermediateFloors changed");
    });

    on<TotalRoofsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalRoofs: event.totalRoofs,
        ),
      );
      logger.d("TotalConcreteBricksTilesCeramics.totalRoofs changed");
    });

    on<TotalBuildingFrameChanged>((event, emit) {
      emit(
        state.copyWith(
          totalBuildingFrame: event.totalBuildingFrame,
        ),
      );
      logger.d("TotalConcreteBricksTilesCeramics.totalBuildingFrame changed");
    });

    on<InternalWallFramesAndSurfaceMaterialChanged>((event, emit) {
      emit(
        state.copyWith(
          internalWallFramesAndSurfaceMaterial:
              event.internalWallFramesAndSurfaceMaterial,
        ),
      );
      logger.d(
          "TotalConcreteBricksTilesCeramics.internalWallFramesAndSurfaceMaterial changed");
    });

    on<TotalDemolitionWasteAndCostsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalDemolitionWasteAndCosts: event.totalDemolitionWasteAndCosts,
        ),
      );
      logger.d(
          "TotalConcreteBricksTilesCeramics.totalDemolitionWasteAndCosts changed");
    });

    // Listen to all the dependent blocs
    concreteBricksTilesCeramicsBloc.stream.listen((state) {
      add(ConcreteBricksTilesCeramicsChanged(state));
    });

    foundationsBloc.stream.listen((state) {
      add(FoundationsChanged(state));
    });

    totalIntermediateFloorsBloc.stream.listen((state) {
      add(TotalIntermediateFloorsChanged(state));
    });

    totalRoofsBloc.stream.listen((state) {
      add(TotalRoofsChanged(state));
    });

    totalBuildingFrameBloc.stream.listen((state) {
      add(TotalBuildingFrameChanged(state));
    });

    internalWallFramesAndSurfaceMaterialBloc.stream.listen((state) {
      add(InternalWallFramesAndSurfaceMaterialChanged(state));
    });

    totalDemolitionWasteAndCostsBloc.stream.listen((state) {
      add(TotalDemolitionWasteAndCostsChanged(state));
    });
  }
}
