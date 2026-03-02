import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/sp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/outer_doors_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SPOuterDoorsForm extends StatelessWidget {
  const SPOuterDoorsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final outerDoorsBloc = context.read<SPOuterDoorsBloc>();

    return BlocBuilder<SPOuterDoorsBloc, SmallPropertyOuterDoors>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(text: 'Ulko-ovet'),
          LayoutGrid(
            columnSizes: [
              250.px,
              160.px,
              160.px,
              160.px,
            ],
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
                checkboxTitle: 'Ulko-ovet kierrätettäviä',
                checkboxSetter: (value) => outerDoorsBloc.add(
                  SPAreDoorsRecyclableChanged(value),
                ),
                checkboxValue: state.areDoorsRecyclable,
              ),
              ColumnCell(
                initialValue: 'Puuovet (kpl)',
              ),
              ColumnCell(
                initialValue: 'Alumiiniovet (kpl)',
              ),
              ColumnCell(
                initialValue: 'Teräsovet (kpl)',
              ),
              RowCell(
                initialValue: 'Umpiovet',
              ),
              InputCell(
                initialValue: state.woodenDoor?.shutDoors,
                setter: (value) => outerDoorsBloc.add(
                  SPOuterShutWoodenDoorsChanged(value),
                ),
                integer: true,
              ),
              InputCell(
                initialValue: state.aluminiumDoor?.shutDoors,
                setter: (value) => outerDoorsBloc.add(
                  SPOuterShutAluminiumDoorsChanged(value),
                ),
                integer: true,
              ),
              InputCell(
                initialValue: state.steelDoor?.shutDoors,
                setter: (value) => outerDoorsBloc.add(
                  SPOuterShutSteelDoorsChanged(value),
                ),
                integer: true,
              ),
              RowCell(
                initialValue: 'Lasilliset ovet',
              ),
              InputCell(
                initialValue: state.woodenDoor?.glassDoors,
                setter: (value) => outerDoorsBloc.add(
                  SPOuterGlassWoodenDoorsChanged(value),
                ),
                integer: true,
              ),
              InputCell(
                initialValue: state.aluminiumDoor?.glassDoors,
                setter: (value) => outerDoorsBloc.add(
                  SPOuterGlassAluminiumDoorsChanged(value),
                ),
                integer: true,
              ),
              InputCell(
                initialValue: state.steelDoor?.glassDoors,
                setter: (value) => outerDoorsBloc.add(
                  SPOuterGlassSteelDoorsChanged(value),
                ),
                integer: true,
              ),
              RowCell(
                initialValue: 'Materiaalimäärä (tonnia)',
              ),
              OutputCell(
                getter: () => state.woodenDoorTons,
              ),
              OutputCell(
                getter: () => state.aluminiumDoorTons,
              ),
              OutputCell(
                getter: () => state.steelDoorTons,
              ),
              RowCell(
                initialValue: 'Lasia (tonnia)',
              ),
              OutputCell(
                getter: () => state.woodenDoorGlassTons,
              ),
              OutputCell(
                getter: () => state.aluminiumDoorGlassTons,
              ),
              OutputCell(
                getter: () => state.steelDoorGlassTons,
              ),
            ],
          ),
        ],
      );
    });
  }
}
