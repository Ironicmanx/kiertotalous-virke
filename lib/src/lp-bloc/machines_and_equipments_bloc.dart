import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/machines_and_equipments_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class MachinesAndEquipmentsBloc
    extends Bloc<MachinesAndEquipmentsEvent, MachinesAndEquipments> {
  MachinesAndEquipmentsBloc() : super(const MachinesAndEquipments()) {
    on<SmallElectricalWaterAccumulatorsWeightChanged>((event, emit) {
      logger.d("SmallElectricalWaterAccumulatorsChanged fired");
      emit(state.copyWith(
        smallElectricalAccumulators: SmallElectricalWaterAccumulators(
          weightKgPerPiece: event.value,
          quantity: state.smallElectricalAccumulators?.quantity,
        ),
      ));
    });
    on<SmallElectricalWaterAccumulatorsQuantityChanged>((event, emit) {
      logger.d("SmallElectricalWaterAccumulatorsChanged fired");
      emit(state.copyWith(
        smallElectricalAccumulators: SmallElectricalWaterAccumulators(
          weightKgPerPiece: state.smallElectricalAccumulators?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<LargeElectricalWaterAccumulatorsWeightChanged>((event, emit) {
      logger.d("LargeElectricalWaterAccumulatorsChanged fired");
      emit(state.copyWith(
        largeElectricalAccumulators: LargeElectricalWaterAccumulators(
          weightKgPerPiece: event.value,
          quantity: state.largeElectricalAccumulators?.quantity,
        ),
      ));
    });
    on<LargeElectricalWaterAccumulatorsQuantityChanged>((event, emit) {
      logger.d("LargeElectricalWaterAccumulatorsChanged fired");
      emit(state.copyWith(
        largeElectricalAccumulators: LargeElectricalWaterAccumulators(
          weightKgPerPiece: state.largeElectricalAccumulators?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<ElectricRadiatorsWeightChanged>((event, emit) {
      logger.d("ElectricRadiatorsWeightChanged fired");
      emit(state.copyWith(
        electricRadiators: ElectricRadiators(
          weightKgPerPiece: event.value,
          quantity: state.electricRadiators?.quantity,
        ),
      ));
    });
    on<ElectricRadiatorsQuantityChanged>((event, emit) {
      logger.d("ElectricRadiatorsQuantityChanged fired");
      emit(state.copyWith(
        electricRadiators: ElectricRadiators(
          weightKgPerPiece: state.electricRadiators?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<WaterCirculatedRadiatorsWeightChanged>((event, emit) {
      logger.d("WaterCirculatedRadiatorsWeightChanged fired");
      emit(state.copyWith(
        waterCirculatedRadiators: WaterCirculatedRadiators(
          weightKgPerPiece: event.value,
          quantity: state.waterCirculatedRadiators?.quantity,
        ),
      ));
    });
    on<WaterCirculatedRadiatorsQuantityChanged>((event, emit) {
      logger.d("WaterCirculatedRadiatorsQuantityChanged fired");
      emit(state.copyWith(
        waterCirculatedRadiators: WaterCirculatedRadiators(
          weightKgPerPiece: state.waterCirculatedRadiators?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<VentilationUnitsWeightChanged>((event, emit) {
      logger.d("VentilationUnitsWeightChanged fired");
      emit(state.copyWith(
        ventilationUnits: VentilationUnits(
          weightKgPerPiece: event.value,
          quantity: state.ventilationUnits?.quantity,
        ),
      ));
    });
    on<VentilationUnitsQuantityChanged>((event, emit) {
      logger.d("VentilationUnitsQuantityChanged fired");
      emit(state.copyWith(
        ventilationUnits: VentilationUnits(
          weightKgPerPiece: state.ventilationUnits?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<ElectricalDistributionCabinetsAndMetersWeightChanged>((event, emit) {
      logger.d("ElectricalDistributionCabinetsAndMetersWeightChanged fired");
      emit(state.copyWith(
        electricalDistributionCabinetsAndMeters:
            ElectricalDistributionCabinetsAndMeters(
          weightKgPerPiece: event.value,
          quantity: state.electricalDistributionCabinetsAndMeters?.quantity,
        ),
      ));
    });
    on<ElectricalDistributionCabinetsAndMetersQuantityChanged>((event, emit) {
      logger.d("ElectricalDistributionCabinetsAndMetersQuantityChanged fired");
      emit(state.copyWith(
        electricalDistributionCabinetsAndMeters:
            ElectricalDistributionCabinetsAndMeters(
          weightKgPerPiece:
              state.electricalDistributionCabinetsAndMeters?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<ElectricMotorsAndCirculationPumpsWeightChanged>((event, emit) {
      logger.d("ElectricMotorsAndCirculationPumpsWeightChanged fired");
      emit(state.copyWith(
        electricMotorsAndCirculationPumps: ElectricMotorsAndCirculationPumps(
          weightKgPerPiece: event.value,
          quantity: state.electricMotorsAndCirculationPumps?.quantity,
        ),
      ));
    });
    on<ElectricMotorsAndCirculationPumpsQuantityChanged>((event, emit) {
      logger.d("ElectricMotorsAndCirculationPumpsQuantityChanged fired");
      emit(state.copyWith(
        electricMotorsAndCirculationPumps: ElectricMotorsAndCirculationPumps(
          weightKgPerPiece:
              state.electricMotorsAndCirculationPumps?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<RoofExhaustFansWeightChanged>((event, emit) {
      logger.d("RoofExhaustFansWeightChanged fired");
      emit(state.copyWith(
        roofExhaustFans: RoofExhaustFans(
          weightKgPerPiece: event.value,
          quantity: state.roofExhaustFans?.quantity,
        ),
      ));
    });
    on<RoofExhaustFansQuantityChanged>((event, emit) {
      logger.d("RoofExhaustFansQuantityChanged fired");
      emit(state.copyWith(
        roofExhaustFans: RoofExhaustFans(
          weightKgPerPiece: state.roofExhaustFans?.weightKgPerPiece,
          quantity: event.value,
        ),
      ));
    });
    on<MachinesRecyclableChanged>((event, emit) {
      logger.d("MachinesRecyclableChanged fired");
      emit(state.copyWith(
        machinesRecyclable: event.value,
      ));
    });
  }
}
