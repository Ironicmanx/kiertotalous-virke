import 'package:freezed_annotation/freezed_annotation.dart';

import '../../small_properties/apartments/apartment.dart';
import '../../small_properties/apartments/apartment_size.dart';
import '../../small_properties/foundations_and_outer_shell/apartments.dart';
import '../../small_properties/foundations_and_outer_shell/electrical_installations_and_hvac.dart';
import '../../small_properties/foundations_and_outer_shell/machinery_equipment_and_fixed_structures.dart';
import '../../small_properties/foundations_and_outer_shell/roof.dart';
import '../../small_properties/foundations_and_outer_shell/small_properties_excavation_area.dart';
import '../../small_properties/foundations_and_outer_shell/small_properties_foundation.dart';
import '../../small_properties/foundations_and_outer_shell/small_property_evaluation_info.dart';
import '../../small_properties/foundations_and_outer_shell/small_property_inner_doors.dart';
import '../../small_properties/foundations_and_outer_shell/small_property_outer_doors.dart';
import '../../small_properties/foundations_and_outer_shell/small_property_windows.dart';
import '../../small_properties/foundations_and_outer_shell/walls.dart';
import '../../small_properties/yard_buildings_and_structures/carport_or_garage.dart';
import '../../small_properties/yard_buildings_and_structures/hall_doors.dart';
import '../../small_properties/yard_buildings_and_structures/passage_doors.dart';
import '../../small_properties/yard_buildings_and_structures/roof.dart';
import '../../small_properties/yard_buildings_and_structures/thermal_center.dart';
import '../../utils/utils.dart';

part 'quantities_to_material_form.freezed.dart';

/// Laskenta
/// Materiaalimäärätaulukkoon luettavat määrät (tonnia)

@freezed
abstract class Counter with _$Counter {
  const Counter._();

  const factory Counter(
      {Apartment? apartment,
      ApartmentSize? apartmentSize,
      Apartments? apartments,
      Hvac? hvac,
      SmallPropertiesExcavationArea? smallPropertiesExcavationArea,
      SmallPropertiesFoundation? foundation,
      SmallPropertyInnerDoors? innerDoors,
      MachineryEquipmentAndFixedStructures?
          machineryEquipmentAndFixedStructures,
      SmallPropertyOuterDoors? outerDoors,
      Roof? roof,
      SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo,
      Walls? walls,
      SmallPropertyWindows? windows,
      CarportOrGarage? carportOrGarage,
      HallDoors? hallDoors,
      PassageDoors? passageDoors,
      YardRoof? yardRoof,
      ThermalCenter? thermalCenter}) = _Counter;

  /// Puhdas betoni
  num? get cleanConcrete => Utils.sumOrNull([
        foundation?.cleanConcreteTons,
        walls?.recyclablePartitionWallsConcreteTons,
        machineryEquipmentAndFixedStructures
            ?.concreteYardTilesAndStonesWeightTons,
        carportOrGarage?.cleanConcreteTons,
        carportOrGarage?.cleanWallConcreteTons,
        thermalCenter?.concreteClean,
        thermalCenter?.concreteWallMaterial
      ]);

  /// Asbestia sisältävä betoni
  num? get concreteWithAsbestos => Utils.sumOrNull([
        foundation?.reinforcedConcreteAsbestos,
        walls?.recyclablePartitionWallsConcreteTons,
        carportOrGarage?.concreteWithAsbestosTons,
        carportOrGarage?.concreteWallMaterialWithAsbestosTons,
        thermalCenter?.concreteAsbestos,
      ]);

  /// PCB maalia sisältävä betoni
  num? get concreteWithPcbPaints => Utils.sumOrNull([
        foundation?.reinforcedConcretePcbPaints,
        thermalCenter?.concreteAsbestos
      ]);

