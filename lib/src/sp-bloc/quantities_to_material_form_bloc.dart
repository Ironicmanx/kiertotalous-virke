import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_bloc.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_bloc.dart';
import 'package:flutter_app/src/sp-bloc/foundation_bloc.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/machinery_bloc.dart';
import 'package:flutter_app/src/sp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/roofs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/small_property_basic_info_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_excavation_area_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_bloc.dart';
import 'package:flutter_app/src/sp-bloc/thermal_center_bloc.dart';
import 'package:flutter_app/src/sp-bloc/walls_bloc.dart';
import 'package:flutter_app/src/sp-bloc/yard_roof_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

import 'quantities_to_material_form_event.dart';

class QuantitiesToMaterialFormBloc
    extends Bloc<QuantitiesToMaterialFormEvent, Counter> {
  final ApartmentBloc apartmentBloc;
  final ApartmentSizeBloc apartmentSizeBloc;
  final SmallPropertiesElectricalInstallationsAndHvacBloc hvacBloc;
  final SBExcavationAreaBloc excavationAreaBloc;
  final SmallPropertiesFoundationBloc foundationBloc;
  final SPInnerDoorsBloc innerDoorsBloc;
  final SPMachineryBloc machineryEquipmentBloc;
  final SPOuterDoorsBloc outerDoorsBloc;
  final SmallPropertiesRoofsBloc roofBloc;
  final SmallPropertyBasicInfoBloc evaluationInfoBloc;
  final WallsBloc wallsBloc;
  final SpWindowsBloc windowsBloc;
  final CarportOrGarageBloc carportOrGarageBloc;
  final HallDoorsBloc hallDoorsBloc;
  final PassageDoorsBloc passageDoorsBloc;
  final YardRoofBloc yardRoofBloc;
  final ThermalCenterBloc thermalCenterBloc;

  QuantitiesToMaterialFormBloc({
    required this.apartmentBloc,
    required this.apartmentSizeBloc,
    required this.hvacBloc,
    required this.excavationAreaBloc,
    required this.foundationBloc,
    required this.innerDoorsBloc,
    required this.machineryEquipmentBloc,
    required this.outerDoorsBloc,
    required this.roofBloc,
    required this.evaluationInfoBloc,
    required this.wallsBloc,
    required this.windowsBloc,
    required this.carportOrGarageBloc,
    required this.hallDoorsBloc,
    required this.passageDoorsBloc,
    required this.yardRoofBloc,
    required this.thermalCenterBloc,
  }) : super(Counter(
          apartment: apartmentBloc.state,
          apartmentSize: apartmentSizeBloc.state,
          hvac: hvacBloc.state,
          smallPropertiesExcavationArea: excavationAreaBloc.state,
          foundation: foundationBloc.state,
          innerDoors: innerDoorsBloc.state,
          machineryEquipmentAndFixedStructures: machineryEquipmentBloc.state,
          outerDoors: outerDoorsBloc.state,
          roof: roofBloc.state,
          smallPropertyEvaluationInfo: evaluationInfoBloc.state,
          walls: wallsBloc.state,
          windows: windowsBloc.state,
          carportOrGarage: carportOrGarageBloc.state,
          hallDoors: hallDoorsBloc.state,
          passageDoors: passageDoorsBloc.state,
          yardRoof: yardRoofBloc.state,
          thermalCenter: thermalCenterBloc.state,
        )) {
    on<QuantitiesToMaterialFormApartmentChanged>((event, emit) {
      emit(state.copyWith(apartment: event.apartment));
      logger.d('apartment changed to ${event.apartment}');
    });

    on<QuantitiesToMaterialFormApartmentSizeChanged>((event, emit) {
      emit(state.copyWith(apartmentSize: event.apartmentSize));
      logger.d('apartmentSize changed to ${event.apartmentSize}');
    });

    on<QuantitiesToMaterialFormApartmentsChanged>((event, emit) {
      emit(state.copyWith(apartments: event.apartments));
      logger.d('apartments changed to ${event.apartments}');
    });

    on<QuantitiesToMaterialFormHvacChanged>((event, emit) {
      emit(state.copyWith(hvac: event.hvac));
      logger.d('hvac changed to ${event.hvac}');
    });

    on<QuantitiesToMaterialFormExcavationAreaChanged>((event, emit) {
      emit(state.copyWith(smallPropertiesExcavationArea: event.excavationArea));
      logger.d('excavationArea changed to ${event.excavationArea}');
    });

    on<QuantitiesToMaterialFormFoundationChanged>((event, emit) {
      emit(state.copyWith(foundation: event.foundation));
      logger.d('foundation changed to ${event.foundation}');
    });

    on<QuantitiesToMaterialFormInnerDoorsChanged>((event, emit) {
      emit(state.copyWith(innerDoors: event.innerDoors));
      logger.d('innerDoors changed to ${event.innerDoors}');
    });

    on<QuantitiesToMaterialFormMachineryEquipmentChanged>((event, emit) {
      emit(state.copyWith(
          machineryEquipmentAndFixedStructures: event.machineryEquipment));
      logger.d('machineryEquipment changed to ${event.machineryEquipment}');
    });

    on<QuantitiesToMaterialFormOuterDoorsChanged>((event, emit) {
      emit(state.copyWith(outerDoors: event.outerDoors));
      logger.d('outerDoors changed to ${event.outerDoors}');
    });

    on<QuantitiesToMaterialFormRoofChanged>((event, emit) {
      emit(state.copyWith(roof: event.roof));
      logger.d('roof changed to ${event.roof}');
    });

    on<QuantitiesToMaterialFormEvaluationInfoChanged>((event, emit) {
      emit(state.copyWith(smallPropertyEvaluationInfo: event.evaluationInfo));
      logger.d('evaluationInfo changed to ${event.evaluationInfo}');
    });

    on<QuantitiesToMaterialFormWallsChanged>((event, emit) {
      emit(state.copyWith(walls: event.walls));
      logger.d('walls changed to ${event.walls}');
    });

    on<QuantitiesToMaterialFormWindowsChanged>((event, emit) {
      emit(state.copyWith(windows: event.windows));
      logger.d('windows changed to ${event.windows}');
    });

    on<QuantitiesToMaterialFormCarportOrGarageChanged>((event, emit) {
      emit(state.copyWith(carportOrGarage: event.carportOrGarage));
      logger.d('carportOrGarage changed to ${event.carportOrGarage}');
    });

    on<QuantitiesToMaterialFormHallDoorsChanged>((event, emit) {
      emit(state.copyWith(hallDoors: event.hallDoors));
      logger.d('hallDoors changed to ${event.hallDoors}');
    });

    on<QuantitiesToMaterialFormPassageDoorsChanged>((event, emit) {
      emit(state.copyWith(passageDoors: event.passageDoors));
      logger.d('passageDoors changed to ${event.passageDoors}');
    });

    on<QuantitiesToMaterialFormYardRoofChanged>((event, emit) {
      emit(state.copyWith(yardRoof: event.yardRoof));
      logger.d('yardRoof changed to ${event.yardRoof}');
    });

    on<QuantitiesToMaterialFormThermalCenterChanged>((event, emit) {
      emit(state.copyWith(thermalCenter: event.thermalCenter));
      logger.d('thermalCenter changed to ${event.thermalCenter}');
    });

    apartmentBloc.stream.listen((apartment) {
      add(QuantitiesToMaterialFormApartmentChanged(apartment));
    });

    apartmentSizeBloc.stream.listen((apartmentSize) {
      add(QuantitiesToMaterialFormApartmentSizeChanged(apartmentSize));
    });

    hvacBloc.stream.listen((hvac) {
      add(QuantitiesToMaterialFormHvacChanged(hvac));
    });

    excavationAreaBloc.stream.listen((excavationArea) {
      add(QuantitiesToMaterialFormExcavationAreaChanged(excavationArea));
    });

    foundationBloc.stream.listen((foundation) {
      add(QuantitiesToMaterialFormFoundationChanged(foundation));
    });

    innerDoorsBloc.stream.listen((innerDoors) {
      add(QuantitiesToMaterialFormInnerDoorsChanged(innerDoors));
    });

    machineryEquipmentBloc.stream.listen((machineryEquipment) {
      add(QuantitiesToMaterialFormMachineryEquipmentChanged(
          machineryEquipment));
    });

    outerDoorsBloc.stream.listen((outerDoors) {
      add(QuantitiesToMaterialFormOuterDoorsChanged(outerDoors));
    });

    roofBloc.stream.listen((roof) {
      add(QuantitiesToMaterialFormRoofChanged(roof));
    });

    evaluationInfoBloc.stream.listen((evaluationInfo) {
      add(QuantitiesToMaterialFormEvaluationInfoChanged(evaluationInfo));
    });

    wallsBloc.stream.listen((walls) {
      add(QuantitiesToMaterialFormWallsChanged(walls));
    });

    windowsBloc.stream.listen((windows) {
      add(QuantitiesToMaterialFormWindowsChanged(windows));
    });

    carportOrGarageBloc.stream.listen((carportOrGarage) {
      add(QuantitiesToMaterialFormCarportOrGarageChanged(carportOrGarage));
    });

    hallDoorsBloc.stream.listen((hallDoors) {
      add(QuantitiesToMaterialFormHallDoorsChanged(hallDoors));
    });

    passageDoorsBloc.stream.listen((passageDoors) {
      add(QuantitiesToMaterialFormPassageDoorsChanged(passageDoors));
    });

    yardRoofBloc.stream.listen((yardRoof) {
      add(QuantitiesToMaterialFormYardRoofChanged(yardRoof));
    });

    thermalCenterBloc.stream.listen((thermalCenter) {
      add(QuantitiesToMaterialFormThermalCenterChanged(thermalCenter));
    });
  }
}
