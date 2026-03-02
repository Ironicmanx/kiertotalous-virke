import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_bloc.dart';
import 'package:flutter_app/src/sp-bloc/foundation_bloc.dart';
import 'package:flutter_app/src/sp-bloc/thermal_center_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_demolition_waste_and_costs_event.dart';
import 'package:flutter_app/src/sp-bloc/total_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_recyclable_components_and_furniture_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/sp-bloc/walls_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertiesTotalDemolitionWasteAndCostsBloc extends Bloc<
    SmallPropertiesTotalDemolitionWasteAndCostsEvent,
    SmallPropertiesTotalDemolitionWasteAndCosts> {
  final SmallPropertiesTotalReusableAndRecyclableMaterialsBloc
      reusableMaterialsBloc;
  final SmallPropertiesTotalRecyclableComponentsAndFurnitureBloc
      recyclableComponentsBloc;
  final SmallPropertiesTotalDisposalMaterialsAndHazardousWasteBloc
      disposalMaterialsBloc;
  final SmallPropertiesFoundationBloc foundationBloc;
  final CarportOrGarageBloc carportOrGarageBloc;
  final ThermalCenterBloc thermalCenterBloc;
  final WallsBloc wallsBloc;

  SmallPropertiesTotalDemolitionWasteAndCostsBloc({
    required this.reusableMaterialsBloc,
    required this.recyclableComponentsBloc,
    required this.disposalMaterialsBloc,
    required this.foundationBloc,
    required this.carportOrGarageBloc,
    required this.thermalCenterBloc,
    required this.wallsBloc,
  }) : super(
          SmallPropertiesTotalDemolitionWasteAndCosts().copyWith(
            totalReusableAndRecyclableMaterials: reusableMaterialsBloc.state,
            totalRecyclableComponentsAndFurniture:
                recyclableComponentsBloc.state,
            totalDisposalMaterialsAndHazardousWaste:
                disposalMaterialsBloc.state,
            foundation: foundationBloc.state,
            carportOrGarage: carportOrGarageBloc.state,
            thermalCenter: thermalCenterBloc.state,
            walls: wallsBloc.state,
          ),
        ) {
    reusableMaterialsBloc.stream.listen((state) {
      add(TotalReusableAndRecyclableMaterialsChanged(state));
    });

    recyclableComponentsBloc.stream.listen((state) {
      add(TotalRecyclableComponentsAndFurnitureChanged(state));
    });

    disposalMaterialsBloc.stream.listen((state) {
      add(TotalDisposalMaterialsAndHazardousWasteChanged(state));
    });

    foundationBloc.stream.listen((state) {
      add(FoundationChanged(state));
    });

    carportOrGarageBloc.stream.listen((state) {
      add(CarportOrGarageChanged(state));
    });

    thermalCenterBloc.stream.listen((state) {
      add(ThermalCenterChanged(state));
    });

    wallsBloc.stream.listen((state) {
      add(WallsChanged(state));
    });

    // Event handlers
    on<TotalReusableAndRecyclableMaterialsChanged>((event, emit) {
      emit(state.copyWith(
        totalReusableAndRecyclableMaterials:
            event.totalReusableAndRecyclableMaterials,
      ));
    });

    on<TotalRecyclableComponentsAndFurnitureChanged>((event, emit) {
      emit(state.copyWith(
        totalRecyclableComponentsAndFurniture:
            event.totalRecyclableComponentsAndFurniture,
      ));
    });

    on<TotalDisposalMaterialsAndHazardousWasteChanged>((event, emit) {
      emit(state.copyWith(
        totalDisposalMaterialsAndHazardousWaste:
            event.totalDisposalMaterialsAndHazardousWaste,
      ));
    });

    on<FoundationChanged>((event, emit) {
      emit(state.copyWith(
        foundation: event.foundation,
      ));
    });

    on<CarportOrGarageChanged>((event, emit) {
      emit(state.copyWith(
        carportOrGarage: event.carportOrGarage,
      ));
    });

    on<ThermalCenterChanged>((event, emit) {
      emit(state.copyWith(
        thermalCenter: event.thermalCenter,
      ));
    });

    on<WallsChanged>((event, emit) {
      emit(state.copyWith(
        walls: event.walls,
      ));
    });
  }
}
