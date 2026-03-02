import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../apartments/exports.dart';
import '../../foundations_and_outer_shell/exports.dart';
import '../../quantities_to_material_form/quantities_to_material_form.dart';
import '../../yard_buildings_and_structures/exports.dart';
import '../exports.dart';

part 'small_properties_total_disposal_materials_and_hazardous_waste.freezed.dart';

/// Loppusijoitettavat materiaalit ja ongelmajätteet
@freezed
abstract class SmallPropertiesTotalDisposalMaterialsAndHazardousWaste
    with _$SmallPropertiesTotalDisposalMaterialsAndHazardousWaste {
  SmallPropertiesTotalDisposalMaterialsAndHazardousWaste._();

  factory SmallPropertiesTotalDisposalMaterialsAndHazardousWaste(
          {Apartment? apartment,
          ApartmentSize? apartmentSize,
          Apartments? apartments,
          CarportOrGarage? carportOrGarage,
          Counter? counter,
          DisposableAndHazardousNotes? disposableAndHazardousNotes,
          DisposableAndHazardousDemolitionOrProcessingCosts? costs,
          HallDoors? hallDoors,
          Hvac? hvac,
          MachineryEquipmentAndFixedStructures?
              machineryEquipmentAndFixedStructures,
          PassageDoors? passageDoors,
          Roof? roof,
          SmallPropertiesExcavationArea? smallPropertiesExcavationArea,
          SmallPropertiesFoundation? foundation,
          SmallPropertyEvaluationInfo? smallPropertyEvaluationInfo,
          SmallPropertyInnerDoors? innerDoors,
          SmallPropertyOuterDoors? outerDoors,
          SmallPropertyWindows? windows,
          ThermalCenter? thermalCenter,
          Walls? walls,
          YardRoof? yardRoof}) =
      _SmallPropertiesTotalDisposalMaterialsAndHazardousWaste;

  /// Käyttökelvoton kaakeli, posliini sekä lasi- ja mineraalieristevilla
  late final ceramicTilePorcelainAndGlassAndInsulationWool =
      SmallPropertiesWasteDisposalItem(
          quantityEstimate: counter?.nonRecyclableCeramicWaste,
          exploitingOrProcessingOrFinalDisposalSite: disposableAndHazardousNotes
              ?.ceramicTilePorcelainAndGlassAndInsulationWoolNotes,
          demolitionOrProcessingCost: costs
              ?.ceramicTilePorcelainAndGlassAndInsulationWoolDemolitionOrProcessingCosts);

  /// Kierrätyskelvoton tiilijäte
  late final nonRecyclableBrickWaste = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.nonRecyclableBrickWaste,
      exploitingOrProcessingOrFinalDisposalSite:
          disposableAndHazardousNotes?.nonRecyclableBrickWasteNotes,
      demolitionOrProcessingCost:
          costs?.nonRecyclableBrickWasteDemolitionOrProcessingCosts);

  /// Kierrätyskelvoton kipsilevy
  late final nonRecyclablePlasterBoard = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.nonRecyclablePlasterBoardTons,
      exploitingOrProcessingOrFinalDisposalSite:
          disposableAndHazardousNotes?.nonRecyclablePlasterBoardNotes,
      demolitionOrProcessingCost:
          costs?.nonRecyclablePlasterBoardDemolitionOrProcessingCosts);

  /// Saastunut maa
  late final contaminatedSoil = SmallPropertiesWasteDisposalItem(
      quantityEstimate: Utils.multiplyOrNull([
        smallPropertiesExcavationArea?.soilToBeRemovedTons,
        smallPropertiesExcavationArea?.contaminatedSoil
      ]),
      exploitingOrProcessingOrFinalDisposalSite:
          disposableAndHazardousNotes?.contaminatedSoilNotes,
      demolitionOrProcessingCost:
          costs?.contaminatedSoilDemolitionOrProcessingCosts);

  /// Asbestia sisältävä betoni
  late final concreteContainingAsbestos = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.concreteWithAsbestos,
      exploitingOrProcessingOrFinalDisposalSite:
          disposableAndHazardousNotes?.concreteContainingAsbestosNotes,
      demolitionOrProcessingCost:
          costs?.concreteContainingAsbestosDemolitionOrProcessingCosts);

  /// Mineriitti- tai huopakate, sisältää asbestia
  late final mineriteOrFeltContainingAsbestos =
      SmallPropertiesWasteDisposalItem(
          quantityEstimate: counter?.mineriteOrFeltContainsAsbestos,
          exploitingOrProcessingOrFinalDisposalSite: disposableAndHazardousNotes
              ?.mineriteOrFeltContainingAsbestosNotes,
          demolitionOrProcessingCost: costs
              ?.mineriteOrFeltContainingAsbestosDemolitionOrProcessingCosts);

  /// PCB maalia sisältävä betoni
  late final concreteContainingPcbPaint = SmallPropertiesWasteDisposalItem(
      quantityEstimate: counter?.concreteWithPcbPaints,
      exploitingOrProcessingOrFinalDisposalSite:
          disposableAndHazardousNotes?.concreteContainingPcbPaintingNotes,
      demolitionOrProcessingCost:
          costs?.concreteContainingPcbPaintingDemolitionOrProcessingCosts);

  List<SmallPropertiesWasteDisposalItem> get all => [
        ceramicTilePorcelainAndGlassAndInsulationWool,
        nonRecyclableBrickWaste,
        nonRecyclablePlasterBoard,
        contaminatedSoil,
        concreteContainingAsbestos,
        mineriteOrFeltContainingAsbestos,
        concreteContainingPcbPaint
      ];

  num? get totalQuantityEstimate => Utils.sumOrNull([
        ceramicTilePorcelainAndGlassAndInsulationWool.quantityEstimate,
        nonRecyclableBrickWaste.quantityEstimate,
        nonRecyclablePlasterBoard.quantityEstimate,
        contaminatedSoil.quantityEstimate,
        mineriteOrFeltContainingAsbestos.quantityEstimate,
        counter?.contaminatedConcrete,
      ]);

  num? get totalDemolitionBatchPrice => all.fold<num>(
      0, (acc, element) => acc + (element.demolitionBatchPrice ?? 0));
}
