import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/metals_and_alloys_bloc.dart';
import 'package:flutter_app/src/lp-bloc/metals_and_alloys_event.dart';
import 'package:flutter_app/src/lp-bloc/total_metals_and_alloys_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class MetalsAndAlloysForm extends StatelessWidget {
  const MetalsAndAlloysForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MetalsAndAlloysBloc>();

    return BlocBuilder<TotalMetalsAndAlloysBloc, TotalMetalsAndAlloys>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutGrid(
              columnSizes: [
                200.px,
                400.px,
                100.px,
                100.px,
                450.px,
              ],
              rowSizes: [
                60.px,
                50.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
              ],
              children: [
                ColumnCell(initialValue: "Jätekoodi"),
                ColumnCell(
                    initialValue:
                        "Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus"),
                ColumnCell(initialValue: "Tilavuus (m3)"),
                ColumnCell(initialValue: "Määrä-arvio (tonnia)"),
                ColumnCell(initialValue: "Huomautuksia ja lisätietoja"),

                // Row 2
                RowCell(initialValue: "17 04"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 4,
                  rowStart: 1,
                  child: RowCell(
                      initialValue: "Metallit, niiden seokset (lejeeringit)",
                      centerText: true),
                ),

                // Row 3
                RowCell(initialValue: "17 04 01"),
                OutputCell(getter: () => "Kupari, pronssi, messinki"),
                OutputCell(getter: () => ""),
                OutputCell(getter: () => state.copperBronzeAndBrass.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.copperBronzeAndBrass.notes,
                    setter: (value) =>
                        bloc.add(CopperBronzeAndBrassNotesChanged(value))),

                // Row 4
                RowCell(initialValue: "17 04 02"),
                OutputCell(getter: () => "Alumiini"),
                OutputCell(getter: () => ""),
                OutputCell(getter: () => state.aluminium.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.aluminium.notes,
                    setter: (value) => bloc.add(AluminiumNotesChanged(value))),

                // Row 5
                RowCell(initialValue: "17 04 03"),
                OutputCell(getter: () => "Lyijy"),
                OutputCell(getter: () => ""),
                InputCell(
                    initialValue: state.lead?.tons,
                    setter: (value) => bloc.add(LeadTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.lead?.notes,
                    setter: (value) => bloc.add(LeadNotesChanged(value))),

                // Row 6
                RowCell(initialValue: "17 04 04"),
                OutputCell(getter: () => "Sinkki"),
                OutputCell(getter: () => ""),
                InputCell(
                    initialValue: state.zinc?.tons,
                    setter: (value) => bloc.add(ZincTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.zinc?.notes,
                    setter: (value) => bloc.add(ZincNotesChanged(value))),

                // Row 7
                RowCell(initialValue: "17 04 05"),
                OutputCell(getter: () => "Rauta ja teräs"),
                OutputCell(getter: () => ""),
                OutputCell(getter: () => state.ironAndSteel.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.ironAndSteel.notes,
                    setter: (value) =>
                        bloc.add(IronAndSteelNotesChanged(value))),

                // Row 8
                RowCell(initialValue: "17 04 06"),
                OutputCell(getter: () => "Tina"),
                OutputCell(getter: () => ""),
                InputCell(
                    initialValue: state.tin?.tons,
                    setter: (value) => bloc.add(TinTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.tin?.notes,
                    setter: (value) => bloc.add(TinNotesChanged(value))),

                // Row 9
                RowCell(initialValue: "17 04 07"),
                OutputCell(getter: () => "Sekametallit"),
                OutputCell(getter: () => ""),
                OutputCell(getter: () => state.mixedMetals.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.mixedMetals.notes,
                    setter: (value) =>
                        bloc.add(MixedMetalsNotesChanged(value))),

                // Row 10
                RowCell(initialValue: "17 04 09*"),
                OutputCell(
                    getter: () =>
                        "Vaarallisten aineiden saastuttamat metallijätteet"),
                OutputCell(getter: () => ""),
                InputCell(
                    initialValue: state.contaminatedMetalWaste?.tons,
                    setter: (value) =>
                        bloc.add(ContaminatedMetalWasteTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.contaminatedMetalWaste?.notes,
                    setter: (value) =>
                        bloc.add(ContaminatedMetalWasteNotesChanged(value))),

                // Row 11
                RowCell(initialValue: "17 04 10*"),
                OutputCell(
                    getter: () =>
                        "Kaapelit, jotka sisältävät öljyä, kivihiilitervaa tai muita vaarallisia aineita"),
                OutputCell(getter: () => ""),
                InputCell(
                    initialValue: state.hazardousOilAndTarCables?.tons,
                    setter: (value) =>
                        bloc.add(HazardousOilAndTarCablesTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.hazardousOilAndTarCables?.notes,
                    setter: (value) =>
                        bloc.add(HazardousOilAndTarCablesNotesChanged(value))),

                // Row 12
                RowCell(initialValue: "17 04 11"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeessä 17 04 10 mainitut kaapelit"),
                OutputCell(getter: () => ""),
                InputCell(
                    initialValue: state.otherCables?.tons,
                    setter: (value) => bloc.add(OtherCablesTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.otherCables?.notes,
                    setter: (value) =>
                        bloc.add(OtherCablesNotesChanged(value))),
              ],
            )
          ],
        );
      },
    );
  }
}
