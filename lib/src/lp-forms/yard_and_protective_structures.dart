import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/yard_and_protective_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/yard_and_protective_structures_event.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../shared/info_button.dart';
import '../shared/tooltip_texts.dart';

/// Yard and Protective Structures UI Form
class YardAndProtectiveStructuresForm extends StatelessWidget {
  const YardAndProtectiveStructuresForm({super.key});

  @override
  Widget build(BuildContext context) {
    final yardBloc = context.read<YardAndProtectiveStructuresBloc>();

    return BlocBuilder<YardAndProtectiveStructuresBloc,
        YardAndProtectiveStructures>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: "Piha ja suojarakenteet"),

            // Grid: 5 columns, 3 rows
            LayoutGrid(
              columnSizes: [200.px, 150.px, 150.px, 150.px, 150.px],
              rowSizes: [50.px, 50.px, 50.px],
              children: [
                EmptyCell(),
                ColumnCell(initialValue: "Oletuspaino (kg/m2)"),
                ColumnCell(
                  initialValue: "kg/m2",
                  iconButton: InfoButton(
                      text: TooltipTexts.hvacAndElectricalInstallations
                          .detailedWeightPerSquareMeters),
                ),
                ColumnCell(initialValue: "Neliötä (m2)"),
                ColumnCell(initialValue: "Tonnia"),
                RowCell(
                    initialValue: "Tippapellit ja suojapellitykset (0,8 mm)"),
                ColumnCell(initialValue: "8"),
                InputCell(
                  initialValue: state.dripTraysAndProtectiveMetalSheets
                      ?.weightKgPerSquareMeter,
                  setter: (value) =>
                      yardBloc.add(DripTraysWeightChanged(value)),
                ),
                InputCell(
                  initialValue:
                      state.dripTraysAndProtectiveMetalSheets?.squareMeters,
                  setter: (value) =>
                      yardBloc.add(DripTraysSquareMetersChanged(value)),
                ),
                OutputCell(
                    getter: () =>
                        state.dripTraysAndProtectiveMetalSheets?.tons),
                RowCell(initialValue: "Betoniset pihalaatat"),
                ColumnCell(initialValue: "120"),
                InputCell(
                  initialValue:
                      state.concretePavingSlabs?.weightKgPerSquareMeter,
                  setter: (value) =>
                      yardBloc.add(ConcretePavingSlabsWeightChanged(value)),
                ),
                InputCell(
                  initialValue: state.concretePavingSlabs?.squareMeters,
                  setter: (value) => yardBloc
                      .add(ConcretePavingSlabsSquareMetersChanged(value)),
                ),
                OutputCell(getter: () => state.concretePavingSlabs?.tons),
              ],
            ),
          ],
        );
      },
    );
  }
}
