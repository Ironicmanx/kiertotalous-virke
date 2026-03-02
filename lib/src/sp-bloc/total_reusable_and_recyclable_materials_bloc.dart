import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_note_bloc.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_handling_costs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_material_value_bloc.dart';
import 'package:flutter_app/src/sp-bloc/machinery_bloc.dart';
import 'package:flutter_app/src/sp-bloc/quantities_to_material_form_bloc.dart';
import 'package:flutter_app/src/sp-bloc/reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/sp-bloc/roofs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/small_property_basic_info_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_excavation_area_bloc.dart';
import 'package:flutter_app/src/sp-bloc/total_reusable_and_recyclable_materials_event.dart';
import 'package:flutter_app/src/sp-bloc/foundation_bloc.dart';
import 'package:flutter_app/src/sp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_bloc.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_bloc.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/thermal_center_bloc.dart';
import 'package:flutter_app/src/sp-bloc/walls_bloc.dart';
import 'package:flutter_app/src/sp-bloc/yard_roof_bloc.dart';

class SmallPropertiesTotalReusableAndRecyclableMaterialsBloc extends Bloc<
    SmallPropertiesTotalReusableAndRecyclableMaterialsEvent,
    SmallPropertiesTotalReusableAndRecyclableMaterials> {
  final SBExcavationAreaBloc excavationAreaBloc;
  final SmallPropertiesFoundationBloc foundationBloc;
  final SPInnerDoorsBloc innerDoorsBloc;
  final SPOuterDoorsBloc outerDoorsBloc;
  final SpWindowsBloc windowsBloc;
  final SmallPropertiesReusableAndRecyclableMaterialsBloc
      reusableAndRecyclableMaterialsBloc;
  final ApartmentBloc apartmentBloc;
  final ApartmentSizeBloc apartmentSizeBloc;
  final CarportOrGarageBloc carportOrGarageBloc;
  final QuantitiesToMaterialFormBloc counterBloc;
  final HallDoorsBloc hallDoorsBloc;
  final SmallPropertiesElectricalInstallationsAndHvacBloc hvacBloc;
  final SPMachineryBloc machineryEquipmentBloc;
  final PassageDoorsBloc passageDoorsBloc;
  final RecyclableMaterialsNotesBloc recyclableMaterialsNotesBloc;
  final RecyclableMaterialsMaterialValueBloc materialValueBloc;
  final RecyclableMaterialsHandlingCostsBloc handlingCostsBloc;
  final SmallPropertiesRoofsBloc roofBloc;
  final SmallPropertyBasicInfoBloc evaluationInfoBloc;
  final ThermalCenterBloc thermalCenterBloc;
  final WallsBloc wallsBloc;
  final YardRoofBloc yardRoofBloc;

  SmallPropertiesTotalReusableAndRecyclableMaterialsBloc({
    required this.excavationAreaBloc,
    required this.foundationBloc,
    required this.innerDoorsBloc,
    required this.outerDoorsBloc,
    required this.windowsBloc,
    required this.reusableAndRecyclableMaterialsBloc,
    required this.apartmentBloc,
    required this.apartmentSizeBloc,
    required this.carportOrGarageBloc,
    required this.counterBloc,
    required this.hallDoorsBloc,
    required this.hvacBloc,
    required this.machineryEquipmentBloc,
    required this.passageDoorsBloc,
    required this.recyclableMaterialsNotesBloc,
    required this.materialValueBloc,
    required this.handlingCostsBloc,
    required this.roofBloc,
    required this.evaluationInfoBloc,
    required this.thermalCenterBloc,
    required this.wallsBloc,
    required this.yardRoofBloc,
  }) : super(
          SmallPropertiesTotalReusableAndRecyclableMaterials().copyWith(
            smallPropertiesExcavationArea: excavationAreaBloc.state,
            foundation: foundationBloc.state,
            innerDoors: innerDoorsBloc.state,
            outerDoors: outerDoorsBloc.state,
            windows: windowsBloc.state,
            reusableAndRecyclableMaterials:
                reusableAndRecyclableMaterialsBloc.state,
            apartment: apartmentBloc.state,
            apartmentSize: apartmentSizeBloc.state,
            carportOrGarage: carportOrGarageBloc.state,
            counter: counterBloc.state,
            hallDoors: hallDoorsBloc.state,
            hvac: hvacBloc.state,
            machineryEquipmentAndFixedStructures: machineryEquipmentBloc.state,
            passageDoors: passageDoorsBloc.state,
            recyclableMaterialsNotes: recyclableMaterialsNotesBloc.state,
            materialValue: materialValueBloc.state,
            handlingAndDismantlingCosts: handlingCostsBloc.state,
            roof: roofBloc.state,
            smallPropertyEvaluationInfo: evaluationInfoBloc.state,
            thermalCenter: thermalCenterBloc.state,
            walls: wallsBloc.state,
            yardRoof: yardRoofBloc.state,
          ),
        ) {
    on<SmallPropertiesExcavationAreaChanged>((event, emit) {
      emit(state.copyWith(smallPropertiesExcavationArea: event.excavationArea));
      logger.d(
          "smallPropertiesExcavationArea changed to: ${event.excavationArea}");
    });

    on<SmallPropertiesFoundationChanged>((event, emit) {
      emit(state.copyWith(foundation: event.foundation));
      logger.d("foundation changed to: ${event.foundation}");
    });

    on<SmallPropertyInnerDoorsChanged>((event, emit) {
      emit(state.copyWith(innerDoors: event.innerDoors));
      logger.d("innerDoors changed to: ${event.innerDoors}");
    });

    on<SmallPropertyOuterDoorsChanged>((event, emit) {
      emit(state.copyWith(outerDoors: event.outerDoors));
      logger.d("outerDoors changed to: ${event.outerDoors}");
    });

    on<SmallPropertyWindowsChanged>((event, emit) {
      emit(state.copyWith(windows: event.windows));
      logger.d("windows changed to: ${event.windows}");
    });

    on<SmallPropertiesReusableAndRecyclableMaterialsChanged>((event, emit) {
      emit(state.copyWith(
          reusableAndRecyclableMaterials:
              event.reusableAndRecyclableMaterials));
      logger.d(
          "reusableAndRecyclableMaterials changed to: ${event.reusableAndRecyclableMaterials}");
    });

    on<ApartmentChanged>((event, emit) {
      emit(state.copyWith(apartment: event.apartment));
      logger.d("apartment changed to: ${event.apartment}");
    });

    on<ApartmentSizeChanged>((event, emit) {
      emit(state.copyWith(apartmentSize: event.apartmentSize));
      logger.d("apartmentSize changed to: ${event.apartmentSize}");
    });

    on<ApartmentsChanged>((event, emit) {
      emit(state.copyWith(apartments: event.apartments));
      logger.d("apartments changed to: ${event.apartments}");
    });

    on<CarportOrGarageChanged>((event, emit) {
      emit(state.copyWith(carportOrGarage: event.carportOrGarage));
      logger.d("carportOrGarage changed to: ${event.carportOrGarage}");
    });

    on<CounterChanged>((event, emit) {
      emit(state.copyWith(counter: event.counter));
      logger.d("counter changed to: ${event.counter}");
    });

    on<HallDoorsChanged>((event, emit) {
      emit(state.copyWith(hallDoors: event.hallDoors));
      logger.d("hallDoors changed to: ${event.hallDoors}");
    });

    on<HvacChanged>((event, emit) {
      emit(state.copyWith(hvac: event.hvac));
      logger.d("hvac changed to: ${event.hvac}");
    });

    on<MachineryEquipmentAndFixedStructuresChanged>((event, emit) {
      emit(state.copyWith(
          machineryEquipmentAndFixedStructures:
              event.machineryEquipmentAndFixedStructures));
      logger.d(
          "machineryEquipmentAndFixedStructures changed to: ${event.machineryEquipmentAndFixedStructures}");
    });

    on<PassageDoorsChanged>((event, emit) {
      emit(state.copyWith(passageDoors: event.passageDoors));
      logger.d("passageDoors changed to: ${event.passageDoors}");
    });

    on<RecyclableMaterialsNotesChanged>((event, emit) {
      emit(state.copyWith(
          recyclableMaterialsNotes: event.recyclableMaterialsNotes));
      logger.d(
          "recyclableMaterialsNotes changed to: ${event.recyclableMaterialsNotes}");
    });

    on<RecyclableMaterialsMaterialValueChanged>((event, emit) {
      emit(state.copyWith(materialValue: event.materialValue));
      logger.d("materialValue changed to: ${event.materialValue}");
    });

    on<RecyclableMaterialsHandlingAndDismantlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          handlingAndDismantlingCosts: event.handlingAndDismantlingCosts));
      logger.d(
          "handlingAndDismantlingCosts changed to: ${event.handlingAndDismantlingCosts}");
    });

    on<RoofChanged>((event, emit) {
      emit(state.copyWith(roof: event.roof));
      logger.d("roof changed to: ${event.roof}");
    });

    on<SmallPropertyEvaluationInfoChanged>((event, emit) {
      emit(state.copyWith(
          smallPropertyEvaluationInfo: event.smallPropertyEvaluationInfo));
      logger.d(
          "smallPropertyEvaluationInfo changed to: ${event.smallPropertyEvaluationInfo}");
    });

    on<ThermalCenterChanged>((event, emit) {
      emit(state.copyWith(thermalCenter: event.thermalCenter));
      logger.d("thermalCenter changed to: ${event.thermalCenter}");
    });

    on<WallsChanged>((event, emit) {
      emit(state.copyWith(walls: event.walls));
      logger.d("walls changed to: ${event.walls}");
    });

    on<YardRoofChanged>((event, emit) {
      emit(state.copyWith(yardRoof: event.yardRoof));
      logger.d("yardRoof changed to: ${event.yardRoof}");
    });

    excavationAreaBloc.stream.listen((state) {
      add(SmallPropertiesExcavationAreaChanged(state));
    });

    foundationBloc.stream.listen((state) {
      add(SmallPropertiesFoundationChanged(state));
    });

    innerDoorsBloc.stream.listen((state) {
      add(SmallPropertyInnerDoorsChanged(state));
    });

    outerDoorsBloc.stream.listen((state) {
      add(SmallPropertyOuterDoorsChanged(state));
    });

    windowsBloc.stream.listen((state) {
      add(SmallPropertyWindowsChanged(state));
    });

    reusableAndRecyclableMaterialsBloc.stream.listen((state) {
      add(SmallPropertiesReusableAndRecyclableMaterialsChanged(state));
    });

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

    hallDoorsBloc.stream.listen((state) {
      add(HallDoorsChanged(state));
    });

    hvacBloc.stream.listen((state) {
      add(HvacChanged(state));
    });

    machineryEquipmentBloc.stream.listen((state) {
      add(MachineryEquipmentAndFixedStructuresChanged(state));
    });

    passageDoorsBloc.stream.listen((state) {
      add(PassageDoorsChanged(state));
    });

    recyclableMaterialsNotesBloc.stream.listen((state) {
      add(RecyclableMaterialsNotesChanged(state));
    });

    materialValueBloc.stream.listen((state) {
      add(RecyclableMaterialsMaterialValueChanged(state));
    });

    handlingCostsBloc.stream.listen((state) {
      add(RecyclableMaterialsHandlingAndDismantlingCostsChanged(state));
    });

    roofBloc.stream.listen((state) {
      add(RoofChanged(state));
    });

    evaluationInfoBloc.stream.listen((state) {
      add(SmallPropertyEvaluationInfoChanged(state));
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
