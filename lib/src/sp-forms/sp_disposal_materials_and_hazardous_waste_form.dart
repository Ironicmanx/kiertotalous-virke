import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_costs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_costs_event.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_notes_bloc.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_notes_event.dart';
import 'package:flutter_app/src/sp-bloc/total_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SpDisposalMaterialsForm extends StatelessWidget {
  const SpDisposalMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final disposalBloc = context.read<DisposableAndHazardousCostsBloc>();
    final notesBloc = context.read<DisposableAndHazardousNotesBloc>();
    return BlocBuilder<
            SmallPropertiesTotalDisposalMaterialsAndHazardousWasteBloc,
            SmallPropertiesTotalDisposalMaterialsAndHazardousWaste>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutGrid(
            columnSizes: [
              230.px,
              120.px,
              300.px,
              120.px,
              140.px,
            ],
            rowSizes: [
              75.px,
              50.px,
              50.px,
              50.px,
              75.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
            ],
            children: [
              Cell.header(initialValue: 'Loppusijoitettavat materiaalit'),
              Cell.column(initialValue: 'Määräarvio (tonnia)'),
              Cell.column(
                  initialValue:
                      'Hyödyntäminen, käsittely tai loppusijoituspaikka'),
              Cell.column(
                  initialValue: 'Käsittely- ja purkukustannus (€/tonni)'),
              Cell.column(
                  initialValue:
                      'Purku- ja käsittelykustannus /materiaalierä (€)'),
              Cell.row(
                initialValue:
                    'Käyttökelvoton kaakeli ja posliini, sekä lasi- ja mineraalieristysvilla',
              ),
              Cell.output(
                  getter: () => state
                      .ceramicTilePorcelainAndGlassAndInsulationWool
                      .quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state
                      .ceramicTilePorcelainAndGlassAndInsulationWool
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(CeramicTileNotesChanged(value))),
              Cell.input(
                initialValue: state
                    .ceramicTilePorcelainAndGlassAndInsulationWool
                    .demolitionOrProcessingCost,
                setter: (value) => disposalBloc.add(
                  CeramicTileCostsChanged(value),
                ),
              ),
              Cell.output(
                  getter: () => state
                      .ceramicTilePorcelainAndGlassAndInsulationWool
                      .demolitionBatchPrice),
              Cell.row(
                initialValue: 'Kierrätyskelvoton tiilijäte',
              ),
              Cell.output(
                  getter: () => state.nonRecyclableBrickWaste.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.nonRecyclableBrickWaste
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(BrickWasteNotesChanged(value))),
              Cell.input(
                initialValue:
                    state.nonRecyclableBrickWaste.demolitionOrProcessingCost,
                setter: (value) => disposalBloc.add(
                  BrickWasteCostsChanged(value),
                ),
              ),
              Cell.output(
                  getter: () =>
                      state.nonRecyclableBrickWaste.demolitionBatchPrice),
              Cell.row(
                initialValue: 'Kierrätyskelvoton kipsilevy',
              ),
              Cell.output(
                  getter: () =>
                      state.nonRecyclablePlasterBoard.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.nonRecyclablePlasterBoard
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(PlasterBoardNotesChanged(value))),
              Cell.input(
                initialValue:
                    state.nonRecyclablePlasterBoard.demolitionOrProcessingCost,
                setter: (value) => disposalBloc.add(
                  PlasterBoardCostsChanged(value),
                ),
              ),
              Cell.output(
                  getter: () =>
                      state.nonRecyclablePlasterBoard.demolitionBatchPrice),
              Cell.header(initialValue: 'Ongelmajätteet'),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.row(
                initialValue: 'Saastunut maa',
              ),
              Cell.output(
                  getter: () => state.contaminatedSoil.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.contaminatedSoil
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(ContaminatedSoilNotesChanged(value))),
              Cell.input(
                initialValue: state.contaminatedSoil.demolitionOrProcessingCost,
                setter: (value) => disposalBloc.add(
                  ContaminatedSoilCostsChanged(value),
                ),
              ),
              Cell.output(
                  getter: () => state.contaminatedSoil.demolitionBatchPrice),
              Cell.row(
                initialValue: 'Asbestia sisältävä betoni',
              ),
              Cell.output(
                  getter: () =>
                      state.concreteContainingAsbestos.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.concreteContainingAsbestos
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(AsbestosConcreteNotesChanged(value))),
              Cell.input(
                initialValue:
                    state.concreteContainingAsbestos.demolitionOrProcessingCost,
                setter: (value) => disposalBloc.add(
                  AsbestosConcreteCostsChanged(value),
                ),
              ),
              Cell.output(
                  getter: () =>
                      state.concreteContainingAsbestos.demolitionBatchPrice),
              Cell.row(
                initialValue: 'Mineriitti- tai huopakate, sisältää asbestia',
              ),
              Cell.output(
                  getter: () =>
                      state.mineriteOrFeltContainingAsbestos.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.mineriteOrFeltContainingAsbestos
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(MineriteFeltNotesChanged(value))),
              Cell.input(
                initialValue: state.mineriteOrFeltContainingAsbestos
                    .demolitionOrProcessingCost,
                setter: (value) => disposalBloc.add(
                  MineriteFeltCostsChanged(value),
                ),
              ),
              Cell.output(
                  getter: () => state
                      .mineriteOrFeltContainingAsbestos.demolitionBatchPrice),
              Cell.row(
                initialValue: 'BCP maalia sisältävä betoni',
              ),
              Cell.output(
                  getter: () =>
                      state.concreteContainingPcbPaint.quantityEstimate),
              InputTextRowCell(
                  label: 'Kirjoita tähän',
                  initialValue: state.concreteContainingPcbPaint
                      .exploitingOrProcessingOrFinalDisposalSite,
                  setter: (value) =>
                      notesBloc.add(PcbPaintNotesChanged(value))),
              Cell.input(
                initialValue:
                    state.concreteContainingPcbPaint.demolitionOrProcessingCost,
                setter: (value) => disposalBloc.add(
                  PcbPaintCostsChanged(value),
                ),
              ),
              Cell.output(
                  getter: () =>
                      state.concreteContainingPcbPaint.demolitionBatchPrice),
              Cell.row(
                initialValue: 'Loppusijoitettavat materiaalit yhteensä',
              ),
              Cell.output(getter: () => state.totalQuantityEstimate),
              GreyCell(),
              GreyCell(),
              Cell.output(getter: () => state.totalDemolitionBatchPrice),
            ],
          ),
        ],
      );
    });
  }
}
