import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/cellar_bloc.dart';
import 'package:flutter_app/src/lp-bloc/excavation_area_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixed_furniture_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixtures_and_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/floor_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/hvac_and_electrical_installations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/lp-bloc/machines_and_equipments_bloc.dart';
import 'package:flutter_app/src/lp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_reusable_and_recyclable_materials_event.dart';
import 'package:flutter_app/src/lp-bloc/total_roofs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/windows_bloc.dart';
import 'package:flutter_app/src/lp-bloc/yard_and_protective_structures_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class TotalReusableAndRecyclableMaterialsBloc extends Bloc<
    TotalReusableAndRecyclableMaterialsEvent,
    TotalReusableAndRecyclableMaterials> {
  final ExcavationAreaBloc excavationAreaBloc;
  final FoundationsBloc foundationsBloc;
  final IntermediateFloorsBloc totalIntermediateFloorsBloc;
  final TotalRoofsBloc totalRoofsBloc;
  final TotalBuildingFrameBloc totalBuildingFrameBloc;
  final OuterDoorsBloc outerDoorsBloc;
  final InnerDoorsBloc innerDoorsBloc;
  final FixedFurnitureBloc fixedFurnitureBloc;
  final CellarBloc cellarBloc;
  final FloorStructuresBloc floorStructuresBloc;
  final InternalWallFramesAndSurfaceMaterialBloc
      internalWallFramesAndSurfaceMaterialBloc;
  final WindowsBloc windowsBloc;
  final HvacAndElectricalInstallationsBloc hvacAndElectricalInstallationsBloc;
  final MachinesAndEquipmentsBloc machinesAndEquipmentsBloc;
  final FixturesAndStructuresBloc fixturesAndStructuresBloc;
  final YardAndProtectiveStructuresBloc yardAndProtectiveStructuresBloc;
  final ReusableAndRecyclableMaterialsBloc reusableAndRecyclableMaterialsBloc;
  TotalReusableAndRecyclableMaterialsBloc({
    required this.excavationAreaBloc,
    required this.foundationsBloc,
    required this.totalIntermediateFloorsBloc,
    required this.totalRoofsBloc,
    required this.totalBuildingFrameBloc,
    required this.outerDoorsBloc,
    required this.innerDoorsBloc,
    required this.fixedFurnitureBloc,
    required this.cellarBloc,
    required this.floorStructuresBloc,
    required this.internalWallFramesAndSurfaceMaterialBloc,
    required this.windowsBloc,
    required this.hvacAndElectricalInstallationsBloc,
    required this.machinesAndEquipmentsBloc,
    required this.fixturesAndStructuresBloc,
    required this.yardAndProtectiveStructuresBloc,
    required this.reusableAndRecyclableMaterialsBloc,
  }) : super(
          TotalReusableAndRecyclableMaterials().copyWith(
            excavationArea: excavationAreaBloc.state,
            foundations: foundationsBloc.state,
            // TODO: name of bloc should be changed to match property
            totalIntermediateFloors: totalIntermediateFloorsBloc.state,
            totalRoofs: totalRoofsBloc.state,
            totalBuildingFrame: totalBuildingFrameBloc.state,
            outerDoors: outerDoorsBloc.state,
            innerDoors: innerDoorsBloc.state,
            fixedFurniture: fixedFurnitureBloc.state,
            cellar: cellarBloc.state,
            floorStructures: floorStructuresBloc.state,
            internalWallFramesAndSurfaceMaterial:
                internalWallFramesAndSurfaceMaterialBloc.state,
            windows: windowsBloc.state,
            hvacAndElectricalInstallations:
                hvacAndElectricalInstallationsBloc.state,
            machinesAndEquipments: machinesAndEquipmentsBloc.state,
            fixturesAndStructures: fixturesAndStructuresBloc.state,
            yardAndProtectiveStructures: yardAndProtectiveStructuresBloc.state,
            reusableAndRecyclableMaterials:
                reusableAndRecyclableMaterialsBloc.state,
          ),
        ) {
    on<ExcavationAreaChanged>((event, emit) {
      emit(
        state.copyWith(
          excavationArea: event.excavationArea,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.excavationArea changed to: ${event.excavationArea}");
    });
    on<FoundationsChanged>((event, emit) {
      emit(
        state.copyWith(
          foundations: event.foundations,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.foundations changed to: ${event.foundations}");
    });
    on<TotalIntermediateFloorsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalIntermediateFloors: event.totalIntermediateFloors,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.totalIntermediateFloors changed to: ${event.totalIntermediateFloors}");
    });
    on<TotalRoofsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalRoofs: event.totalRoofs,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.totalRoofs changed to: ${event.totalRoofs}");
    });
    on<TotalBuildingFrameChanged>((event, emit) {
      emit(
        state.copyWith(
          totalBuildingFrame: event.totalBuildingFrame,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.totalBuildingFrame changed to: ${event.totalBuildingFrame}");
    });
    on<OuterDoorsChanged>((event, emit) {
      emit(
        state.copyWith(
          outerDoors: event.outerDoors,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.outerDoors changed to: ${event.outerDoors}");
    });
    on<InnerDoorsChanged>((event, emit) {
      emit(
        state.copyWith(
          innerDoors: event.innerDoors,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.innerDoors changed to: ${event.innerDoors}");
    });
    on<FixedFurnitureChanged>((event, emit) {
      emit(
        state.copyWith(
          fixedFurniture: event.fixedFurniture,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.fixedFurniture changed to: ${event.fixedFurniture}");
    });
    on<CellarChanged>((event, emit) {
      emit(
        state.copyWith(
          cellar: event.cellar,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.cellar changed to: ${event.cellar}");
    });
    on<FloorStructuresChanged>((event, emit) {
      emit(
        state.copyWith(
          floorStructures: event.floorStructures,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.floorStructures changed to: ${event.floorStructures}");
    });
    on<InternalWallFramesAndSurfaceMaterialChanged>((event, emit) {
      emit(
        state.copyWith(
          internalWallFramesAndSurfaceMaterial:
              event.internalWallFramesAndSurfaceMaterial,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.internalWallFramesAndSurfaceMaterial changed to: ${event.internalWallFramesAndSurfaceMaterial}");
    });
    on<WindowsChanged>((event, emit) {
      emit(
        state.copyWith(
          windows: event.windows,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.windows changed to: ${event.windows}");
    });
    on<HvacAndElectricalInstallationsChanged>((event, emit) {
      emit(
        state.copyWith(
          hvacAndElectricalInstallations: event.hvacAndElectricalInstallations,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.hvacAndElectricalInstallations changed to: ${event.hvacAndElectricalInstallations}");
    });
    on<MachinesAndEquipmentsChanged>((event, emit) {
      emit(
        state.copyWith(
          machinesAndEquipments: event.machinesAndEquipments,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.machinesAndEquipments changed to: ${event.machinesAndEquipments}");
    });
    on<FixturesAndStructuresChanged>((event, emit) {
      emit(
        state.copyWith(
          fixturesAndStructures: event.fixturesAndStructures,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.fixturesAndStructures changed to: ${event.fixturesAndStructures}");
    });
    on<YardAndProtectiveStructuresChanged>((event, emit) {
      emit(
        state.copyWith(
          yardAndProtectiveStructures: event.yardAndProtectiveStructures,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.yardAndProtectiveStructures changed to: ${event.yardAndProtectiveStructures}");
    });
    on<ReusableAndRecyclableMaterialsChanged>((event, emit) {
      emit(
        state.copyWith(
          reusableAndRecyclableMaterials: event.reusableAndRecyclableMaterials,
        ),
      );
      logger.d(
          "TotalReusableAndRecyclableMaterials.reusableAndRecyclableMaterials changed to: ${event.reusableAndRecyclableMaterials}");
    });

    // listen to changes made in children blocs
    excavationAreaBloc.stream.listen((state) {
      add(ExcavationAreaChanged(state));
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
    outerDoorsBloc.stream.listen((state) {
      add(OuterDoorsChanged(state));
    });
    innerDoorsBloc.stream.listen((state) {
      add(InnerDoorsChanged(state));
    });
    fixedFurnitureBloc.stream.listen((state) {
      add(FixedFurnitureChanged(state));
    });
    cellarBloc.stream.listen((state) {
      add(CellarChanged(state));
    });
    floorStructuresBloc.stream.listen((state) {
      add(FloorStructuresChanged(state));
    });
    internalWallFramesAndSurfaceMaterialBloc.stream.listen((state) {
      add(InternalWallFramesAndSurfaceMaterialChanged(state));
    });
    windowsBloc.stream.listen((state) {
      add(WindowsChanged(state));
    });
    hvacAndElectricalInstallationsBloc.stream.listen((state) {
      add(HvacAndElectricalInstallationsChanged(state));
    });
    machinesAndEquipmentsBloc.stream.listen((state) {
      add(MachinesAndEquipmentsChanged(state));
    });
    fixturesAndStructuresBloc.stream.listen((state) {
      add(FixturesAndStructuresChanged(state));
    });
    yardAndProtectiveStructuresBloc.stream.listen((state) {
      add(YardAndProtectiveStructuresChanged(state));
    });
    reusableAndRecyclableMaterialsBloc.stream.listen((state) {
      add(ReusableAndRecyclableMaterialsChanged(state));
    });
  }
}
