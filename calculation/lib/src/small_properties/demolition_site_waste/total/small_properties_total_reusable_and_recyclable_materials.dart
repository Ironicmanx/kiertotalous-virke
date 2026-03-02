import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../apartments/exports.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../quantities_to_material_form/quantities_to_material_form.dart';
import '../../yard_buildings_and_structures/exports.dart';
import '../exports.dart';

part 'small_properties_total_reusable_and_recyclable_materials.freezed.dart';

/// HYÖDYNTÄMISKELPOISET JA KIERRÄTETTÄVÄT MATERIAALIT
@freezed
abstract class SmallPropertiesTotalReusableAndRecyclableMaterials
    with _$SmallPropertiesTotalReusableAndRecyclableMaterials {
  SmallPropertiesTotalReusableAndRecyclableMaterials._();

  factory SmallPropertiesTotalReusableAndRecyclableMaterials(
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
          RecyclableMaterialsNotes? recyclableMaterialsNotes,
          RecyclableMaterialsMaterialValue? materialValue,
          RecyclableMaterialsHandlingAndDismantlingCosts?
              handlingAndDismantlingCosts,
          Roof? roof,
          SmallPropertiesExcavationArea? smallPropertiesExcavationArea,
          SmallPropertiesFoundation? foundation,
          SmallPropertiesReusableAndRecyclableMaterials?
              reusableAndRecyclableMaterials,
          SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo,
          SmallPropertyInnerDoors? innerDoors,
          SmallPropertyOuterDoors? outerDoors,
          SmallPropertyWindows? windows,
          ThermalCenter? thermalCenter,
          Walls? walls,
          YardRoof? yardRoof}) =
      _SmallPropertiesTotalReusableAndRecyclableMaterials;

  /// Maa-ainekset
  late final cleanSoil = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: Utils.multiplyOrZero([
            smallPropertiesExcavationArea?.soilToBeRemovedTons,
            smallPropertiesExcavationArea?.removableCleanSoilInPercents
          ]) ??
          0 / 100,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.cleanSoilNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.cleanSoilHandlingAndDismantlingCosts,
      materialValue: materialValue?.cleanSoilMaterialValue);

  /// Asfalttijäte
  late final asphaltWaste = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: Utils.sumOrNull([
        smallPropertiesExcavationArea?.asphaltTons,
        carportOrGarage?.asphaltTons
      ]),
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.asphaltWasteNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.asphaltWasteHandlingAndDismantlingCosts,
      materialValue: materialValue?.asphaltWasteMaterialValue);

  /// Puhdas betoni
  late final cleanConcrete = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.cleanConcrete,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.cleanConcreteNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.cleanConcreteHandlingAndDismantlingCosts,
      materialValue: materialValue?.cleanConcreteMaterialValue);

  /// Betoniteräkset, peltikatto ja muu
  late final steel = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.steel,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.steelNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.steelHandlingAndDismantlingCosts,
      materialValue: materialValue?.steelMaterialValue);

  /// Seinä- ja kattotiilet
  late final wallAndRoofTiles = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.wallAndRoofTiles,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.wallAndRoofTilesNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.wallAndRoofTilesHandlingAndDismantlingCosts,
      materialValue: materialValue?.wallAndRoofTilesMaterialValue);

  /// Puhdas käyttökelpoinen puu
  late final cleanUsableWood = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.cleanWood,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.cleanUsableWoodNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.cleanUsableWoodHandlingAndDismantlingCosts,
      materialValue: materialValue?.cleanUsableWoodMaterialValue);

  /// Polttokelpoinen puujäte
  late final combustibleWoodWaste = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.burnableWood,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.combustibleWoodWasteNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.combustibleWoodWasteHandlingAndDismantlingCosts,
      materialValue: materialValue?.combustibleWoodWasteMaterialValue);

  /// Tuulensuojalevyt (bitulitti tai vastaava)
  late final windProtectionBoard = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.windProtectionPlates,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.windProtectionBoardNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.windProtectionBoardHandlingAndDismantlingCosts,
      materialValue: materialValue?.windProtectionBoardMaterialValue);

  /// Lasi- ja mineraalieristevilla
  late final glassAndMineralWool = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.glassAndMineralInsulation,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.glassAndMineralWoolNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.glassAndMineralWoolHandlingAndDismantlingCosts,
      materialValue: materialValue?.glassAndMineralWoolMaterialValue);

  /// Kipsilevyt
  late final gypsumBoards = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.plasterBoardTons,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.gypsumBoardsNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.gypsumBoardsHandlingAndDismantlingCosts,
      materialValue: materialValue?.gypsumBoardsMaterialValue);

  /// Lastulevy
  late final chipboard = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.chipboardTons,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.chipboardNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.chipboardHandlingAndDismantlingCosts,
      materialValue: materialValue?.chipboardMaterialValue);

  /// Energiajäte, maalattupuu, kattohuopa, ja aluskate
  late final energyWaste = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.energyWaste,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.energyWasteNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.energyWasteHandlingAndDismantlingCosts,
      materialValue: materialValue?.energyWasteMaterialValue);

  /// Lasi
  late final glass = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.glass,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.glassNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.glassHandlingAndDismantlingCosts,
      materialValue: materialValue?.glassMaterialValue);

  /// Alumiini
  late final aluminium = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.aluminium,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.aluminiumNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.aluminiumHandlingAndDismantlingCosts,
      materialValue: materialValue?.aluminiumMaterialValue);

  /// Muu metalliromu, sähkökaapit, liedet, jääkaapit yms.
  late final rebarAndSteelScrap = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.otherMetalScrap,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.rebarAndSteelScrapNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.rebarAndSteelScrapHandlingAndDismantlingCosts,
      materialValue: materialValue?.rebarAndSteelScrapMaterialValue);

  /// Ruostumaton teräs
  late final stainlessSteel = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.stainlessSteel,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.stainlessSteelNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.stainlessSteelHandlingAndDismantlingCosts,
      materialValue: materialValue?.stainlessSteelMaterialValue);

  /// Kupari
  late final copper = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.copper,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.copperNotes,
      handlingAndDismantlingCost:
          handlingAndDismantlingCosts?.copperHandlingAndDismantlingCosts,
      materialValue: materialValue?.copperMaterialValue);

  /// Betoniset pihalaatat ja muurikivet
  late final concreteBlocks = SmallPropertiesRecyclableMaterialItem(
      quantityEstimate: counter?.recyclableYardTilesAndStones,
      exploitingOrProcessingOrFinalDisposalSite:
          recyclableMaterialsNotes?.concreteBlocksNotes,
      handlingAndDismantlingCost: handlingAndDismantlingCosts
          ?.concreteBlocksHandlingAndDismantlingCosts,
      materialValue: materialValue?.concreteBlocksMaterialValue);

  List<SmallPropertiesRecyclableMaterialItem> get all => [
        cleanSoil,
        asphaltWaste,
        cleanConcrete,
        steel,
        wallAndRoofTiles,
        cleanUsableWood,
        combustibleWoodWaste,
        windProtectionBoard,
        glassAndMineralWool,
        gypsumBoards,
        chipboard,
        energyWaste,
        glass,
        aluminium,
        rebarAndSteelScrap,
        stainlessSteel,
        copper,
        concreteBlocks
      ];

  num? get totalQuantityEstimate =>
      all.fold<num>(0, (acc, element) => acc + (element.quantityEstimate ?? 0));

  num? get totalDemolitionCost => all.fold<num>(
      0, (acc, element) => acc + (element.demolitionCostPerMaterialBatch ?? 0));

  num? get totalMaterialPrice =>
      all.fold<num>(0, (acc, element) => acc * (element.batchPrice ?? 0));
}
