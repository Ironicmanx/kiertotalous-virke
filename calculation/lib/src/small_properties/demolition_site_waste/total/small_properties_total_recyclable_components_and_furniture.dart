import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../apartments/exports.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../quantities_to_material_form/quantities_to_material_form.dart';
import '../../yard_buildings_and_structures/exports.dart';
import '../exports.dart';

part 'small_properties_total_recyclable_components_and_furniture.freezed.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
abstract class SmallPropertiesTotalRecyclableComponentsAndFurniture
    with _$SmallPropertiesTotalRecyclableComponentsAndFurniture {
  SmallPropertiesTotalRecyclableComponentsAndFurniture._();

  factory SmallPropertiesTotalRecyclableComponentsAndFurniture(
          {Apartment? apartment,
          ApartmentSize? apartmentSize,
          Apartments? apartments,
          CarportOrGarage? carportOrGarage,
          Counter? counter,
          HallDoors? hallDoors,
          Hvac? hvac,
          MachineryEquipmentAndFixedStructures?
              machineryEquipmentAndFixedStructures,
          PassageDoors? passageDoors,
          RecyclableComponentsNotes? recyclableComponentsNotes,
          RecyclableComponentsHandlingAndDismantlingCosts? costs,
          RecyclableComponentsUnitPrice? unitPrice,
          Roof? roof,
          SmallPropertiesExcavationArea? smallPropertiesExcavationArea,
          SmallPropertiesFoundation? foundation,
          SmallPropertiesTotalReusableAndRecyclableMaterials?
              reusableAndRecyclableMaterials,
          SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo,
          SmallPropertyInnerDoors? innerDoors,
          SmallPropertyOuterDoors? outerDoors,
          SmallPropertyWindows? windows,
          ThermalCenter? thermalCenter,
          Walls? walls,
          YardRoof? yardRoof}) =
      _SmalllPropertiesTotalRecyclableComponentsAndFurniture;

  /// Puu- ja kuitulevyovet
  late final woodAndFiberboardDoors =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.woodenDoors,
    pcs: Utils.sumOrNull([
      outerDoors?.recyclableWoodDoorsPieces,
      passageDoors?.recyclableWoodDoorPieces,
      hallDoors?.recyclableWoodDoorPieces,
      innerDoors?.recyclableWoodenInnerDoorsPieces,
      innerDoors?.recyclablePanelInnerDoorsPieces
    ]),
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.woodAndFiberboardDoorsNotes,
    handlingAndDismantlingCost:
        costs?.woodAndFiberboardDoorsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.woodAndFiberboardDoorsUnitPrice,
  );

  /// Alumiiniovet
  late final aluminumDoors = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.aluminiumDoors,
    pcs: Utils.sumOrNull([
      outerDoors?.recyclableAluminiumDoorsPieces,
      passageDoors?.recyclableAluminiumDoorPieces,
      hallDoors?.recyclableAluminiumDoorPieces
    ]),
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.aluminumDoorsNotes,
    handlingAndDismantlingCost: costs?.aluminumDoorsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.aluminumDoorsUnitPrice,
  );

  /// Teräsovet
  late final steelDoors = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelDoors,
    pcs: Utils.sumOrNull([
      outerDoors?.recyclableSteelDoorsPieces,
      passageDoors?.recyclableSteelDoorPieces,
      hallDoors?.recyclableSteelDoorPieces
    ]),
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.steelDoorsNotes,
    handlingAndDismantlingCost: costs?.steelDoorsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.steelDoorsUnitPrice,
  );

  /// Puiset ikkunat
  late final woodenWindows = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.woodenWindows,
    pcs: windows?.recyclableWoodWindowsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.woodenWindowsNotes,
    handlingAndDismantlingCost: costs?.woodenWindowsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.woodenWindowsUnitPrice,
  );

  /// Teräskarmi-ikkunat
  late final steelFrameWindows =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelWindows,
    pcs: windows?.recyclableSteelWindowsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.steelFrameWindowsNotes,
    handlingAndDismantlingCost:
        costs?.steelFrameWindowsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.steelFrameWindowsUnitPrice,
  );

  /// Alumiinikarmi-ikkunat
  late final aluminumFrameWindows =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.aluminiumWindows,
    pcs: windows?.recyclableAluminiumWindowsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.aluminumFrameWindowsNotes,
    handlingAndDismantlingCost:
        costs?.aluminumFrameWindowsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.aluminumFrameWindowsUnitPrice,
  );

  /// WC-istuimet
  late final porcelainToilets =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.toiletSeatsRecyclable,
    pcs: apartmentSize?.recyclablePorcelainSeatPcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.porcelainToiletsNotes,
    handlingAndDismantlingCost:
        costs?.porcelainToiletsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.porcelainToiletsUnitPrice,
  );

  /// Kaapit ja kalusteet
  late final cabinetsAndFurniture =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.closetsAndFurniture,
    pcs: Utils.sumOrNull([
      apartmentSize?.recyclableDressingClosets,
      apartmentSize?.recyclableKitchenClosets
    ]),
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.cabinetsAndFurnitureNotes,
    handlingAndDismantlingCost:
        costs?.cabinetsAndFurnitureHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.cabinetsAndFurnitureUnitPrice,
  );

  /// Pesuallas, posliini kpl
  late final porcelainSinks = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.washingSinksRecyclable,
    pcs: apartmentSize?.recyclableWashingSinkPcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.porcelainSinksNotes,
    handlingAndDismantlingCost:
        costs?.porcelainSinksHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.porcelainSinksUnitPrice,
  );

  /// Teräsaltaat ja pöydät
  late final stainlessSteelSinksAndTables =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.steelSinksAndTables,
    pcs: apartmentSize?.recyclableSteelTablePcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.stainlessSteelSinksAndTablesNotes,
    handlingAndDismantlingCost:
        costs?.stainlessSteelSinksAndTablesHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.stainlessSteelSinksAndTablesUnitPrice,
  );

  /// Saunankiukaat
  late final saunaStove = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.saunaStovesRecyclable,
    pcs: apartmentSize?.recyclableSaunaStovePcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.saunaStovesNotes,
    handlingAndDismantlingCost: costs?.saunaStovesHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.saunaStovesUnitPrice,
  );

  /// Sähköliedet
  late final electricStove = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.electricStovesRecyclable,
    pcs: apartmentSize?.recyclableElectricStovePcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.electricStovesNotes,
    handlingAndDismantlingCost:
        costs?.electricStovesHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.electricStovesUnitPrice,
  );

  /// Jääkaapit
  late final refrigerator = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.refrigeratorsRecyclable,
    pcs: apartmentSize?.recyclableRefrigeratorPcs,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.refrigeratorsNotes,
    handlingAndDismantlingCost: costs?.refrigeratorsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.refrigeratorsUnitPrice,
  );

  /// Vesivaraajat
  late final waterAccumulator =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.waterAccumulatorsRecyclable,
    pcs: Utils.sumOrNull([
      apartmentSize?.recyclableWaterAccumulatorPcs,
      thermalCenter?.waterHeaterPcsRecyclable
    ]),
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.waterAccumulatorsNotes,
    handlingAndDismantlingCost:
        costs?.waterAccumulatorsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.waterAccumulatorsUnitPrice,
  );

  /// Sähkömoottorit
  late final electricMotors = SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.electricMotorsRecyclable,
    pcs: machineryEquipmentAndFixedStructures?.recyclableElectricMotorsPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.electricMotorsNotes,
    handlingAndDismantlingCost:
        costs?.electricMotorsHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.electricMotorsUnitPrice,
  );

  /// Ilmanvaihtokoneet
  late final ventilationMachines =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
    quantityEstimate: counter?.ventilationMachinesRecyclable,
    pcs: machineryEquipmentAndFixedStructures
        ?.recyclableVentilationMachinesPieces,
    exploitingOrProcessingOrFinalDisposalSite:
        recyclableComponentsNotes?.ventilationMachinesNotes,
    handlingAndDismantlingCost:
        costs?.ventilationMachinesHandlingAndDismantlingCosts,
    unitPrice: unitPrice?.ventilationMachinesUnitPrice,
  );

  /// Lämpökattila
  late final thermalBoiler = SmallPropertiesRecyclableComponentOrFurnitureItem(
      quantityEstimate: counter?.pelletBoilerRecyclable,
      pcs: thermalCenter?.recyclableHeatingMachinePieces,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableComponentsNotes?.thermalBoilerNotes);

  /// Kaukolämmönvaihdin
  late final districtHeatingExchanger =
      SmallPropertiesRecyclableComponentOrFurnitureItem(
          quantityEstimate: counter?.districtHeatExchangerRecyclable,
          pcs: thermalCenter?.recyclableDistrictHeatExchangerPieces,
          exploitingOrProcessingOrFinalDisposalSite:
              recyclableComponentsNotes?.districtHeatingExchangerNotes);

  List<SmallPropertiesRecyclableComponentOrFurnitureItem> get all => [
        woodAndFiberboardDoors,
        aluminumDoors,
        steelDoors,
        woodenWindows,
        steelFrameWindows,
        aluminumFrameWindows,
        porcelainToilets,
        cabinetsAndFurniture,
        porcelainSinks,
        stainlessSteelSinksAndTables,
        saunaStove,
        electricStove,
        refrigerator,
        waterAccumulator,
        electricMotors,
        ventilationMachines,
        thermalBoiler,
        districtHeatingExchanger,
      ];

  num? get totalQuantityEstimate =>
      all.fold<num>(0, (acc, element) => acc + (element.quantityEstimate ?? 0));

  num? get totalDemolitionCost => all.fold<num>(
      0, (acc, element) => acc + (element.demolitionCostPerMaterialBatch ?? 0));

  num? get totalBatchPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
