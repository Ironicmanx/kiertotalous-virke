import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_recyclable_materials_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_recyclable_materials_event.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

//Recyclable Materials UI Form
class RecyclableMaterialsForm extends StatelessWidget {
  const RecyclableMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final recyclableBloc = context.read<RecyclableMaterialsBloc>();
    return BlocBuilder<TotalRecyclableComponentsAndFurnitureBloc,
        TotalRecyclableComponentsAndFurniture>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutGrid(
            columnSizes: [
              210.px,
              120.px,
              120.px,
              120.px,
              120.px,
              120.px,
            ],
            rowSizes: List.generate(36, (_) => 50.px),
            children: [
              // Row 1
              HeaderCell(
                  initialValue: "Kierrätettävät rakenneosat ja kalusteet"),
              ColumnCell(initialValue: "Myyntihinta (€/kpl tai €/tonni)"),
              ColumnCell(initialValue: "Materiaalierän hinta (€)"),
              ColumnCell(initialValue: "Tilavuus (m3)"),
              ColumnCell(initialValue: "Yhteispaino (tonnia)"),
              ColumnCell(initialValue: "Määrä (kpl, m tai m2)"),

              // Row 2
              RowCell(initialValue: "Betonipalkit (runko)"),
              InputCell(
                initialValue: state.concreteFrameBeams.unitPrice,
                setter: (value) => recyclableBloc
                    .add(ConcreteFrameBeamsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.concreteFrameBeams.batchPrice),
              OutputCell(getter: () => state.concreteFrameBeams.volume),
              OutputCell(getter: () => state.concreteFrameBeams.tons),
              GreyCell(),

              // Row 3
              RowCell(initialValue: "Betoniset ontelolaatat"),
              InputCell(
                initialValue: state.concreteHollowSlabs.unitPrice,
                setter: (value) => recyclableBloc
                    .add(ConcreteHollowSlabsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.concreteHollowSlabs.batchPrice),
              OutputCell(getter: () => state.concreteHollowSlabs.volume),
              OutputCell(getter: () => state.concreteHollowSlabs.tons),
              GreyCell(),

              // Row 4
              RowCell(initialValue: "Betoniset kattopalkit"),
              InputCell(
                initialValue: state.concreteRoofBeams.unitPrice,
                setter: (value) => recyclableBloc
                    .add(ConcreteRoofBeamsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.concreteRoofBeams.batchPrice),
              OutputCell(getter: () => state.concreteRoofBeams.volume),
              OutputCell(getter: () => state.concreteRoofBeams.tons),
              GreyCell(),

              // Row 5
              RowCell(initialValue: "Betoniset seinäelementit"),
              InputCell(
                initialValue: state.concreteWallElements.unitPrice,
                setter: (value) => recyclableBloc
                    .add(ConcreteWallElementsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.concreteWallElements.batchPrice),
              OutputCell(getter: () => state.concreteWallElements.volume),
              OutputCell(getter: () => state.concreteWallElements.tons),
              GreyCell(),

              // Row 6
              RowCell(initialValue: "Liimapalkit"),
              InputCell(
                initialValue: state.glulamBeams.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(GlulamBeamsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.glulamBeams.batchPrice),
              OutputCell(getter: () => state.glulamBeams.volume),
              OutputCell(getter: () => state.glulamBeams.tons),
              GreyCell(),

              // Row 7
              RowCell(initialValue: "Puupalkit (kantavat lattiapalkit)"),
              InputCell(
                initialValue: state.floorSupportWoodenBeams.unitPrice,
                setter: (value) => recyclableBloc
                    .add(FloorSupportWoodenBeamsUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () => state.floorSupportWoodenBeams.batchPrice),
              OutputCell(getter: () => state.floorSupportWoodenBeams.volume),
              OutputCell(getter: () => state.floorSupportWoodenBeams.tons),
              GreyCell(),

              // Row 8
              RowCell(initialValue: "Teräspalkit, runkopalkit"),
              InputCell(
                initialValue: state.steelFrameBeams.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(SteelFrameBeamsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.steelFrameBeams.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.steelFrameBeams.tons),
              GreyCell(),

              // Row 9
              RowCell(initialValue: "Sadevesikourut ja ränit (m)"),
              InputCell(
                initialValue: state.rainGuttersAndDownspouts.unitPrice,
                setter: (value) => recyclableBloc
                    .add(RainGuttersAndDownspoutsUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () => state.rainGuttersAndDownspouts.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.rainGuttersAndDownspouts.tons),
              OutputCell(getter: () => state.rainGuttersAndDownspouts.size),

              // Row 10
              RowCell(initialValue: "Palotikkaat ja kulkusillat (m)"),
              InputCell(
                initialValue: state.fireLaddersAndWalkways.unitPrice,
                setter: (value) => recyclableBloc
                    .add(FireLaddersAndWalkwaysUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.fireLaddersAndWalkways.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.fireLaddersAndWalkways.tons),
              OutputCell(getter: () => state.fireLaddersAndWalkways.size),

              // Row 11
              RowCell(initialValue: "Puiset kattoristikot"),
              InputCell(
                initialValue: state.woodenRoofTrusses.unitPrice,
                setter: (value) => recyclableBloc
                    .add(WoodenRoofTrussesUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.woodenRoofTrusses.batchPrice),
              OutputCell(getter: () => state.woodenRoofTrusses.volume),
              OutputCell(getter: () => state.woodenRoofTrusses.tons),
              GreyCell(),
              // Row 12
              RowCell(initialValue: "Teräksiset kattoristikot"),
              InputCell(
                initialValue: state.steelRoofTrusses.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(SteelRoofTrussesUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.steelRoofTrusses.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.steelRoofTrusses.tons),
              GreyCell(),

              // Row 13
              RowCell(initialValue: "Teräsverkkoaita (m)"),
              InputCell(
                initialValue: state.steelChainLinkFence.unitPrice,
                setter: (value) => recyclableBloc
                    .add(SteelChainLinkFenceUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.steelChainLinkFence.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.steelChainLinkFence.tons),
              OutputCell(getter: () => state.steelChainLinkFence.size),

              // Row 14
              RowCell(initialValue: "Alumiiniverkkoaita (m)"),
              InputCell(
                initialValue: state.aluminumChainLinkFence.unitPrice,
                setter: (value) => recyclableBloc
                    .add(AluminumChainLinkFenceUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.aluminumChainLinkFence.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.aluminumChainLinkFence.tons),
              OutputCell(getter: () => state.aluminumChainLinkFence.size),
              // Row 15
              RowCell(initialValue: "Puuovet ja kuitulevyovet"),
              InputCell(
                initialValue: state.woodAndFiberboardDoors.unitPrice,
                setter: (value) => recyclableBloc
                    .add(WoodAndFiberboardDoorsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.woodAndFiberboardDoors.batchPrice),
              OutputCell(getter: () => state.woodAndFiberboardDoors.volume),
              OutputCell(getter: () => state.woodAndFiberboardDoors.tons),
              OutputCell(getter: () => state.woodAndFiberboardDoors.size),

              // Row 16
              RowCell(initialValue: "Alumiiniovet"),
              InputCell(
                initialValue: state.aluminumDoors.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(AluminumDoorsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.aluminumDoors.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.aluminumDoors.tons),
              OutputCell(getter: () => state.aluminumDoors.size),

              // Row 17
              RowCell(initialValue: "Teräsovet"),
              InputCell(
                initialValue: state.exteriorAndFireExitSteelDoors.unitPrice,
                setter: (value) => recyclableBloc
                    .add(ExteriorAndFireExitSteelDoorsUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () => state.exteriorAndFireExitSteelDoors.batchPrice),
              GreyCell(),
              OutputCell(
                  getter: () => state.exteriorAndFireExitSteelDoors.tons),
              OutputCell(
                  getter: () => state.exteriorAndFireExitSteelDoors.size),

              // Row 18
              RowCell(
                  initialValue:
                      "Kaapit & kalusteet, puu tai levy (keittiö & sosiaalitilat)"),
              InputCell(
                initialValue: state.woodenOrBoardCabinetsAndFurniture.unitPrice,
                setter: (value) => recyclableBloc.add(
                    WoodenOrBoardCabinetsAndFurnitureUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () =>
                      state.woodenOrBoardCabinetsAndFurniture.batchPrice),
              OutputCell(
                  getter: () => state.woodenOrBoardCabinetsAndFurniture.volume),
              OutputCell(
                  getter: () => state.woodenOrBoardCabinetsAndFurniture.tons),
              OutputCell(
                  getter: () => state.woodenOrBoardCabinetsAndFurniture.size),

              // Row 19
              RowCell(initialValue: "Teräksiset pukukaapit"),
              InputCell(
                initialValue: state.steelLockerCabinets.unitPrice,
                setter: (value) => recyclableBloc
                    .add(SteelLockerCabinetsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.steelLockerCabinets.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.steelLockerCabinets.tons),
              OutputCell(getter: () => state.steelLockerCabinets.size),

              // Row 20
              RowCell(initialValue: "Puuikkunat"),
              InputCell(
                initialValue: state.woodenWindows.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(WoodenWindowsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.woodenWindows.batchPrice),
              OutputCell(getter: () => state.woodenWindows.volume),
              OutputCell(getter: () => state.woodenWindows.tons),
              OutputCell(getter: () => state.woodenWindows.size),

              // Row 21
              RowCell(initialValue: "WC-istuin (posliini)"),
              InputCell(
                initialValue: state.porcelainToilets.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(PorcelainToiletsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.porcelainToilets.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.porcelainToilets.size),

              // Row 22
              RowCell(initialValue: "Pesuallas (posliini)"),
              InputCell(
                initialValue: state.porcelainSinks.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(PorcelainSinksUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.porcelainSinks.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.porcelainSinks.size),

              // Row 23
              RowCell(initialValue: "Ruostumattomat teräsaltaat ja pöydät"),
              InputCell(
                initialValue: state.stainlessSteelSinksAndTables.unitPrice,
                setter: (value) => recyclableBloc
                    .add(StainlessSteelSinksAndTablesUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () => state.stainlessSteelSinksAndTables.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.stainlessSteelSinksAndTables.size),
              // Row 24
              RowCell(initialValue: "Saunankiukaat"),
              InputCell(
                initialValue: state.saunaStoves.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(SaunaStovesUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.saunaStoves.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.saunaStoves.size),
              // Row 25
              RowCell(initialValue: "Sähköliedet"),
              InputCell(
                initialValue: state.electricStoves.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(ElectricStovesUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.electricStoves.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.electricStoves.size),
              // Row 26
              RowCell(initialValue: "Suurtalous sähköliedet"),
              InputCell(
                initialValue: state.industrialElectricStoves.unitPrice,
                setter: (value) => recyclableBloc
                    .add(IndustrialElectricStovesUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () => state.industrialElectricStoves.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.industrialElectricStoves.size),
              // Row 27
              RowCell(initialValue: "Jääkaapit"),
              InputCell(
                initialValue: state.refrigerators.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(RefrigeratorsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.refrigerators.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.refrigerators.size),
              // Row 28
              RowCell(initialValue: "Kylmiökaapit"),
              InputCell(
                initialValue: state.coldRoomCabinets.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(ColdRoomCabinetsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.coldRoomCabinets.batchPrice),
              GreyCell(),
              GreyCell(),
              OutputCell(getter: () => state.coldRoomCabinets.size),
              // Row 29
              RowCell(initialValue: "Lämpöpatterit (sähkö)"),
              InputCell(
                initialValue: state.electricRadiators.unitPrice,
                setter: (value) => recyclableBloc
                    .add(ElectricRadiatorsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.electricRadiators.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.electricRadiators.tons),
              OutputCell(getter: () => state.electricRadiators.size),
              // Row 30
              RowCell(initialValue: "Vesivaraajat (pienet)"),
              InputCell(
                initialValue: state.smallElectricalAccumulators.unitPrice,
                setter: (value) => recyclableBloc
                    .add(SmallElectricalAccumulatorsUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () => state.smallElectricalAccumulators.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.smallElectricalAccumulators.tons),
              OutputCell(getter: () => state.smallElectricalAccumulators.size),
              // Row 31
              RowCell(initialValue: "Vesivaraajat (suuret)"),
              InputCell(
                initialValue: state.largeElectricalAccumulators.unitPrice,
                setter: (value) => recyclableBloc
                    .add(LargeElectricalAccumulatorsUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () => state.largeElectricalAccumulators.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.largeElectricalAccumulators.tons),
              OutputCell(getter: () => state.largeElectricalAccumulators.size),
              // Row 32
              RowCell(initialValue: "Sähkömoottorit ja kiertovesipumput"),
              InputCell(
                initialValue: state.electricMotorsAndCirculationPumps.unitPrice,
                setter: (value) => recyclableBloc.add(
                    ElectricMotorsAndCirculationPumpsUnitPriceChanged(value)),
              ),
              OutputCell(
                  getter: () =>
                      state.electricMotorsAndCirculationPumps.batchPrice),
              GreyCell(),
              OutputCell(
                  getter: () => state.electricMotorsAndCirculationPumps.tons),
              OutputCell(
                  getter: () => state.electricMotorsAndCirculationPumps.size),
              // Row 33
              RowCell(initialValue: "Ilmanvaihtokoneet"),
              InputCell(
                initialValue: state.ventilationUnits.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(VentilationUnitsUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.ventilationUnits.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.ventilationUnits.tons),
              OutputCell(getter: () => state.ventilationUnits.size),
              // Row 34
              RowCell(initialValue: "Sähkökaapit ja mittarit"),
              InputCell(
                initialValue:
                    state.electricalDistributionCabinetsAndMeters.unitPrice,
                setter: (value) => recyclableBloc.add(
                    ElectricalDistributionCabinetsAndMetersUnitPriceChanged(
                        value)),
              ),
              OutputCell(
                  getter: () =>
                      state.electricalDistributionCabinetsAndMeters.batchPrice),
              GreyCell(),
              OutputCell(
                  getter: () =>
                      state.electricalDistributionCabinetsAndMeters.tons),
              OutputCell(
                  getter: () =>
                      state.electricalDistributionCabinetsAndMeters.size),
              // Row 35
              RowCell(initialValue: "Huippuimurit"),
              InputCell(
                initialValue: state.roofExhaustFans.unitPrice,
                setter: (value) =>
                    recyclableBloc.add(RoofExhaustFansUnitPriceChanged(value)),
              ),
              OutputCell(getter: () => state.roofExhaustFans.batchPrice),
              GreyCell(),
              OutputCell(getter: () => state.roofExhaustFans.tons),
              OutputCell(getter: () => state.roofExhaustFans.size),
              // Row 36
              RowCell(initialValue: "Yhteensä"),
              GreyCell(),
              OutputCell(getter: () => state.totalBatchPrice),
              OutputCell(getter: () => state.totalVolume),
              OutputCell(getter: () => state.totalTons),
              GreyCell(),
            ],
          ),
        ],
      );
    });
  }
}