  /// Betoniteräkset, peltikatto ja muu teräsromu
  num? get steel => Utils.sumOrNull([
        foundation?.reinforcedConcreteTons,
        roof?.waterRoofSteelTons,
        outerDoors?.steelDoorsScrapAndBurnable,
        windows?.steelWindowsScrapAndBurnable,
        hvac?.ventilationPipesD200WeightTons,
        hvac?.centralHeatingPipesWeightTons,
        hvac?.rainGuttersWeightTons,
        machineryEquipmentAndFixedStructures
            ?.waterCirculationRadiatorsWeightTons,
        machineryEquipmentAndFixedStructures?.steelMeshWeightTons,
        carportOrGarage?.steelTons,
        carportOrGarage?.steelSheetTons,
        yardRoof?.steelSheetWeightTons,
        passageDoors?.steelTons,
        hallDoors?.steelDoorTons,
        thermalCenter?.reinforcedConcreteTons,
        thermalCenter?.steelSheetCladding,
        yardRoof?.steelTons
      ]);

  /// Seinä- ja kattotiilet
  num? get wallAndRoofTiles => Utils.sumOrNull([
        walls?.recyclablePartitionWallsBricksTons,
        walls?.recyclableBrickTons,
        roof?.waterRoofTileTons,
        carportOrGarage?.recyclableBrickTons,
        yardRoof?.roofBrickWeightTons,
        thermalCenter?.brickWallMaterial,
        thermalCenter?.recyclableBrickTons
      ]);

  /// Kierrätyskelvoton tiilijäte
  num? get nonRecyclableBrickWaste => Utils.sumOrNull([
        walls?.nonRecyclableBrickWasteTons,
        walls?.nonRecyclableInnerWallBrickWasteTons,
        carportOrGarage?.nonRecyclableInnerWallBrickWasteTons,
        yardRoof?.roofBrickAsbestosWeightTons,
        thermalCenter?.brickWallMaterialAsbestos,
        thermalCenter?.nonRecyclableInnerWallBrickWasteTons,
      ]);

  /// Puhdas käyttökelpoinen puu
  num? get cleanWood => Utils.sumOrNull([
        walls?.cleanWoodOrBurnableWoodTons,
        roof?.cleanWoodTons,
        yardRoof?.woodenRoofLattice800mmWeightTons,
        thermalCenter?.cleanWoodTons,
        thermalCenter?.woodenRoofLatticeWeightTons
      ]);

  /// Polttokelpoinen puujäte
  num? get burnableWood => Utils.sumOrNull([
        walls?.cleanWoodOrBurnableWoodTons,
        walls?.boardCladdingTons,
        roof?.burnableWoodTons,
        outerDoors?.woodenDoorsScrapAndBurnable,
        innerDoors?.woodenInnerDoorsScrapAndBurnable,
        innerDoors?.panelInnerDoorsScrapAndBurnable,
        windows?.woodenWindowsScrapAndBurnable,
        apartmentSize?.burnableWoodTons,
        apartmentSize?.totalTrunkWoodTons,
        machineryEquipmentAndFixedStructures?.burnableWoodTons,
        carportOrGarage?.burnableWoodTons,
        yardRoof?.underBoardingWeightTons,
        passageDoors?.burnableWoodTons,
        hallDoors?.burnableWoodTons
      ]);

  /// Tuulensuojalevyt (bituliitti tai vastaava)
  num? get windProtectionPlates => walls?.windProtectionBoardTons;

  /// Lasi- ja mineraalieristevilla
  num? get glassAndMineralInsulation => Utils.sumOrNull(
      [walls?.insulationWoolTons, carportOrGarage?.insulationThicknessTons]);

  /// Kipsilevyt, cyproc
  num? get plasterBoardTons => apartmentSize?.plasterBoardTons;

  /// Kierrätyskelvoton kipsilevy
  num? get nonRecyclablePlasterBoardTons => null;

  /// Materiaalimäärätaulukko does not have any values on this one

  /// Lastulevy
  num? get chipboardTons => apartmentSize?.chipboardTons;

  /// Energiajäte, maalattu puu, kattohuopa ja aluskate
  num? get energyWaste => Utils.sumOrNull([
        roof?.waterRoofFeltTons,
        roof?.underLaymentTons,
        apartmentSize?.totalFloorMaterialTons,
        apartmentSize?.plasticCarpetTons,
        apartmentSize?.saunaPanelingWoodenPanelTons,
        apartmentSize?.nonRecyclableKitchenClosetTons,
        apartmentSize?.nonRecyclableDressingClosetTons,
        hvac?.plasticPipesWaterWeightTons,
        hvac?.sewagePipesPlasticWeightTons,
        yardRoof?.roofingFeltNoAsbestosWeightTons,
        yardRoof?.underlaymentWeightTons,
        thermalCenter?.roofingFeltNoAsbestosWeightTons
      ]);

