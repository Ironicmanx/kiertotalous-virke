import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_event.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_reusable_and_recyclable_materials_bloc.dart';

class TotalDemolitionWasteAndCostsBloc extends Bloc<
    TotalDemolitionWasteAndCostsEvent, TotalDemolitionWasteAndCosts> {
  final DemolitionWasteAndCostsBloc demolitionWasteAndCostsBloc;
  final TotalReusableAndRecyclableMaterialsBloc
      totalReusableAndRecyclableMaterialsBloc;
  final TotalRecyclableComponentsAndFurnitureBloc
      totalRecyclableComponentsAndFurnitureBloc;
  final TotalDisposalMaterialsAndHazardousWasteBloc
      totalDisposalMaterialsAndHazardousWasteBloc;
  final TotalBuildingDimensionsBloc totalBuildingDimensionsBloc;

  TotalDemolitionWasteAndCostsBloc({
    required this.demolitionWasteAndCostsBloc,
    required this.totalReusableAndRecyclableMaterialsBloc,
    required this.totalRecyclableComponentsAndFurnitureBloc,
    required this.totalDisposalMaterialsAndHazardousWasteBloc,
    required this.totalBuildingDimensionsBloc,
  }) : super(
          TotalDemolitionWasteAndCosts().copyWith(
            demolitionWasteAndCosts: demolitionWasteAndCostsBloc.state,
            totalReusableAndRecyclableMaterials:
                totalReusableAndRecyclableMaterialsBloc.state,
            totalRecyclableComponentsAndFurniture:
                totalRecyclableComponentsAndFurnitureBloc.state,
            totalDisposalMaterialsAndHazardousWaste:
                totalDisposalMaterialsAndHazardousWasteBloc.state,
            totalBuildingDimensions: totalBuildingDimensionsBloc.state,
          ),
        ) {
    on<DemolitionWasteAndCostsChanged>((event, emit) {
      emit(
        state.copyWith(
          demolitionWasteAndCosts: event.demolitionWasteAndCosts,
        ),
      );
      logger.d(
          "TotalDemolitionWasteAndCosts.demolitionWasteAndCosts changed to: ${event.demolitionWasteAndCosts}");
    });

    on<TotalReusableAndRecyclableMaterialsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalReusableAndRecyclableMaterials:
              event.totalReusableAndRecyclableMaterials,
        ),
      );
      logger.d(
          "TotalDemolitionWasteAndCosts.totalReusableAndRecyclableMaterials changed to: ${event.totalReusableAndRecyclableMaterials}");
    });

    on<TotalRecyclableComponentsAndFurnitureChanged>((event, emit) {
      emit(
        state.copyWith(
          totalRecyclableComponentsAndFurniture:
              event.totalRecyclableComponentsAndFurniture,
        ),
      );
      logger.d(
          "TotalDemolitionWasteAndCosts.totalRecyclableComponentsAndFurniture changed to: ${event.totalRecyclableComponentsAndFurniture}");
    });

    on<TotalDisposalMaterialsAndHazardousWasteChanged>((event, emit) {
      emit(
        state.copyWith(
          totalDisposalMaterialsAndHazardousWaste:
              event.totalDisposalMaterialsAndHazardousWaste,
        ),
      );
      logger.d(
          "TotalDemolitionWasteAndCosts.totalDisposalMaterialsAndHazardousWaste changed to: ${event.totalDisposalMaterialsAndHazardousWaste}");
    });

    on<TotalBuildingDimensionsChanged>((event, emit) {
      emit(
        state.copyWith(
          totalBuildingDimensions: event.totalBuildingDimensions,
        ),
      );
      logger.d(
          "TotalDemolitionWasteAndCosts.totalBuildingDimensions changed to: ${event.totalBuildingDimensions}");
    });

    // Listen to changes in child blocs
    demolitionWasteAndCostsBloc.stream.listen((state) {
      add(DemolitionWasteAndCostsChanged(state));
    });

    totalReusableAndRecyclableMaterialsBloc.stream.listen((state) {
      add(TotalReusableAndRecyclableMaterialsChanged(state));
    });

    totalRecyclableComponentsAndFurnitureBloc.stream.listen((state) {
      add(TotalRecyclableComponentsAndFurnitureChanged(state));
    });

    totalDisposalMaterialsAndHazardousWasteBloc.stream.listen((state) {
      add(TotalDisposalMaterialsAndHazardousWasteChanged(state));
    });

    totalBuildingDimensionsBloc.stream.listen((state) {
      add(TotalBuildingDimensionsChanged(state));
    });
  }
}
