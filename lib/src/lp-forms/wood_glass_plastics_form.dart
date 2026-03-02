import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/wood_glass_plastics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/wood_glass_plastics_event.dart';
import 'package:flutter_app/src/lp-bloc/total_wood_glass_plastics_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class WoodGlassPlasticsForm extends StatelessWidget {
  const WoodGlassPlasticsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WoodGlassPlasticsBloc>();
    return BlocBuilder<TotalWoodGlassPlasticsBloc, TotalWoodGlassPlastics>(
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
              ],
              children: [
                // Row 1

                ColumnCell(initialValue: "Jätekoodi"),
                ColumnCell(
                    initialValue:
                        "Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus"),
                ColumnCell(initialValue: "Tilavuus (m3)"),
                ColumnCell(initialValue: "Määrä-arvio (tonnia)"),
                ColumnCell(initialValue: "Huomautuksia ja lisätietoja"),

                // Row 2
                RowCell(initialValue: "17 02"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 4,
                  rowStart: 1,
                  child: RowCell(
                      initialValue: "Puu, lasi ja muovit", centerText: true),
                ),

                // Row 3
                RowCell(initialValue: "17 02 01"),
                OutputCell(getter: () => "Puu"),
                OutputCell(getter: () => state.wood.volume),
                OutputCell(getter: () => state.wood.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.wood.notes,
                    setter: (value) => bloc.add(WoodNotesChanged(value))),

                // Row 4
                RowCell(initialValue: "17 02 02"),
                OutputCell(getter: () => "Lasi"),
                OutputCell(getter: () => state.glass.volume),
                OutputCell(getter: () => state.glass.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.glass.notes,
                    setter: (value) => bloc.add(GlassNotesChanged(value))),

                // Row 5
                RowCell(initialValue: "17 02 03"),
                OutputCell(getter: () => "Muovi"),
                OutputCell(getter: () => state.plastic.volume),
                OutputCell(getter: () => state.plastic.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.plastic.notes,
                    setter: (value) => bloc.add(PlasticNotesChanged(value))),

                // Row 6
                RowCell(initialValue: "17 02 04*"),
                OutputCell(
                    getter: () =>
                        "Lasi, muovi ja puu, mitkä sisältävät vaarallisia aineita tai ovat niiden saastuttamia"),
                OutputCell(
                    getter: () =>
                        state.otherDangerousOrContaminatedMaterial.volume),
                OutputCell(
                    getter: () =>
                        state.otherDangerousOrContaminatedMaterial.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue:
                        state.otherDangerousOrContaminatedMaterial.notes,
                    setter: (value) =>
                        bloc.add(OtherDangerousMaterialsNotesChanged(value))),
              ],
            )
          ],
        );
      },
    );
  }
}
