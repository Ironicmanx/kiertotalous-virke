import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';
import '../data_types/fences_between_apartments.dart';

part 'machinery_equipment_and_fixed_structures.freezed.dart';
part 'machinery_equipment_and_fixed_structures.g.dart';

/// Koneet, laitteet ja kiinteät rakenteet
@freezed
abstract class MachineryEquipmentAndFixedStructures
    with _$MachineryEquipmentAndFixedStructures {
  const MachineryEquipmentAndFixedStructures._();

  const factory MachineryEquipmentAndFixedStructures({
    @Default(false) bool areElectricMotorsRecyclable,
    @Default(false) bool areVentilationMachinesRecyclable,
    num? electricMotors,
    num? ventilationMachines,
    num? electricalDistributionMachinesAndMeters,
    num? waterCirculationRadiators,
    @Default(false) bool areConcreteYardTilesAndWallStonesRecyclable,
    FencesBetweenApartments? fencesBetweenApartments,
    num? concreteYardTilesAndStonesInSquareMeters,
    num? fencesBetweenApartmentsInMeters,
  }) = _MachineryEquipmentAndFixedStructures;

  factory MachineryEquipmentAndFixedStructures.fromJson(
          Map<String, dynamic> json) =>
      _$MachineryEquipmentAndFixedStructuresFromJson(json);

  /// Sähkömoottorit (kg)
  num? get electricMotorsWeightKg => Utils.multiplyOrNull([
        electricMotors,
        FurnitureDressingKitchenToiletSpaceWeights.electricEngineKgPerPcs
      ]);

  /// Ilmanvaihtokoneet (kg)
  /// This calculation counts wrong, it directs to wrong value in the original excel file
  num? get ventilationMachinesWeightKg => Utils.multiplyOrNull([
        ventilationMachines,
        FurnitureDressingKitchenToiletSpaceWeights.electricCentralKgPerPcs
      ]);

  /// Sähköjakokaapit ja mittarit (kg)
  num? get electricalDistributionMachinesAndMetersWeightKg =>
      Utils.multiplyOrNull([
        electricalDistributionMachinesAndMeters,
        FurnitureDressingKitchenToiletSpaceWeights.electricCentralKgPerPcs
      ]);

  /// Materiaalimäärätaulukkoon luettava arvo, sähköjakokaapit ja mittarit (tonnia)
  num? get electricalDistributionMachinesAndMetersWeighTons {
    return electricalDistributionMachinesAndMetersWeightKg != null
        ? electricalDistributionMachinesAndMetersWeightKg! / 1000
        : null;
  }

  /// Vesikiertoiset lämpöpatterit (kg)
  num? get waterCirculationRadiatorsWeightKg => Utils.multiplyOrNull([
        waterCirculationRadiators,
        FurnitureDressingKitchenToiletSpaceWeights
            .centralHeatingRadiatorsWaterCirculatinKgPerPcs
      ]);

  /// Betoniset pihalaatoitukset ja muurikivet (tonnia)
  num? get concreteYardTilesAndStonesWeightTons {
    num? multiply = Utils.multiplyOrNull([
      concreteYardTilesAndStonesInSquareMeters,
      YardStructureWeights.concreteYardTilesAndStonesKgPerSqm
    ]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävät pihalaatoitukset ja muurikivet (tonnia)
  num? get recyclableConcreteYardTilesAndStonesWeightTons {
    if (areConcreteYardTilesAndWallStonesRecyclable) {
      return concreteYardTilesAndStonesWeightTons;
    }
    return null;
  }

  /// Huoneistojen väliset aidat (tonnia)
  num? get fencesBetweenApartmentsWeightTons {
    if (fencesBetweenApartments == FencesBetweenApartments.woodenFence) {
      num? multiply = Utils.multiplyOrNull([
        fencesBetweenApartmentsInMeters,
        YardStructureWeights.woodenFencesHeight1_2mKgPerM
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    } else if (fencesBetweenApartments ==
        FencesBetweenApartments.steelMeshFence) {
      num? multiply = Utils.multiplyOrNull([
        fencesBetweenApartmentsInMeters,
        YardStructureWeights.steelMeshFencesHeight1_2mKgPerM
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    } else if (fencesBetweenApartments ==
        FencesBetweenApartments.aluminiumMeshFence) {
      num? multiply = Utils.multiplyOrNull([
        fencesBetweenApartmentsInMeters,
        YardStructureWeights.aluminiumMeshFencesHeight1_2mKgPerM
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    }
    return null;
  }

  /// Materiaalimäärätaulukkooon luettava arvo, polttokelpoinen puujäte
  num? get burnableWoodTons {
    if (fencesBetweenApartments == FencesBetweenApartments.woodenFence) {
      return fencesBetweenApartmentsWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, alumiini
  num? get aluminiumFence {
    if (fencesBetweenApartments == FencesBetweenApartments.aluminiumMeshFence) {
      return fencesBetweenApartmentsWeightTons;
    }
    return null;
  }

  /// Next calculations are from Laskenta tab

  /// Teräsverkko, tonnia
  num? get steelMeshWeightTons {
    if (fencesBetweenApartments == FencesBetweenApartments.steelMeshFence) {
      num? multiply = Utils.multiplyOrNull([
        fencesBetweenApartmentsInMeters,
        YardStructureWeights.steelMeshFencesHeight1_2mKgPerM
      ]);
      if (multiply == null) {
        return null;
      }
      return multiply / 1000;
    }
    return null;
  }

  /// Sähkömoottorit (tonnia)
  /// This calculation counts counts wrong, it multiplies the number of electric motors with the weight of electric motors which has already been multiplied
  num? get electricMotorsWeightTons {
    num? multiply =
        Utils.multiplyOrNull([electricMotors, electricMotorsWeightKg]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrättämätön sähkömoottori
  num? get notRecyclableElectricMotorsWeightTons {
    if (areElectricMotorsRecyclable == false) {
      return electricMotorsWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävä sähkömoottori
  num? get recyclableElectricMotorsWeightTons {
    if (areElectricMotorsRecyclable == true) {
      return electricMotorsWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävä sähkömoottori (kpl)
  num? get recyclableElectricMotorsPieces {
    if (areElectricMotorsRecyclable == true) {
      return electricMotors;
    }
    return null;
  }

  /// Ilmanvaihtokoneet (tonnia)
  /// Same problem here
  num? get ventilationMachinesWeightTons {
    num? multiply = Utils.multiplyOrNull(
        [ventilationMachines, ventilationMachinesWeightKg]);
    if (multiply == null) {
      return null;
    }
    return multiply / 1000;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrättämätön ilmanvaihtokone (tonnia)
  num? get notRecyclableVentilationMachinesWeightTons {
    if (areVentilationMachinesRecyclable == false) {
      return ventilationMachinesWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävä ilmanvaihtokone (tonnia)
  num? get recyclableVentilationMachinesWeightTons {
    if (areVentilationMachinesRecyclable == true) {
      return ventilationMachinesWeightTons;
    }
    return null;
  }

  /// Materiaalimäärätaulukkoon luettava arvo, kierrätettävä ilmanvaihtokone (kpl)
  num? get recyclableVentilationMachinesPieces {
    if (areVentilationMachinesRecyclable == true) {
      return ventilationMachines;
    }
    return null;
  }

  /// Lämpöpatterit vesikiertoiset (tonnia)
  num? get waterCirculationRadiatorsWeightTons {
    if (waterCirculationRadiators == null) {
      return null;
    }
    return waterCirculationRadiatorsWeightKg! / 1000;
  }

  num? get recyclableYardTiles {
    if (areConcreteYardTilesAndWallStonesRecyclable) {
      return concreteYardTilesAndStonesWeightTons;
    }
    return null;
  }
}
