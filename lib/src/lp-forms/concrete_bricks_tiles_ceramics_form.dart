import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/concrete_bricks_tiles_ceramics_bloc.dart';
import 'package:flutter_app/src/lp-bloc/concrete_bricks_tiles_ceramics_event.dart';
import 'package:flutter_app/src/lp-bloc/total_concrete_bricks_tiles_ceramics_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ConcreteBricksTilesCeramicsForm extends StatelessWidget {
  const ConcreteBricksTilesCeramicsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ConcreteBricksTilesCeramicsBloc>();
    return BlocBuilder<TotalConcreteBricksTilesCeramicsBloc,
        TotalConcreteBricksTilesCeramics>(builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          ],
          children: [
            // Row 1 - Headers
            ColumnCell(initialValue: "Jätekoodi"),
            ColumnCell(
                initialValue:
                    "Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus"),
            ColumnCell(initialValue: "Tilavuus (m3)"),
            ColumnCell(initialValue: "Määrä-arvio (tonnia)"),
            ColumnCell(initialValue: "Huomautuksia ja lisätietoja"),

            // Row 2
            RowCell(initialValue: "17 01"),
            GridPlacement(
              columnStart: 1,
              columnSpan: 4,
              rowStart: 1,
              child: RowCell(
                  initialValue: "Betoni, tiilet, laatat ja keramiikka",
                  centerText: true),
            ),

            // Row 3
            RowCell(initialValue: "17 01 01"),
            OutputCell(getter: () => "Betoni"),
            OutputCell(getter: () => state.concrete.volume),
            OutputCell(getter: () => state.concrete.tons),
            InputTextRowCell(
                label: "Kirjoita tähän",
                initialValue: state.concrete.notes,
                setter: (value) => bloc.add(ConcreteNotesChanged(value))),

            // Row 4
            RowCell(initialValue: "17 01 02"),
            OutputCell(getter: () => "Tiilet"),
            OutputCell(getter: () => state.brick.volume),
            OutputCell(getter: () => state.brick.tons),
            InputTextRowCell(
                label: "Kirjoita tähän",
                initialValue: state.brick.notes,
                setter: (value) => bloc.add(BrickNotesChanged(value))),

            // Row 5
            RowCell(initialValue: "17 01 03"),
            OutputCell(getter: () => "Laatat ja keramiikka"),
            OutputCell(getter: () => state.ceramicTiles.volume),
            OutputCell(getter: () => state.ceramicTiles.tons),
            InputTextRowCell(
                label: "Kirjoita tähän",
                initialValue: state.ceramicTiles.notes,
                setter: (value) => bloc.add(CeramicTilesNotesChanged(value))),

            // Row 6
            RowCell(initialValue: "17 01 06*"),
            OutputCell(
                getter: () =>
                    "Betonin, tiilten, laattojen ja keramiikan seokset tai lajitellut jakeet, jotka sisältävät vaarallisia aineita"),
            OutputCell(
                getter: () =>
                    state.hazardousConcreteBrickTileCeramicMixtures.volume),
            OutputCell(
                getter: () =>
                    state.hazardousConcreteBrickTileCeramicMixtures.tons),
            InputTextRowCell(
                label: "Kirjoita tähän",
                initialValue:
                    state.hazardousConcreteBrickTileCeramicMixtures.notes,
                setter: (value) =>
                    bloc.add(HazardousMixturesNotesChanged(value))),

            // Row 7
            RowCell(initialValue: "17 01 07"),
            OutputCell(
                getter: () =>
                    "Muut kuin nimikkeessä 17 01 06 mainitut betonin, tiilten, laattojen ja keramiikan seokset"),
            InputCell(
                initialValue: state.otherMaterials?.volume,
                setter: (value) =>
                    bloc.add(OtherMaterialsVolumeChanged(value))),
            InputCell(
                initialValue: state.otherMaterials?.tons,
                setter: (value) => bloc.add(OtherMaterialsTonsChanged(value))),
            InputTextRowCell(
                label: "Kirjoita tähän",
                initialValue: state.otherMaterials?.notes,
                setter: (value) => bloc.add(OtherMaterialsNotesChanged(value))),
          ],
        )
      ]);
    });
  }
}
