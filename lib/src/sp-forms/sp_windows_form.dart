import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_windows_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SpWindowsForm extends StatelessWidget {
  const SpWindowsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final spWindowsBloc = context.read<SpWindowsBloc>();

    return BlocBuilder<SpWindowsBloc, SmallPropertyWindows>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: 'Ikkunat'),
            LayoutGrid(
              columnSizes: [
                // TODO: first column size can be changed if row cell with checkbox gets tweaked to wrap text
                280.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
              ],
              rowSizes: [50.px, 50.px, 50.px, 50.px],
              children: [
                Cell.row(
                  checkbox: true,
                  checkboxTitle: 'Ikkunat ovat uudelleenkäytettäviä',
                  checkboxValue: state.areWindowsRecyclable,
                  checkboxSetter:
                      (value) =>
                          spWindowsBloc.add(AreWindowsRecyclableChanged(value)),
                ),
                Cell.column(initialValue: 'Kappalemäärä'),
                Cell.column(initialValue: 'Puu (tonnia)'),
                Cell.column(initialValue: 'Teräs (tonnia)'),
                Cell.column(initialValue: 'Alumiini (tonnia)'),
                Cell.column(initialValue: 'Lasi (tonnia)'),
                Cell.row(initialValue: 'Puukarmi'),
                Cell.input(
                  initialValue: state.woodenFramePcs,
                  integer: true,
                  setter:
                      (value) =>
                          spWindowsBloc.add(WoodenFramePcsChanged(value)),
                ),
                Cell.output(getter: () => state.woodenFrameWindowWoodTons),
                Cell.grey(),
                Cell.grey(),
                Cell.output(getter: () => state.woodenFrameWindowGlassTons),
                Cell.row(initialValue: 'Teräs'),
                Cell.input(
                  initialValue: state.steelPcs,
                  integer: true,
                  setter: (value) => spWindowsBloc.add(SteelPcsChanged(value)),
                ),
                Cell.grey(),
                Cell.output(getter: () => state.steelWindowSteelTons),
                Cell.grey(),
                Cell.output(getter: () => state.steelWindowGlassTons),
                Cell.row(initialValue: 'Alumiini'),
                Cell.input(
                  initialValue: state.aluminiumPcs,
                  integer: true,
                  setter:
                      (value) => spWindowsBloc.add(AluminiumPcsChanged(value)),
                ),
                Cell.grey(),
                Cell.grey(),
                Cell.output(getter: () => state.aluminiumWindowAluminiumTons),
                Cell.output(getter: () => state.aluminiumWindowGlassTons),
              ],
            ),
          ],
        );
      },
    );
  }
}
