import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_handling_and_dismantling_costs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_handling_and_dismantling_costs_event.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_notes_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_notes_event.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_unit_price_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_unit_price_event.dart';
import 'package:flutter_app/src/sp-bloc/total_recyclable_components_and_furniture_bloc.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SmallPropertiesTotalRecyclableComponentsAndFurnitureForm
    extends StatelessWidget {
  const SmallPropertiesTotalRecyclableComponentsAndFurnitureForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmallPropertiesTotalRecyclableComponentsAndFurnitureBloc,
            SmallPropertiesTotalRecyclableComponentsAndFurniture>(
        builder: (context, state) {
      final notesBloc = context.read<RecyclableComponentsNotesBloc>();
      final handlingBloc =
          context.read<RecyclableComponentsHandlingAndDismantlingCostsBloc>();
      final valueBloc = context.read<RecyclableComponentsUnitPriceBloc>();
      context.read<RecyclableComponentsHandlingAndDismantlingCostsBloc>();
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LayoutGrid(
          columnSizes: [
            210.px,
            120.px,
            120.px,
            300.px,
            120.px,
            120.px,
            120.px,
            120.px,
          ],
          rowSizes: [
            75.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
            50.px,
          ],
          children: [
            Cell.header(
              initialValue: 'Kierrätettävät rakenneosat ja kalusteet',
            ),
            Cell.column(initialValue: 'Määräarvio (tonnia)'),
            Cell.column(initialValue: 'Kappale'),
            Cell.column(
                initialValue:
                    'Hyödyntäminen, käsittely tai loppusijoituspaikka'),
            Cell.column(initialValue: 'Käsittely- ja purkukustannus (€/tonni)'),
            Cell.column(initialValue: 'Purkukustannus/materiaalierä (€)'),
            Cell.column(initialValue: '€/Kappale'),
            Cell.column(initialValue: 'Materiaalierän hinta (€)'),
            Cell.row(initialValue: "Puu ja kuitulevyovet"),
            Cell.output(
                getter: () => state.woodAndFiberboardDoors.quantityEstimate),
            Cell.output(getter: () => state.woodAndFiberboardDoors.pcs),
            InputTextRowCell(
              initialValue: state.woodAndFiberboardDoors
                  .exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(WoodAndFiberboardDoorsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue:
                  state.woodAndFiberboardDoors.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(WoodAndFiberboardDoorsCostsChanged(value)),
            ),
            Cell.output(
                getter: () => state
                    .woodAndFiberboardDoors.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.woodAndFiberboardDoors.unitPrice,
                setter: (value) => valueBloc
                    .add(WoodAndFiberboardDoorsUnitPriceChanged(value))),
            Cell.output(getter: () => state.woodAndFiberboardDoors.batchPrice),
            Cell.row(initialValue: "Alumiiniovet"),
            Cell.output(getter: () => state.aluminumDoors.quantityEstimate),
            Cell.output(getter: () => state.aluminumDoors.pcs),
            InputTextRowCell(
              initialValue:
                  state.aluminumDoors.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(AluminumDoorsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.aluminumDoors.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(AluminumDoorsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.aluminumDoors.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.aluminumDoors.unitPrice,
                setter: (value) =>
                    valueBloc.add(AluminumDoorsUnitPriceChanged(value))),
            Cell.output(getter: () => state.aluminumDoors.batchPrice),
            Cell.row(initialValue: "Teräsovet"),
            Cell.output(getter: () => state.steelDoors.quantityEstimate),
            Cell.output(getter: () => state.steelDoors.pcs),
            InputTextRowCell(
              initialValue:
                  state.steelDoors.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) => notesBloc.add(SteelDoorsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.steelDoors.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(SteelDoorsCostsChanged(value)),
            ),
            Cell.output(
                getter: () => state.steelDoors.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.steelDoors.unitPrice,
                setter: (value) =>
                    valueBloc.add(SteelDoorsUnitPriceChanged(value))),
            Cell.output(getter: () => state.steelDoors.batchPrice),
            Cell.row(initialValue: "Puiset ikkunat"),
            Cell.output(getter: () => state.woodenWindows.quantityEstimate),
            Cell.output(getter: () => state.woodenWindows.pcs),
            InputTextRowCell(
              initialValue:
                  state.woodenWindows.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(WoodenWindowsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.woodenWindows.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(WoodenWindowsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.woodenWindows.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.woodenWindows.unitPrice,
                setter: (value) =>
                    valueBloc.add(WoodenWindowsUnitPriceChanged(value))),
            Cell.output(getter: () => state.woodenWindows.batchPrice),
            Cell.row(initialValue: "Teräskarmi-ikkunat"),
            Cell.output(getter: () => state.steelFrameWindows.quantityEstimate),
            Cell.output(getter: () => state.steelFrameWindows.pcs),
            InputTextRowCell(
              initialValue: state
                  .steelFrameWindows.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(SteelFrameWindowsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.steelFrameWindows.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(SteelFrameWindowsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.steelFrameWindows.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.steelFrameWindows.unitPrice,
                setter: (value) =>
                    valueBloc.add(SteelFrameWindowsUnitPriceChanged(value))),
            Cell.output(getter: () => state.steelFrameWindows.batchPrice),
            Cell.row(initialValue: "Alumiinikarmi-ikkunat"),
            Cell.output(
                getter: () => state.aluminumFrameWindows.quantityEstimate),
            Cell.output(getter: () => state.aluminumFrameWindows.pcs),
            InputTextRowCell(
              initialValue: state.aluminumFrameWindows
                  .exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(AluminumFrameWindowsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue:
                  state.aluminumFrameWindows.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(AluminumFrameWindowsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.aluminumFrameWindows.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.aluminumFrameWindows.unitPrice,
                setter: (value) =>
                    valueBloc.add(AluminumFrameWindowsUnitPriceChanged(value))),
            Cell.output(getter: () => state.aluminumFrameWindows.batchPrice),
            Cell.row(initialValue: "WC-istuimet"),
            Cell.output(getter: () => state.porcelainToilets.quantityEstimate),
            Cell.output(getter: () => state.porcelainToilets.pcs),
            InputTextRowCell(
              initialValue: state
                  .porcelainToilets.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(PorcelainToiletsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.porcelainToilets.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(PorcelainToiletsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.porcelainToilets.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.porcelainToilets.unitPrice,
                setter: (value) =>
                    valueBloc.add(PorcelainToiletsUnitPriceChanged(value))),
            Cell.output(getter: () => state.porcelainToilets.batchPrice),
            Cell.row(initialValue: "Kaapit ja kalusteet"),
            Cell.output(
                getter: () => state.cabinetsAndFurniture.quantityEstimate),
            Cell.output(getter: () => state.cabinetsAndFurniture.pcs),
            InputTextRowCell(
              initialValue: state.cabinetsAndFurniture
                  .exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(CabinetsAndFurnitureNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue:
                  state.cabinetsAndFurniture.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(CabinetsAndFurnitureCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.cabinetsAndFurniture.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.cabinetsAndFurniture.unitPrice,
                setter: (value) =>
                    valueBloc.add(CabinetsAndFurnitureUnitPriceChanged(value))),
            Cell.output(getter: () => state.cabinetsAndFurniture.batchPrice),
            Cell.row(initialValue: "Pesuallas (posliini)"),
            Cell.output(getter: () => state.porcelainSinks.quantityEstimate),
            Cell.output(getter: () => state.porcelainSinks.pcs),
            InputTextRowCell(
              initialValue: state
                  .porcelainSinks.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(PorcelainSinksNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.porcelainSinks.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(PorcelainSinksCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.porcelainSinks.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.porcelainSinks.unitPrice,
                setter: (value) =>
                    valueBloc.add(PorcelainSinksUnitPriceChanged(value))),
            Cell.output(getter: () => state.porcelainSinks.batchPrice),
            Cell.row(initialValue: "Teräsaltaat ja pöydät"),
            Cell.output(
                getter: () =>
                    state.stainlessSteelSinksAndTables.quantityEstimate),
            Cell.output(getter: () => state.stainlessSteelSinksAndTables.pcs),
            InputTextRowCell(
              initialValue: state.stainlessSteelSinksAndTables
                  .exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) => notesBloc
                  .add(StainlessSteelSinksAndTablesNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue:
                  state.stainlessSteelSinksAndTables.handlingAndDismantlingCost,
              setter: (value) => handlingBloc
                  .add(StainlessSteelSinksAndTablesCostsChanged(value)),
            ),
            Cell.output(
                getter: () => state.stainlessSteelSinksAndTables
                    .demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.stainlessSteelSinksAndTables.unitPrice,
                setter: (value) => valueBloc
                    .add(StainlessSteelSinksAndTablesUnitPriceChanged(value))),
            Cell.output(
                getter: () => state.stainlessSteelSinksAndTables.batchPrice),
            Cell.row(initialValue: "Saunankiukaat"),
            Cell.output(getter: () => state.saunaStove.quantityEstimate),
            Cell.output(getter: () => state.saunaStove.pcs),
            InputTextRowCell(
              initialValue:
                  state.saunaStove.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) => notesBloc.add(SaunaStovesNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.saunaStove.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(SaunaStovesCostsChanged(value)),
            ),
            Cell.output(
                getter: () => state.saunaStove.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.saunaStove.unitPrice,
                setter: (value) =>
                    valueBloc.add(SaunaStovesUnitPriceChanged(value))),
            Cell.output(getter: () => state.saunaStove.batchPrice),
            Cell.row(initialValue: "Sähköliedet"),
            Cell.output(getter: () => state.electricStove.quantityEstimate),
            Cell.output(getter: () => state.electricStove.pcs),
            InputTextRowCell(
              initialValue:
                  state.electricStove.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(ElectricStovesNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.electricStove.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(ElectricStovesCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.electricStove.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.electricStove.unitPrice,
                setter: (value) =>
                    valueBloc.add(ElectricStovesUnitPriceChanged(value))),
            Cell.output(getter: () => state.electricStove.batchPrice),
            Cell.row(initialValue: "Jääkaapit"),
            Cell.output(getter: () => state.refrigerator.quantityEstimate),
            Cell.output(getter: () => state.refrigerator.pcs),
            InputTextRowCell(
              initialValue:
                  state.refrigerator.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(RefrigeratorsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.refrigerator.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(RefrigeratorsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.refrigerator.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.refrigerator.unitPrice,
                setter: (value) =>
                    valueBloc.add(RefrigeratorsUnitPriceChanged(value))),
            Cell.output(getter: () => state.refrigerator.batchPrice),
            Cell.row(initialValue: "Vesivaraajat"),
            Cell.output(getter: () => state.waterAccumulator.quantityEstimate),
            Cell.output(getter: () => state.waterAccumulator.pcs),
            InputTextRowCell(
              initialValue: state
                  .waterAccumulator.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(WaterAccumulatorsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.waterAccumulator.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(WaterAccumulatorsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.waterAccumulator.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.waterAccumulator.unitPrice,
                setter: (value) =>
                    valueBloc.add(WaterAccumulatorsUnitPriceChanged(value))),
            Cell.output(getter: () => state.waterAccumulator.batchPrice),
            Cell.row(initialValue: "Sähkömoottorit"),
            Cell.output(getter: () => state.electricMotors.quantityEstimate),
            Cell.output(getter: () => state.electricMotors.pcs),
            InputTextRowCell(
              initialValue: state
                  .electricMotors.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(ElectricMotorsNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue: state.electricMotors.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(ElectricMotorsCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.electricMotors.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.electricMotors.unitPrice,
                setter: (value) =>
                    valueBloc.add(ElectricMotorsUnitPriceChanged(value))),
            Cell.output(getter: () => state.electricMotors.batchPrice),
            Cell.row(initialValue: "lmanvaihtokoneet"),
            Cell.output(
                getter: () => state.ventilationMachines.quantityEstimate),
            Cell.output(getter: () => state.ventilationMachines.pcs),
            InputTextRowCell(
              initialValue: state.ventilationMachines
                  .exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(VentilationMachinesNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.input(
              initialValue:
                  state.ventilationMachines.handlingAndDismantlingCost,
              setter: (value) =>
                  handlingBloc.add(VentilationMachinesCostsChanged(value)),
            ),
            Cell.output(
                getter: () =>
                    state.ventilationMachines.demolitionCostPerMaterialBatch),
            Cell.input(
                initialValue: state.ventilationMachines.unitPrice,
                setter: (value) =>
                    valueBloc.add(VentilationMachinesUnitPriceChanged(value))),
            Cell.output(getter: () => state.ventilationMachines.batchPrice),
            Cell.row(initialValue: "Lämpökattilat"),
            Cell.output(getter: () => state.thermalBoiler.quantityEstimate),
            Cell.output(getter: () => state.thermalBoiler.pcs),
            InputTextRowCell(
              initialValue:
                  state.thermalBoiler.exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(ThermalBoilerNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.grey(),
            Cell.grey(),
            Cell.grey(),
            Cell.grey(),
            Cell.row(initialValue: "Kaukolämmönvaihdin"),
            Cell.output(
                getter: () => state.districtHeatingExchanger.quantityEstimate),
            Cell.output(getter: () => state.districtHeatingExchanger.pcs),
            InputTextRowCell(
              initialValue: state.districtHeatingExchanger
                  .exploitingOrProcessingOrFinalDisposalSite,
              setter: (value) =>
                  notesBloc.add(DistrictHeatingExchangerNotesChanged(value)),
              label: 'Kirjoita tähän',
            ),
            Cell.grey(),
            Cell.grey(),
            Cell.grey(),
            Cell.grey(),
            Cell.row(initialValue: "Kierrätettävät materiaalit yhteensä"),
            Cell.output(getter: () => state.totalQuantityEstimate),
            Cell.grey(),
            Cell.grey(),
            Cell.grey(),
            Cell.output(
              getter: () => state.totalDemolitionCost,
            ),
            Cell.grey(),
            Cell.output(getter: () => state.totalBatchPrice),
          ],
        ),
      ]);
    });
  }
}
