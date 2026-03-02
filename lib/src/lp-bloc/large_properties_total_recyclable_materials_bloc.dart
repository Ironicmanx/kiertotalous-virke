import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_recyclable_materials_event.dart';
import 'package:flutter_app/src/lp-bloc/total_roofs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixtures_and_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixed_furniture_bloc.dart';
import 'package:flutter_app/src/lp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/windows_bloc.dart';
import 'package:flutter_app/src/lp-bloc/machines_and_equipments_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class TotalRecyclableComponentsAndFurnitureBloc extends Bloc<
    TotalRecyclableComponentsAndFurnitureEvent,
    TotalRecyclableComponentsAndFurniture> {
  final IntermediateFloorsBloc intermediateFloorsBloc;
  final TotalRoofsBloc totalRoofsBloc;
  final TotalBuildingFrameBloc totalBuildingFrameBloc;
  final FixturesAndStructuresBloc fixturesAndStructuresBloc;
  final FixedFurnitureBloc fixedFurnitureBloc;
  final OuterDoorsBloc outerDoorsBloc;
  final InnerDoorsBloc innerDoorsBloc;
  final WindowsBloc windowsBloc;
  final MachinesAndEquipmentsBloc machinesAndEquipmentsBloc;
  final RecyclableMaterialsBloc recyclableMaterialsBloc;

  TotalRecyclableComponentsAndFurnitureBloc({
    required this.intermediateFloorsBloc,
    required this.totalRoofsBloc,
    required this.totalBuildingFrameBloc,
    required this.fixturesAndStructuresBloc,
    required this.fixedFurnitureBloc,
    required this.outerDoorsBloc,
    required this.innerDoorsBloc,
    required this.windowsBloc,
    required this.machinesAndEquipmentsBloc,
    required this.recyclableMaterialsBloc,
  }) : super(
          TotalRecyclableComponentsAndFurniture().copyWith(
            totalIntermediateFloors: intermediateFloorsBloc.state,
            totalRoofs: totalRoofsBloc.state,
            totalBuildingFrame: totalBuildingFrameBloc.state,
            fixturesAndStructures: fixturesAndStructuresBloc.state,
            fixedFurniture: fixedFurnitureBloc.state,
            outerDoors: outerDoorsBloc.state,
            innerDoors: innerDoorsBloc.state,
            windows: windowsBloc.state,
            machinesAndEquipments: machinesAndEquipmentsBloc.state,
            recyclableComponentsAndFurniture: recyclableMaterialsBloc.state,
          ),
        ) {
    on<TotalIntermediateFloorsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalIntermediateFloors: event.totalIntermediateFloors,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.totalIntermediateFloors changed to: ${event.totalIntermediateFloors}");
    });
    on<TotalRoofsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalRoofs: event.totalRoofs,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.totalRoofs changed to: ${event.totalRoofs}");
    });
    on<TotalBuildingFrameChanged>((event, emit) {
      emit(
        state.copyWith(
          totalBuildingFrame: event.totalBuildingFrame,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.totalBuildingFrame changed to: ${event.totalBuildingFrame}");
    });
    on<FixturesAndStructuresChanged>((event, emit) {
      emit(
        state.copyWith(
          fixturesAndStructures: event.fixturesAndStructures,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.fixturesAndStructures changed to: ${event.fixturesAndStructures}");
    });
    on<FixedFurnitureChanged>((event, emit) {
      emit(
        state.copyWith(
          fixedFurniture: event.fixedFurniture,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.fixedFurniture changed to: ${event.fixedFurniture}");
    });
    on<OuterDoorsChanged>((event, emit) {
      emit(
        state.copyWith(
          outerDoors: event.outerDoors,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.outerDoors changed to: ${event.outerDoors}");
    });
    on<InnerDoorsChanged>((event, emit) {
      emit(
        state.copyWith(
          innerDoors: event.innerDoors,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.innerDoors changed to: ${event.innerDoors}");
    });
    on<WindowsChanged>((event, emit) {
      emit(
        state.copyWith(
          windows: event.windows,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.windows changed to: ${event.windows}");
    });
    on<MachinesAndEquipmentsChanged>((event, emit) {
      emit(
        state.copyWith(
          machinesAndEquipments: event.machinesAndEquipments,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.machinesAndEquipments changed to: ${event.machinesAndEquipments}");
    });
    on<RecyclableComponentsAndFurnitureChanged>((event, emit) {
      emit(
        state.copyWith(
          recyclableComponentsAndFurniture: event.recyclableMaterials,
        ),
      );
      logger.d(
          "TotalRecyclableComponentsAndFurniture.recyclableComponentsAndFurniture changed to: ${event.recyclableMaterials}");
    });

    intermediateFloorsBloc.stream.listen((state) {
      add(TotalIntermediateFloorsChanged(state));
    });
    totalRoofsBloc.stream.listen((state) {
      add(TotalRoofsChanged(state));
    });
    totalBuildingFrameBloc.stream.listen((state) {
      add(TotalBuildingFrameChanged(state));
    });
    fixturesAndStructuresBloc.stream.listen((state) {
      add(FixturesAndStructuresChanged(state));
    });
    fixedFurnitureBloc.stream.listen((state) {
      add(FixedFurnitureChanged(state));
    });
    outerDoorsBloc.stream.listen((state) {
      add(OuterDoorsChanged(state));
    });
    innerDoorsBloc.stream.listen((state) {
      add(InnerDoorsChanged(state));
    });
    windowsBloc.stream.listen((state) {
      add(WindowsChanged(state));
    });
    machinesAndEquipmentsBloc.stream.listen((state) {
      add(MachinesAndEquipmentsChanged(state));
    });
    recyclableMaterialsBloc.stream.listen((state) {
      add(RecyclableComponentsAndFurnitureChanged(state));
    });
  }
}