  /// Mineriitti- tai huopakate, sisältää asbestia
  num? get mineriteOrFeltContainsAsbestos => Utils.sumOrNull([
        walls?.mineriteBoardTons,
        roof?.waterRoofFeltAsbestosTons,
        roof?.waterRoofMineriteAsbestosTons,
        yardRoof?.roofingFeltAsbestosWeightTons,
        yardRoof?.mineriteBoardWeightTons,
        thermalCenter?.outerWallMineriteAsbestosTons,
        thermalCenter?.waterRoofFeltAsbestosTons,
        thermalCenter?.waterRoofMineriteAsbestosTons,
      ]);

  /// Puuovet
  num? get woodenDoors => Utils.sumOrNull([
        outerDoors?.woodenDoorTons,
        innerDoors?.woodenDoorWoodTons,
        innerDoors?.panelDoorWoodTons,
        passageDoors?.recyclableWoodenDoorTons,
        hallDoors?.recyclableWoodenDoorTons
      ]);

  /// Alumiinovet
  num? get aluminiumDoors => Utils.sumOrNull([
        outerDoors?.aluminiumDoorTons,
        passageDoors?.recyclableAluminiumDoorTons,
        hallDoors?.recyclableAluminiumDoorTons
      ]);

  /// Teräsovet
  num? get steelDoors => Utils.sumOrNull([
        outerDoors?.steelDoorTons,
        passageDoors?.recyclableSteelDoorTons,
        hallDoors?.recyclableSteelDoorTons
      ]);

  /// Puiset ikkunat
  num? get woodenWindows => windows?.recyclableWoodenFrameWindowTons;

  /// Teräskarmi-ikkunat
  num? get steelWindows => windows?.recyclableSteelWindowTons;

  /// Alumiinikarmi-ikkunat
  num? get aluminiumWindows => windows?.recyclableAluminiumWindowTons;

  /// Lasi
  num? get glass => Utils.sumOrNull([
        outerDoors?.woodenDoorGlassTons,
        outerDoors?.aluminiumDoorGlassTons,
        outerDoors?.steelDoorGlassTons,
        innerDoors?.woodenDoorGlassTons,
        innerDoors?.panelDoorGlassTons,
        windows?.woodenFrameWindowGlassTons,
        windows?.steelWindowGlassTons,
        windows?.aluminiumWindowGlassTons,
        passageDoors?.woodenDoorglassTonsNotRecyclable,
        passageDoors?.aluminiumDoorGlassTonsNotRecyclable,
        passageDoors?.steelDoorGlassTonsNotRecyclable,
      ]);

  /// Alumiini
  num? get aluminium => Utils.sumOrNull([
        outerDoors?.aluminiumDoorsScrapAndBurnable,
        windows?.aluminiumWindowsScrapAndBurnable,
        machineryEquipmentAndFixedStructures?.aluminiumFence,
        passageDoors?.aluminiumTons,
        hallDoors?.aluminiumTons
      ]);

  /// Käyttökelvoton kaakeli, posliini sekä lasi- ja mineraalieristevilla
  num? get nonRecyclableCeramicWaste => Utils.sumOrNull([
        apartmentSize?.ceramicTileTonsNonRecyclable,
        apartmentSize?.porcelainSeatScrapTons,
        apartmentSize?.washingSinkScrapTons
      ]);

  /// Kaapit ja kalusteet
  num? get closetsAndFurniture => Utils.sumOrNull([
        apartmentSize?.recyclableKitchenClosets,
        apartmentSize?.recyclableDressingClosets
      ]);

