import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_bloc.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_costs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_notes_bloc.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_bloc.dart';
import 'package:flutter_app/src/sp-bloc/foundation_bloc.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/machinery_bloc.dart';
import 'package:flutter_app/src/sp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/quantities_to_material_form_bloc.dart';
import 'package:flutter_app/src/sp-bloc/roofs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/small_property_basic_info_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_excavation_area_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_bloc.dart';
import 'package:flutter_app/src/sp-bloc/thermal_center_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_disposal_materials_and_hazardous_waste_event.dart';
import 'package:flutter_app/src/sp-bloc/walls_bloc.dart';
import 'package:flutter_app/src/sp-bloc/yard_roof_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertiesTotalDisposalMaterialsAndHazardousWasteBloc extends Bloc<
    SmallPropertiesTotalDisposalMaterialsAndHazardousWasteEvent,
    SmallPropertiesTotalDisposalMaterialsAndHazardousWaste> {
  final ApartmentBloc apartmentBloc;
  final ApartmentSizeBloc apartmentSizeBloc;
  final CarportOrGarageBloc carportOrGarageBloc;
  final QuantitiesToMaterialFormBloc counterBloc;
  final DisposableAndHazardousNotesBloc disposableAndHazardousNotesBloc;
  final DisposableAndHazardousCostsBloc disposableAndHazardousCostsBloc;
  final HallDoorsBloc hallDoorsBloc;
  final SmallPropertiesElectricalInstallationsAndHvacBloc hvacBloc;
  final SPMachineryBloc machineryEquipmentBloc;
  final PassageDoorsBloc passageDoorsBloc;
  final SmallPropertiesRoofsBloc roofBloc;
  final SBExcavationAreaBloc excavationAreaBloc;
  final SmallPropertiesFoundationBloc foundationBloc;
  final SmallPropertyBasicInfoBloc evaluationInfoBloc;
  final SPInnerDoorsBloc innerDoorsBloc;
  final SPOuterDoorsBloc outerDoorsBloc;
  final SpWindowsBloc windowsBloc;
  final ThermalCenterBloc thermalCenterBloc;
  final WallsBloc wallsBloc;
  final YardRoofBloc yardRoofBloc;

  SmallPropertiesTotalDisposalMaterialsAndHazardousWasteBloc({
    required this.apartmentBloc,
    required this.apartmentSizeBloc,
    required this.carportOrGarageBloc,
    required this.counterBloc,
    required this.disposableAndHazardousNotesBloc,
    required this.disposableAndHazardousCostsBloc,
    required this.hallDoorsBloc,
    required this.hvacBloc,
    required this.machineryEquipmentBloc,
    required this.passageDoorsBloc,
    required this.roofBloc,
    required this.excavationAreaBloc,
    required this.foundationBloc,
    required this.evaluationInfoBloc,
    required this.innerDoorsBloc,
    required this.outerDoorsBloc,
    required this.windowsBloc,
    required this.thermalCenterBloc,
    required this.wallsBloc,
    required this.yardRoofBloc,
  }) : super(
          SmallPropertiesTotalDisposalMaterialsAndHazardousWaste().copyWith(
            apartment: apartmentBloc.state,
            apartmentSize: apartmentSizeBloc.state,
            carportOrGarage: carportOrGarageBloc.state,
            counter: counterBloc.state,
            disposableAndHazardousNotes: disposableAndHazardousNotesBloc.state,
            costs: disposableAndHazardousCostsBloc.state,
            hallDoors: hallDoorsBloc.state,
            hvac: hvacBloc.state,
            machineryEquipmentAndFixedStructures: machineryEquipmentBloc.state,
            passageDoors: passageDoorsBloc.state,
            roof: roofBloc.state,
            smallPropertiesExcavationArea: excavationAreaBloc.state,
            foundation: foundationBloc.state,
            smallPropertyEvaluationInfo: evaluationInfoBloc.state,
            innerDoors: innerDoorsBloc.state,
            outerDoors: outerDoorsBloc.state,
            windows: windowsBloc.state,
            thermalCenter: thermalCenterBloc.state,
            walls: wallsBloc.state,
            yardRoof: yardRoofBloc.state,
          ),
        ) {
    on<ApartmentChanged>((event, emit) {
      emit(state.copyWith(apartment: event.apartment));
    });

    on<ApartmentSizeChanged>((event, emit) {
      emit(state.copyWith(apartmentSize: event.apartmentSize));
    });

    on<ApartmentsChanged>((event, emit) {
      emit(state.copyWith(apartments: event.apartments));
    });

    on<CarportOrGarageChanged>((event, emit) {
      emit(state.copyWith(carportOrGarage: event.carportOrGarage));
    });

    on<CounterChanged>((event, emit) {
      emit(state.copyWith(counter: event.counter));
    });

    on<DisposableAndHazardousNotesChanged>((event, emit) {
      emit(state.copyWith(
          disposableAndHazardousNotes: event.disposableAndHazardousNotes));
    });

    on<DisposableAndHazardousCostsChanged>((event, emit) {
      emit(state.copyWith(costs: event.costs));
    });

    on<HallDoorsChanged>((event, emit) {
      emit(state.copyWith(hallDoors: event.hallDoors));
    });

    on<HvacChanged>((event, emit) {
      emit(state.copyWith(hvac: event.hvac));
    });

    on<MachineryEquipmentChanged>((event, emit) {
      emit(state.copyWith(
          machineryEquipmentAndFixedStructures:
              event.machineryEquipmentAndFixedStructures));
    });

    on<PassageDoorsChanged>((event, emit) {
      emit(state.copyWith(passageDoors: event.passageDoors));
    });

    on<RoofChanged>((event, emit) {
      emit(state.copyWith(roof: event.roof));
    });

    on<ExcavationAreaChanged>((event, emit) {
      emit(state.copyWith(
          smallPropertiesExcavationArea: event.smallPropertiesExcavationArea));
    });

    on<FoundationChanged>((event, emit) {
      emit(state.copyWith(foundation: event.foundation));
    });

    on<EvaluationInfoChanged>((event, emit) {
      emit(state.copyWith(
          smallPropertyEvaluationInfo: event.smallPropertyEvaluationInfo));
    });

    on<InnerDoorsChanged>((event, emit) {
      emit(state.copyWith(innerDoors: event.innerDoors));
    });

    on<OuterDoorsChanged>((event, emit) {
      emit(state.copyWith(outerDoors: event.outerDoors));
    });

    on<WindowsChanged>((event, emit) {
      emit(state.copyWith(windows: event.windows));
    });

    on<ThermalCenterChanged>((event, emit) {
      emit(state.copyWith(thermalCenter: event.thermalCenter));
    });

    on<WallsChanged>((event, emit) {
      emit(state.copyWith(walls: event.walls));
    });

    on<YardRoofChanged>((event, emit) {
      emit(state.copyWith(yardRoof: event.yardRoof));
    });

    // Stream listeners
    apartmentBloc.stream.listen((state) {
      add(ApartmentChanged(state));
    });

    apartmentSizeBloc.stream.listen((state) {
      add(ApartmentSizeChanged(state));
    });

    carportOrGarageBloc.stream.listen((state) {
      add(CarportOrGarageChanged(state));
    });

    counterBloc.stream.listen((state) {
      add(CounterChanged(state));
    });

    disposableAndHazardousNotesBloc.stream.listen((state) {
      add(DisposableAndHazardousNotesChanged(state));
    });

    disposableAndHazardousCostsBloc.stream.listen((state) {
      add(DisposableAndHazardousCostsChanged(state));
    });

    hallDoorsBloc.stream.listen((state) {
      add(HallDoorsChanged(state));
    });

    hvacBloc.stream.listen((state) {
      add(HvacChanged(state));
    });

    machineryEquipmentBloc.stream.listen((state) {
      add(MachineryEquipmentChanged(state));
    });

    passageDoorsBloc.stream.listen((state) {
      add(PassageDoorsChanged(state));
    });

    roofBloc.stream.listen((state) {
      add(RoofChanged(state));
    });

    excavationAreaBloc.stream.listen((state) {
      add(ExcavationAreaChanged(state));
    });

    foundationBloc.stream.listen((state) {
      add(FoundationChanged(state));
    });

    evaluationInfoBloc.stream.listen((state) {
      add(EvaluationInfoChanged(state));
    });

    innerDoorsBloc.stream.listen((state) {
      add(InnerDoorsChanged(state));
    });

    outerDoorsBloc.stream.listen((state) {
      add(OuterDoorsChanged(state));
    });

    windowsBloc.stream.listen((state) {
      add(WindowsChanged(state));
    });

    thermalCenterBloc.stream.listen((state) {
      add(ThermalCenterChanged(state));
    });

    wallsBloc.stream.listen((state) {
      add(WallsChanged(state));
    });

    yardRoofBloc.stream.listen((state) {
      add(YardRoofChanged(state));
    });
  }
}
