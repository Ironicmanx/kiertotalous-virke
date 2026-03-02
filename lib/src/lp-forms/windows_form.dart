import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/windows_bloc.dart';
import 'package:flutter_app/src/lp-bloc/windows_event.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// Windows and Window Walls UI Form
class WindowsForm extends StatelessWidget {
  const WindowsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final windowsBloc = context.read<WindowsBloc>();

    return BlocBuilder<WindowsBloc, Windows>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: 'Ikkunoiden ja lasiseinien määrät'),
            LayoutGrid(
              columnSizes: [
                420.px, // Column 1
                150.px, // Column 2
                150.px, // Column 3
                150.px, // Column 4
              ],
              rowSizes: [
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
              ], // 7 rows
              children: [
                // Row 1
                RowCell(
                  initialValue: "Ikkunat",
                  checkbox: true,
                  checkboxTitle:
                      "Ikkunat ja lasiseinät ovat uudelleenkäytettäviä",
                  checkboxValue: state.areWindowsRecyclable,
                  checkboxSetter: (value) =>
                      windowsBloc.add(WindowsRecyclabilityChanged(value)),
                ),
                ColumnCell(initialValue: "Kappale"),
                ColumnCell(
                  initialValue: "m2",
                  iconButton: InfoButton(
                    text: TooltipTexts.partitionWallsDoorsAndWindows.windows
                        .defaultWindowOpeningSize,
                  ),
                ),
                ColumnCell(initialValue: "Lasipinta-ala yhteensä (m2)"),
                // Row 2
                RowCell(initialValue: "Pinta-ala ja määrä"),
                InputCell(
                  initialValue: state.windowsPcs,
                  setter: (value) => windowsBloc.add(WindowsPcsChanged(value)),
                ),
                InputCell(
                  initialValue: state.windowsArea,
                  setter: (value) => windowsBloc.add(WindowsAreaChanged(value)),
                ),
                OutputCell(getter: () => state.totalGlassArea),
                // Row 3
                RowCell(initialValue: "Lasiseinät"),
                GreyCell(),
                InputCell(
                  initialValue: state.glassWallArea,
                  setter: (value) =>
                      windowsBloc.add(GlassWallAreaChanged(value)),
                ),
                EmptyCell(),
                // Row 4
                FormHeader(text: "Ikkunoiden materiaalimäärät"),
                ColumnCell(initialValue: "Materiaalimäärä yhteensä (m3)"),
                ColumnCell(initialValue: "Materiaalimäärä yhteensä (tonnia)"),
                EmptyCell(),
                // Row 5
                RowCell(initialValue: "Puu"),
                OutputCell(getter: () => state.totalWoodenVolume),
                OutputCell(getter: () => state.totalWoodTons),
                EmptyCell(),
                // Row 6
                RowCell(initialValue: "Lasi"),
                OutputCell(getter: () => state.totalGlassVolume),
                OutputCell(getter: () => state.totalGlassTons),
                EmptyCell(),
                // Row 7
                RowCell(initialValue: "Alumiini"),
                GreyCell(),
                OutputCell(getter: () => state.totalAluminiumTons),
                EmptyCell(),
              ],
            ),
          ],
        );
      },
    );
  }
}