  /// Muu metalliromu, sähkökaapit, liedet, jääkaapit yms.
  num? get otherMetalScrap => Utils.sumOrNull([
        apartmentSize?.saunaStoveScrapTons,
        apartmentSize?.electricStoveScrapTons,
        apartmentSize?.refrigeratorScrapTons,
        machineryEquipmentAndFixedStructures
            ?.electricalDistributionMachinesAndMetersWeighTons,
        hvac?.castIronPipesWeightTons,
        machineryEquipmentAndFixedStructures
            ?.notRecyclableElectricMotorsWeightTons,
        machineryEquipmentAndFixedStructures
            ?.notRecyclableVentilationMachinesWeightTons,
        thermalCenter?.notRecyclablePelletBoilerTons,
        thermalCenter?.notRecyclableElectricBoilerTons,
      ]);

  /// Ruostumaton teräs
  num? get stainlessSteel => Utils.sumOrNull([
        apartmentSize?.steelTableScrapTons,
        apartmentSize?.waterAccumulatorScrapTons,
        thermalCenter?.recyclableDistrictHeatExchangerTons,
        thermalCenter?.recyclableWaterHeaterTons
      ]);

  /// Kupari
  num? get copper => Utils.sumOrNull([
        hvac?.electricalWiresCopperWeightTons,
        hvac?.copperPipesWeightTons,
      ]);

  /// WC-istuimet
  num? get toiletSeatsRecyclable => apartmentSize?.recyclablePorcelainSeatTons;

  /// Pesuallas, posliini tonnia
  num? get washingSinksRecyclable => apartmentSize?.recyclableWashingSinkTons;

  /// Teräsaltaat ja pöydät
  num? get steelSinksAndTables => apartmentSize?.recyclableSteelTableTons;

  /// Saunankiukaas
  num? get saunaStovesRecyclable => apartmentSize?.recyclableSaunaStoveTons;

  /// Sähköliedet
  num? get electricStovesRecyclable =>
      apartmentSize?.recyclableElectricStoveTons;

  /// Jääkaapit
  num? get refrigeratorsRecyclable => apartmentSize?.recyclableRefrigeratorTons;

  /// Vesivaraajat
  num? get waterAccumulatorsRecyclable => Utils.sumOrNull([
        apartmentSize?.recyclableWaterAccumulatorTons,
        thermalCenter?.recyclableWaterHeaterTons
      ]);

  /// Sähkömoottorit
  num? get electricMotorsRecyclable =>
      machineryEquipmentAndFixedStructures?.recyclableElectricMotorsWeightTons;

  /// Ilmanvaihtokoneet
  num? get ventilationMachinesRecyclable => machineryEquipmentAndFixedStructures
      ?.recyclableVentilationMachinesWeightTons;

  /// Kierrätettävät pihalaatat ja muurikivet
  num? get recyclableYardTilesAndStones => machineryEquipmentAndFixedStructures
      ?.concreteYardTilesAndStonesWeightTons;

  /// Lämpökattila
  num? get pelletBoilerRecyclable => Utils.sumOrNull([
        thermalCenter?.recyclablePelletBoilerTons,
        thermalCenter?.recyclableElectricBoilerTons
      ]);

  /// Lämmönvaihdin
  num? get districtHeatExchangerRecyclable =>
      thermalCenter?.recyclableDistrictHeatExchangerTons;

  /// Mysteerilasku 1
  num? get mystery1 => Utils.sumOrNull([
        walls?.recyclablePartitionWallsConcreteTons,
        carportOrGarage?.concreteWithAsbestosTons,
        carportOrGarage?.concreteWallMaterialWithAsbestosTons,
        thermalCenter?.concreteAsbestos,
      ]);

  /// Mysteerilasku 2
  num? get mystery2 => thermalCenter?.concreteAsbestos;

  /// Saastunut betoni
  num? get contaminatedConcrete => Utils.sumOrNull([
        mystery1,
        mystery2,
        Utils.multiplyOrNull([
          foundation?.reinforcedConcreteAsbestos,
          foundation?.nextToReinforcedConcretePcbPaints
        ]),
        Utils.multiplyOrNull([
          foundation?.reinforcedConcretePcbPaints,
          foundation?.nextToReinforcedConcretePcbPaints
        ]),
        foundation?.concreteTons,
        (1 - (foundation?.nextToReinforcedConcretePcbPaints ?? 0))
      ]);
}
