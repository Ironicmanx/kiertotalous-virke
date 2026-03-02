import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/gypsym_based_building_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/gypsym_based_building_materials_event.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class GypsumBasedBuildingMaterialsForm extends StatelessWidget {
  const GypsumBasedBuildingMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GypsumBasedBuildingMaterialsBloc>();
    return BlocBuilder<GypsumBasedBuildingMaterialsBloc,
        GypsumBasedBuildingMaterials>(
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
                RowCell(initialValue: "17 08"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 4,
                  child: RowCell(
                      initialValue: "Kipsipohjaiset rakennusaineet",
                      centerText: true),
                ),

                // Row 3
                RowCell(initialValue: "17 08 01*"),
                OutputCell(
                    getter: () =>
                        "Vaarallisten aineiden saastuttamat kipsipohjaiset rakennusainee"),
                InputCell(
                  initialValue: state.contaminatedGypsumBasedMaterials?.volume,
                  setter: (value) => bloc.add(
                      ContaminatedGypsumBasedMaterialsVolumeChanged(value)),
                ),
                InputCell(
                  initialValue: state.contaminatedGypsumBasedMaterials?.tons,
                  setter: (value) => bloc
                      .add(ContaminatedGypsumBasedMaterialsTonsChanged(value)),
                ),
                InputTextRowCell(
                  label: "Kirjoita tähän",
                  initialValue: state.contaminatedGypsumBasedMaterials?.notes,
                  setter: (value) => bloc
                      .add(ContaminatedGypsumBasedMaterialsNotesChanged(value)),
                ),

                // Other Gypsum Row
                RowCell(initialValue: "17 08 02"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeessä 17 08 01 mainitut kipsipohjaiset aineet"),
                InputCell(
                  initialValue: state.otherGypsumBasedMaterials?.volume,
                  setter: (value) =>
                      bloc.add(OtherGypsumBasedMaterialsVolumeChanged(value)),
                ),
                InputCell(
                  initialValue: state.otherGypsumBasedMaterials?.tons,
                  setter: (value) =>
                      bloc.add(OtherGypsumBasedMaterialsTonsChanged(value)),
                ),
                InputTextRowCell(
                  label: "Kirjoita tähän",
                  initialValue: state.otherGypsumBasedMaterials?.notes,
                  setter: (value) =>
                      bloc.add(OtherGypsumBasedMaterialsNotesChanged(value)),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
