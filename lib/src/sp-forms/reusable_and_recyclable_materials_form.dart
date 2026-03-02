import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_handling_costs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_handling_costs_event.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_material_value_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_material_value_event.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_note_bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_note_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/sp-bloc/total_reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SmallPropertiesReusableAndRecyclableMaterialsForm
    extends StatelessWidget {
  const SmallPropertiesReusableAndRecyclableMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmallPropertiesTotalReusableAndRecyclableMaterialsBloc,
            SmallPropertiesTotalReusableAndRecyclableMaterials>(
        builder: (context, state) {
      final notesBloc = context.read<RecyclableMaterialsNotesBloc>();
      final valueBloc = context.read<RecyclableMaterialsMaterialValueBloc>();
      final handlingBloc = context.read<RecyclableMaterialsHandlingCostsBloc>();

      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LayoutGrid(columnSizes: [
          210.px,
          120.px,
          120.px,
          300.px,
          120.px,
          120.px,
          120.px,
          120.px,
        ], rowSizes: [
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
        ], children: [
          Cell.header(
            initialValue: 'Hyödyntämiskelpoiset ja kierrätettävät materiaalit',
          ),
          Cell.column(initialValue: 'Määräarvio (tonnia)'),
          Cell.column(initialValue: ''),
          Cell.column(
              initialValue: 'Hyödyntäminen, käsittely tai loppusijoituspaikka'),
          Cell.column(initialValue: 'Käsittely- ja purkukustannus (€/tonni)'),
          Cell.column(initialValue: 'Purkukustannus/materiaalierä (€)'),
          Cell.column(initialValue: 'Materiaalin arvo (€/tonni)'),
          Cell.column(initialValue: 'Materiaalierän hinta (€)'),
          Cell.row(initialValue: "Maa-ainekset"),
          Cell.output(getter: () => state.cleanSoil.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.cleanSoil.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(CleanSoilNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.cleanSoil.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(CleanSoilHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.cleanSoil.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.cleanSoil.materialValue,
              setter: (value) =>
                  valueBloc.add(CleanSoilMaterialValueChanged(value))),
          Cell.output(getter: () => state.cleanSoil.batchPrice),
          Cell.row(initialValue: "Asfalttijäte"),
          Cell.output(getter: () => state.asphaltWaste.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.asphaltWaste.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(AsphaltWasteNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.asphaltWaste.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(AsphaltWasteHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.asphaltWaste.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.asphaltWaste.materialValue,
              setter: (value) =>
                  valueBloc.add(AsphaltWasteMaterialValueChanged(value))),
          Cell.output(getter: () => state.asphaltWaste.batchPrice),
          Cell.row(initialValue: "Puhdas betoni"),
          Cell.output(getter: () => state.cleanConcrete.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.cleanConcrete.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(CleanConcreteNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.cleanConcrete.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(CleanConcreteHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.cleanConcrete.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.cleanConcrete.materialValue,
              setter: (value) =>
                  valueBloc.add(CleanConcreteMaterialValueChanged(value))),
          Cell.output(getter: () => state.cleanConcrete.batchPrice),
          Cell.row(initialValue: "Betoniteräkset, peltikatto ja muu teräsromu"),
          Cell.output(getter: () => state.steel.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue: state.steel.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(SteelNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.steel.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(SteelHandlingCostsChanged(value)),
          ),
          Cell.output(getter: () => state.steel.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.steel.materialValue,
              setter: (value) =>
                  valueBloc.add(SteelMaterialValueChanged(value))),
          Cell.output(getter: () => state.steel.batchPrice),
          Cell.row(initialValue: "Seinä- ja kattotiilet"),
          Cell.output(getter: () => state.wallAndRoofTiles.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue: state
                .wallAndRoofTiles.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) =>
                notesBloc.add(WallAndRoofTilesNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.wallAndRoofTiles.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(WallAndRoofTilesHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.wallAndRoofTiles.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.wallAndRoofTiles.materialValue,
              setter: (value) =>
                  valueBloc.add(WallAndRoofTilesMaterialValueChanged(value))),
          Cell.output(getter: () => state.wallAndRoofTiles.batchPrice),
          Cell.row(initialValue: "Puhdas käyttökelpoinen puu"),
          Cell.output(getter: () => state.cleanUsableWood.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.cleanUsableWood.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) =>
                notesBloc.add(CleanUsableWoodNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.cleanUsableWood.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(CleanUsableWoodHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.cleanUsableWood.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.cleanUsableWood.materialValue,
              setter: (value) =>
                  valueBloc.add(CleanUsableWoodMaterialValueChanged(value))),
          Cell.output(getter: () => state.cleanUsableWood.batchPrice),
          Cell.row(initialValue: "Polttokelpoinen puujäte"),
          Cell.output(
              getter: () => state.combustibleWoodWaste.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue: state
                .combustibleWoodWaste.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) =>
                notesBloc.add(CombustibleWoodWasteNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.combustibleWoodWaste.handlingAndDismantlingCost,
            setter: (value) => handlingBloc
                .add(CombustibleWoodWasteHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.combustibleWoodWaste.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.combustibleWoodWaste.materialValue,
              setter: (value) => valueBloc
                  .add(CombustibleWoodWasteMaterialValueChanged(value))),
          Cell.output(getter: () => state.combustibleWoodWaste.batchPrice),
          Cell.row(initialValue: "Tuulensuojalevyt (bituliitti tai vastaava)"),
          Cell.output(getter: () => state.windProtectionBoard.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue: state
                .windProtectionBoard.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) =>
                notesBloc.add(WindProtectionBoardNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.windProtectionBoard.handlingAndDismantlingCost,
            setter: (value) => handlingBloc
                .add(WindProtectionBoardHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.windProtectionBoard.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.windProtectionBoard.materialValue,
              setter: (value) => valueBloc
                  .add(WindProtectionBoardMaterialValueChanged(value))),
          Cell.output(getter: () => state.windProtectionBoard.batchPrice),
          Cell.row(initialValue: "Lasi- ja mineraalieristevilla"),
          Cell.output(getter: () => state.glassAndMineralWool.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue: state
                .glassAndMineralWool.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) =>
                notesBloc.add(GlassAndMineralWoolNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.glassAndMineralWool.handlingAndDismantlingCost,
            setter: (value) => handlingBloc
                .add(GlassAndMineralWoolHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.glassAndMineralWool.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.glassAndMineralWool.materialValue,
              setter: (value) => valueBloc
                  .add(GlassAndMineralWoolMaterialValueChanged(value))),
          Cell.output(getter: () => state.glassAndMineralWool.batchPrice),
          Cell.row(initialValue: "Kipsilevyt (Cyproc)"),
          Cell.output(getter: () => state.gypsumBoards.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.gypsumBoards.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(GypsumBoardsNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.gypsumBoards.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(GypsumBoardsHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.gypsumBoards.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.gypsumBoards.materialValue,
              setter: (value) =>
                  valueBloc.add(GypsumBoardsMaterialValueChanged(value))),
          Cell.output(getter: () => state.gypsumBoards.batchPrice),
          Cell.row(initialValue: "Lastulevy"),
          Cell.output(getter: () => state.chipboard.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.chipboard.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(ChipboardNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.chipboard.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(ChipboardHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.chipboard.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.chipboard.materialValue,
              setter: (value) =>
                  valueBloc.add(ChipboardMaterialValueChanged(value))),
          Cell.output(getter: () => state.chipboard.batchPrice),
          Cell.row(
              initialValue:
                  "Energiajäte, maalattu puu, kattohuopa ja aluskate"),
          Cell.output(getter: () => state.energyWaste.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.energyWaste.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(EnergyWasteNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.energyWaste.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(EnergyWasteHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.energyWaste.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.energyWaste.materialValue,
              setter: (value) =>
                  valueBloc.add(EnergyWasteMaterialValueChanged(value))),
          Cell.output(getter: () => state.energyWaste.batchPrice),
          Cell.row(initialValue: "Lasi"),
          Cell.output(getter: () => state.glass.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue: state.glass.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(GlassNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.glass.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(GlassHandlingCostsChanged(value)),
          ),
          Cell.output(getter: () => state.glass.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.glass.materialValue,
              setter: (value) =>
                  valueBloc.add(GlassMaterialValueChanged(value))),
          Cell.output(getter: () => state.glass.batchPrice),
          Cell.row(initialValue: "Alumiini"),
          Cell.output(getter: () => state.aluminium.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.aluminium.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(AluminiumNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.aluminium.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(AluminiumHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.aluminium.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.aluminium.materialValue,
              setter: (value) =>
                  valueBloc.add(AluminiumMaterialValueChanged(value))),
          Cell.output(getter: () => state.aluminium.batchPrice),
          Cell.row(
              initialValue:
                  "Muu metalliromu, sähkökaapit, liedet, jääkaapit ym."),
          Cell.output(getter: () => state.rebarAndSteelScrap.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue: state
                .rebarAndSteelScrap.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) =>
                notesBloc.add(RebarAndSteelScrapNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.rebarAndSteelScrap.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(RebarAndSteelScrapHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.rebarAndSteelScrap.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.rebarAndSteelScrap.materialValue,
              setter: (value) =>
                  valueBloc.add(RebarAndSteelScrapMaterialValueChanged(value))),
          Cell.output(getter: () => state.rebarAndSteelScrap.batchPrice),
          Cell.row(initialValue: "Ruostumaton teräs"),
          Cell.output(getter: () => state.stainlessSteel.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.stainlessSteel.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(StainlessSteelNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.stainlessSteel.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(StainlessSteelHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.stainlessSteel.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.stainlessSteel.materialValue,
              setter: (value) =>
                  valueBloc.add(StainlessSteelMaterialValueChanged(value))),
          Cell.output(getter: () => state.stainlessSteel.batchPrice),
          Cell.row(initialValue: "Kupari"),
          Cell.output(getter: () => state.copper.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.copper.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(CopperNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.copper.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(CopperHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () => state.copper.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.copper.materialValue,
              setter: (value) =>
                  valueBloc.add(CopperMaterialValueChanged(value))),
          Cell.output(getter: () => state.copper.batchPrice),
          Cell.row(initialValue: "Betoniset pihalaatat ja muurikivet"),
          Cell.output(getter: () => state.concreteBlocks.quantityEstimate),
          Cell.grey(),
          InputTextRowCell(
            initialValue:
                state.concreteBlocks.exploitingOrProcessingOrFinalDisposalSite,
            setter: (value) => notesBloc.add(ConcreteBlocksNotesChanged(value)),
            label: 'Kirjoita tähän',
          ),
          Cell.input(
            initialValue: state.concreteBlocks.handlingAndDismantlingCost,
            setter: (value) =>
                handlingBloc.add(ConcreteBlocksHandlingCostsChanged(value)),
          ),
          Cell.output(
              getter: () =>
                  state.concreteBlocks.demolitionCostPerMaterialBatch),
          Cell.input(
              initialValue: state.concreteBlocks.materialValue,
              setter: (value) =>
                  valueBloc.add(ConcreteBlocksMaterialValueChanged(value))),
          Cell.output(getter: () => state.concreteBlocks.batchPrice),
          Cell.row(initialValue: "Hyödyntämiskelpoiset materiaalit yhteensä"),
          Cell.output(getter: () => state.totalQuantityEstimate),
          Cell.grey(),
          Cell.grey(),
          Cell.grey(),
          Cell.output(getter: () => state.totalDemolitionCost),
          Cell.grey(),
          Cell.output(getter: () => state.totalMaterialPrice),
        ])
      ]);
    });
  }
}
