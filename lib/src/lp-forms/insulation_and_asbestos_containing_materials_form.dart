import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/insulation_and_asbestos_containing_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/insulation_and_asbestos_containing_materials_event.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class InsulationAndAsbestosContainingMaterialsForm extends StatelessWidget {
  const InsulationAndAsbestosContainingMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InsulationAndAsbestosContainingMaterialsBloc>();

    return BlocBuilder<InsulationAndAsbestosContainingMaterialsBloc,
        InsulationAndAsbestosContainingMaterials>(
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
                RowCell(initialValue: "17 06"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 4,
                  rowStart: 1,
                  child: RowCell(
                      initialValue:
                          "Eristysaineet ja asbestia sisältävät rakennusaineet",
                      centerText: true),
                ),

                // Row 3
                RowCell(initialValue: "17 06 01*"),
                OutputCell(getter: () => "Asbestia sisältävät eristysaineet"),
                InputCell(
                    initialValue:
                        state.asbestosContainingInsulationMaterials?.volume,
                    setter: (value) => bloc.add(
                        AsbestosContainingInsulationMaterialsVolumeChanged(
                            value))),
                InputCell(
                    initialValue:
                        state.asbestosContainingInsulationMaterials?.tons,
                    setter: (value) => bloc.add(
                        AsbestosContainingInsulationMaterialsTonsChanged(
                            value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue:
                        state.asbestosContainingInsulationMaterials?.notes,
                    setter: (value) => bloc.add(
                        AsbestosContainingInsulationMaterialsNotesChanged(
                            value))),

                // Row 4
                RowCell(initialValue: "17 06 03*"),
                OutputCell(
                    getter: () =>
                        "Muut erityisaineet, jotka koostuvat tai sisälltävät vaarallisia aineita"),
                InputCell(
                    initialValue:
                        state.otherHazardousInsulationMaterials?.volume,
                    setter: (value) => bloc.add(
                        OtherHazardousInsulationMaterialsVolumeChanged(value))),
                InputCell(
                    initialValue: state.otherHazardousInsulationMaterials?.tons,
                    setter: (value) => bloc.add(
                        OtherHazardousInsulationMaterialsTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue:
                        state.otherHazardousInsulationMaterials?.notes,
                    setter: (value) => bloc.add(
                        OtherHazardousInsulationMaterialsNotesChanged(value))),

                // Row 5
                RowCell(initialValue: "17 06 04"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeessä 17 06 01 ja 17 06 03 mainitut erityisaineet"),
                InputCell(
                    initialValue: state.otherInsulationMaterials?.volume,
                    setter: (value) =>
                        bloc.add(OtherInsulationMaterialsVolumeChanged(value))),
                InputCell(
                    initialValue: state.otherInsulationMaterials?.tons,
                    setter: (value) =>
                        bloc.add(OtherInsulationMaterialsTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.otherInsulationMaterials?.notes,
                    setter: (value) =>
                        bloc.add(OtherInsulationMaterialsNotesChanged(value))),

                // Row 6
                RowCell(initialValue: "17 06 05*"),
                OutputCell(getter: () => "Asbestia sisältävät rakennusaineet"),
                InputCell(
                    initialValue:
                        state.asbestosContainingBuildingMaterials?.volume,
                    setter: (value) => bloc.add(
                        AsbestosContainingBuildingMaterialsVolumeChanged(
                            value))),
                InputCell(
                    initialValue:
                        state.asbestosContainingBuildingMaterials?.tons,
                    setter: (value) => bloc.add(
                        AsbestosContainingBuildingMaterialsTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue:
                        state.asbestosContainingBuildingMaterials?.notes,
                    setter: (value) => bloc.add(
                        AsbestosContainingBuildingMaterialsNotesChanged(
                            value))),
              ],
            ),
          ],
        );
      },
    );
  }
}
