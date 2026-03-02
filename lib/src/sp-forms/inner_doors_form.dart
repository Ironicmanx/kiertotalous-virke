import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/sp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/inner_doors_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SPInnerDoorsForm extends StatelessWidget {
  const SPInnerDoorsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final innerDoorsBloc = context.read<SPInnerDoorsBloc>();
    return BlocBuilder<SPInnerDoorsBloc, SmallPropertyInnerDoors>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FormHeader(text: 'Sisäovet'),
          LayoutGrid(
            columnSizes: [250.px, 160.px, 160.px],
            rowSizes: [
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
            ],
            children: [
              RowCell(
                checkbox: true,
                checkboxTitle: 'Sisäovet kierrätettäviä',
                checkboxSetter: (value) => innerDoorsBloc.add(
                  SPInnerDoorsAreDoorsRecyclableChanged(value),
                ),
                checkboxValue: state.areDoorsRecyclable,
              ),
              ColumnCell(initialValue: 'Puuovet (kpl)'),
              ColumnCell(initialValue: 'Levyovet (kpl)'),
              RowCell(
                initialValue: 'Umpiovia',
              ),
              InputCell(
                initialValue: state.woodenDoor?.shutDoors,
                setter: (value) => innerDoorsBloc.add(
                  SPInnerShutWoodenDoorsChanged(value),
                ),
                integer: true,
              ),
              InputCell(
                initialValue: state.panelDoor?.shutDoors,
                setter: (value) => innerDoorsBloc.add(
                  SPInnerShutPanelDoorsChanged(value),
                ),
                integer: true,
              ),
              RowCell(
                initialValue: 'Lasiovia',
              ),
              InputCell(
                initialValue: state.woodenDoor?.glassDoors,
                setter: (value) => innerDoorsBloc.add(
                  SPInnerGlassWoodenDoorsChanged(value),
                ),
                integer: true,
              ),
              InputCell(
                initialValue: state.panelDoor?.glassDoors,
                setter: (value) => innerDoorsBloc.add(
                  SPInnerGlassPanelDoorsChanged(value),
                ),
                integer: true,
              ),
              RowCell(
                initialValue: 'Puuta (tonnia)',
              ),
              OutputCell(
                getter: () => state.woodenDoorWoodTons,
              ),
              OutputCell(
                getter: () => state.panelDoorWoodTons,
              ),
              RowCell(
                initialValue: 'Lasia (tonnia)',
              ),
              OutputCell(
                getter: () => state.woodenDoorGlassTons,
              ),
              OutputCell(
                getter: () => state.panelDoorGlassTons,
              )
            ],
          ),
        ]);
      },
    );
  }
}
