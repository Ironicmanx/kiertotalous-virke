import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../external_shell_and_frame_structures/total/exports.dart';
import '../../hvac_electrical_and_other_equipment/exports.dart';
import '../../partition_walls_doors_and_windows/exports.dart';
import '../exports.dart';
import '../items/exports.dart';

part 'total_recyclable_components_and_furniture.freezed.dart';

/// KIERRÄTETTÄVÄT RAKENNEOSAT JA KALUSTEET
@freezed
abstract class TotalRecyclableComponentsAndFurniture
    with _$TotalRecyclableComponentsAndFurniture {
  TotalRecyclableComponentsAndFurniture._();

  factory TotalRecyclableComponentsAndFurniture(
          {TotalIntermediateFloors? totalIntermediateFloors,
          TotalRoofs? totalRoofs,
          TotalBuildingFrame? totalBuildingFrame,
          FixturesAndStructures? fixturesAndStructures,
          FixedFurniture? fixedFurniture,
          OuterDoors? outerDoors,
          InnerDoors? innerDoors,
          Windows? windows,
          MachinesAndEquipments? machinesAndEquipments,
          RecyclableComponentsAndFurniture? recyclableComponentsAndFurniture}) =
      _TotalRecyclableComponentsAndFurniture;

  /// Betonipalkit, runko
  late final concreteFrameBeams = RecyclableItem(
      volume:
          (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
              ? totalBuildingFrame?.concreteVerticalColumnsPart.concreteVolume
              : null,
      tons: (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
          ? totalBuildingFrame?.concreteVerticalColumnsPart.concreteTons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.concreteFrameBeamsUnitPrice);

  /// Betoniset ontelolaatat
  late final concreteHollowSlabs = RecyclableItem(
      volume:
          (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
                  false)
              ? totalIntermediateFloors?.hollowCoreSlabConcreteVolume
              : 0,
      tons: (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
              false)
          ? totalIntermediateFloors?.hollowCoreSlabConcreteTons
          : 0,
      unitPrice:
          recyclableComponentsAndFurniture?.concreteHollowSlabsUnitPrice);

  /// Betoniset kattopalkit
  late final concreteRoofBeams = RecyclableItem(
      volume: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.concreteVolume
          : 0,
      tons: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.concreteTons
          : 0,
      unitPrice: recyclableComponentsAndFurniture?.concreteRoofBeamsUnitPrice);

  /// Betoniset seinäelementit
  late final concreteWallElements = RecyclableItem(
      volume:
          (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
              ? totalBuildingFrame
                  ?.concreteElementWallsWithoutFrameworkPart.concreteVolume
              : null,
      tons: (totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)
          ? totalBuildingFrame
              ?.concreteElementWallsWithoutFrameworkPart.concreteTons
          : null,
      unitPrice:
          recyclableComponentsAndFurniture?.concreteWallElementsUnitPrice);

  /// Liimapalkit
  late final glulamBeams = RecyclableItem(
      volume:
          (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
                  false)
              ? totalIntermediateFloors?.glulamBeamWoodVolume
              : 0,
      tons: (totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
              false)
          ? totalIntermediateFloors?.glulamBeamWoodVolume
          : 0,
      unitPrice: recyclableComponentsAndFurniture?.glulamBeamsUnitPrice);

  /// Puupalkit (kantavat lattiapalkit)
  late final floorSupportWoodenBeams = RecyclableItem(
      volume: totalBuildingFrame?.glulamBeamsPart.woodVolume,
      tons: totalBuildingFrame?.glulamBeamsPart.woodTons,
      unitPrice:
          recyclableComponentsAndFurniture?.floorSupportWoodenBeamsUnitPrice);

  /// Teräspalkit, runkopalkit
  late final steelFrameBeams = RecyclableItem(
      tons: totalBuildingFrame?.steelVerticalColumnsPart.steelTons,
      unitPrice: recyclableComponentsAndFurniture?.steelFrameBeamsUnitPrice);

  /// Sadevesikourut ja rännit (m)
  late final rainGuttersAndDownspouts = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.rainGuttersAndDownSpouts?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.rainGuttersAndDownSpouts?.tons
          : null,
      unitPrice:
          recyclableComponentsAndFurniture?.rainGuttersAndDownspoutsUnitPrice);

  /// Palotikkaat ja kulkusillat (m)
  late final fireLaddersAndWalkways = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.fireLaddersAndWalkways?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.fireLaddersAndWalkways?.tons
          : null,
      unitPrice:
          recyclableComponentsAndFurniture?.fireLaddersAndWalkwaysUnitPrice);

  /// Puiset kattoristikot
  late final woodenRoofTrusses = RecyclableItem(
      volume: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.woodVolume
          : null,
      tons: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.woodTons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.woodenRoofTrussesUnitPrice);

  /// Teräksiset kattoristikot
  late final steelRoofTrusses = RecyclableItem(
      tons: (totalRoofs?.roofTrussesAreRecyclable ?? false)
          ? totalRoofs?.steelTons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.steelRoofTrussesUnitPrice);

  /// Teräsverkko aita (m)
  late final steelChainLinkFence = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.steelChainLinkFences?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.steelChainLinkFences?.tons
          : null,
      unitPrice:
          recyclableComponentsAndFurniture?.steelChainLinkFenceUnitPrice);

  /// Alumiiniverkko aita (m)
  late final aluminumChainLinkFence = RecyclableItem(
      size: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.aluminiumChainLinkFences?.meters
          : null,
      tons: (fixturesAndStructures?.fixturesRecyclable ?? false)
          ? fixturesAndStructures?.aluminiumChainLinkFences?.tons
          : null,
      unitPrice:
          recyclableComponentsAndFurniture?.aluminumChainLinkFenceUnitPrice);

  /// Puuovet ja kuitulevyovet
  late final woodAndFiberboardDoors = RecyclableItem(
      size: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? outerDoors?.woodenDoors?.doorCount
            : null,
        (innerDoors?.areDoorsRecyclable ?? false)
            ? Utils.sumOrNull([
                innerDoors?.woodenDoors?.doorCount,
                innerDoors?.panelDoors?.doorCount
              ])
            : null,
      ]),
      volume: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? outerDoors?.totalWoodVolume
            : null,
        (innerDoors?.areDoorsRecyclable ?? false)
            ? innerDoors?.totalWoodVolume
            : null,
      ]),
      tons: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? outerDoors?.totalWoodTons
            : null,
        (innerDoors?.areDoorsRecyclable ?? false)
            ? innerDoors?.totalWoodTons
            : null,
      ]),
      unitPrice:
          recyclableComponentsAndFurniture?.woodAndFiberboardDoorsUnitPrice);

  /// Alumiiniovet
  late final aluminumDoors = RecyclableItem(
      size: (outerDoors?.areDoorsRecyclable ?? false)
          ? outerDoors?.aluminiumDoors?.doorCount
          : null,
      tons: (outerDoors?.areDoorsRecyclable ?? false)
          ? outerDoors?.totalAluminiumTons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.aluminumDoorsUnitPrice);

  /// Teräsovet (ulko ja palo-ovet)
  late final exteriorAndFireExitSteelDoors = RecyclableItem(
      size: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? Utils.sumOrNull([
                outerDoors?.steelDoors?.doorCount,
                outerDoors?.accessAndLoadingDoors
              ])
            : null,
        innerDoors?.fireDoors?.doorCount
      ]),
      volume: Utils.sumOrNull([
        (outerDoors?.areDoorsRecyclable ?? false)
            ? Utils.sumOrNull(
                [outerDoors?.totalSteelTons, outerDoors?.totalGlassTons])
            : null,
        innerDoors?.totalSteelTons,
      ]),
      unitPrice: recyclableComponentsAndFurniture
          ?.exteriorAndFireExitSteelDoorsUnitPrice);

  /// Kaapit ja kalusteet, puu tai levy (keittiö ja sosiaalitilat)
  late final woodenOrBoardCabinetsAndFurniture = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false) &&
              fixedFurniture?.clothingOrOtherClosetsWood! != null
          ? fixedFurniture!.clothingOrOtherClosetsWood! / 0.6
          : null,
      volume: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.ceramicVolume
          : null,
      tons: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.chipboardTons
          : null,
      unitPrice: recyclableComponentsAndFurniture
          ?.woodenOrBoardCabinetsAndFurnitureUnitPrice);

  /// Teräksiset pukukaapit
  late final steelLockerCabinets = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false) &&
              fixedFurniture?.steelLockerCabinets! != null
          ? fixedFurniture!.steelLockerCabinets! / 0.6
          : null,
      tons: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.steelTons
          : null,
      unitPrice:
          recyclableComponentsAndFurniture?.steelLockerCabinetsUnitPrice);

  /// Puuiset ikkunat
  late final woodenWindows = RecyclableItem(
      size:
          (windows?.areWindowsRecyclable ?? false) ? windows?.windowsPcs : null,
      // TODO: To me this does not make much sense. Probably a mistake in the spec.
      // Keeping this as is for now.
      volume: (windows?.areWindowsRecyclable ?? false)
          ? outerDoors?.totalWoodVolume
          : null,
      tons: (windows?.areWindowsRecyclable ?? false)
          ? windows?.totalWoodTons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.woodenWindowsUnitPrice);

  /// WC-istuin, posliini
  late final porcelainToilets = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.porcelainToilets
          : null,
      unitPrice: recyclableComponentsAndFurniture?.porcelainToiletsUnitPrice);

  /// Pesuallas, posliini
  late final porcelainSinks = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.porcelainSinks
          : null,
      unitPrice: recyclableComponentsAndFurniture?.porcelainSinksUnitPrice);

  /// Teräsaltaat ja pöydät (ruostumaton)
  late final stainlessSteelSinksAndTables = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.steelTables
          : null,
      unitPrice: recyclableComponentsAndFurniture
          ?.stainlessSteelSinksAndTablesUnitPrice);

  /// Saunankiukaat
  late final saunaStoves = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.saunaStoves
          : null,
      unitPrice: recyclableComponentsAndFurniture?.saunaStovesUnitPrice);

  /// Sähköliedet
  late final electricStoves = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.electricStoves
          : null,
      unitPrice: recyclableComponentsAndFurniture?.electricStovesUnitPrice);

  /// Suurtalous sähköliedet
  late final industrialElectricStoves = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.industrialElectricStoves
          : null,
      unitPrice:
          recyclableComponentsAndFurniture?.industrialElectricStovesUnitPrice);

  /// Jääkaapit
  late final refrigerators = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.refrigerators
          : null,
      unitPrice: recyclableComponentsAndFurniture?.refrigeratorsUnitPrice);

  /// Kylmiökaapit
  late final coldRoomCabinets = RecyclableItem(
      size: (fixedFurniture?.isFurnitureRecyclable ?? false)
          ? fixedFurniture?.coldRoomCabinets
          : null,
      unitPrice: recyclableComponentsAndFurniture?.coldRoomCabinetsUnitPrice);

  /// Lämpöpatterit, sähkö
  late final electricRadiators = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricRadiators?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricRadiators?.tons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.electricRadiatorsUnitPrice);

  /// Vesivaraajat, pienet
  late final smallElectricalAccumulators = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.smallElectricalAccumulators?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.smallElectricalAccumulators?.tons
          : null,
      unitPrice: recyclableComponentsAndFurniture
          ?.smallElectricalAccumulatorsUnitPrice);

  /// Vesivaraajat, suuret
  late final largeElectricalAccumulators = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.largeElectricalAccumulators?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.largeElectricalAccumulators?.tons
          : null,
      unitPrice: recyclableComponentsAndFurniture
          ?.largeElectricalAccumulatorsUnitPrice);

  /// Sähkömoottorit ja kiertovesipumput
  late final electricMotorsAndCirculationPumps = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricMotorsAndCirculationPumps?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricMotorsAndCirculationPumps?.tons
          : null,
      unitPrice: recyclableComponentsAndFurniture
          ?.electricMotorsAndCirculationPumpsUnitPrice);

  /// Ilmanvaihtokoneet
  late final ventilationUnits = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.ventilationUnits?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.ventilationUnits?.tons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.ventilationUnitsUnitPrice);

  /// Sähkökaapit ja mittarit
  late final electricalDistributionCabinetsAndMeters = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments
              ?.electricalDistributionCabinetsAndMeters?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.electricalDistributionCabinetsAndMeters?.tons
          : null,
      unitPrice: recyclableComponentsAndFurniture
          ?.electricalDistributionCabinetsAndMetersUnitPrice);

  /// Huippuimurit
  late final roofExhaustFans = RecyclableItem(
      size: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.roofExhaustFans?.quantity
          : null,
      tons: (machinesAndEquipments?.machinesRecyclable ?? false)
          ? machinesAndEquipments?.roofExhaustFans?.tons
          : null,
      unitPrice: recyclableComponentsAndFurniture?.roofExhaustFansUnitPrice);

  List<RecyclableItem> get all => [
        concreteFrameBeams,
        concreteHollowSlabs,
        concreteRoofBeams,
        concreteWallElements,
        glulamBeams,
        floorSupportWoodenBeams,
        steelFrameBeams,
        rainGuttersAndDownspouts,
        fireLaddersAndWalkways,
        woodenRoofTrusses,
        steelRoofTrusses,
        steelChainLinkFence,
        aluminumChainLinkFence,
        woodAndFiberboardDoors,
        aluminumDoors,
        exteriorAndFireExitSteelDoors,
        woodenOrBoardCabinetsAndFurniture,
        steelLockerCabinets,
        woodenWindows,
        porcelainToilets,
        porcelainSinks,
        stainlessSteelSinksAndTables,
        saunaStoves,
        electricStoves,
        industrialElectricStoves,
        refrigerators,
        coldRoomCabinets,
        electricRadiators,
        smallElectricalAccumulators,
        largeElectricalAccumulators,
        electricMotorsAndCirculationPumps,
        ventilationUnits,
        electricalDistributionCabinetsAndMeters,
        roofExhaustFans,
      ];

  num? get totalVolume =>
      all.fold<num>(0, (acc, element) => acc + (element.volume ?? 0));

  num? get totalTons =>
      all.fold<num>(0, (acc, element) => acc + (element.tons ?? 0));

  num? get totalBatchPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
