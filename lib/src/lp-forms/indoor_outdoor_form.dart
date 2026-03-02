import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/door_bloc.dart';
import 'package:flutter_app/src/lp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/inner_doors_event.dart';
import 'package:flutter_app/src/lp-bloc/outer_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/outer_doors_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class IndoorOutdoorForm extends StatelessWidget {
  const IndoorOutdoorForm({super.key});

  @override
  Widget build(BuildContext context) {
    final innerDoorsBloc = context.read<InnerDoorsBloc>();
    final outerDoorsBloc = context.read<OuterDoorsBloc>();

    return BlocBuilder<DoorBloc, DoorsState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeader(text: 'Ovien määrät'),
                LayoutGrid(
                  columnSizes: [350.px, 100.px, 100.px, 100.px],
                  rowSizes: [
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                  ],
                  children: [
                    RowCell(
                      initialValue: "Ulko-ovet",
                      checkbox: true,
                      checkboxValue: state.outerDoors.areDoorsRecyclable,
                      checkboxTitle: "Ulko-ovet ovat uudelleenkäytettäviä",
                      checkboxSetter:
                          (value) => outerDoorsBloc.add(
                            OuterAreDoorsRecyclableChanged(value),
                          ),
                    ),
                    ColumnCell(initialValue: "Puuovet (kpl)"),
                    ColumnCell(initialValue: "Alumiiniovet (kpl)"),
                    ColumnCell(initialValue: "Teräsovet (kpl)"),
                    RowCell(initialValue: "Umpiovia"),
                    InputCell(
                      initialValue: state.outerDoors.woodenDoors?.shutDoors,
                      integer: true,
                      setter:
                          (value) => outerDoorsBloc.add(
                            OuterShutWoodenDoorsChanged(value),
                          ),
                    ),
                    InputCell(
                      initialValue: state.outerDoors.aluminiumDoors?.shutDoors,
                      integer: true,
                      setter:
                          (value) => outerDoorsBloc.add(
                            OuterShutAluminiumDoorsChanged(value),
                          ),
                    ),
                    InputCell(
                      initialValue: state.outerDoors.steelDoors?.shutDoors,
                      integer: true,
                      setter:
                          (value) => outerDoorsBloc.add(
                            OuterShutSteelDoorsChanged(value),
                          ),
                    ),
                    RowCell(initialValue: "Lasiovia"),
                    InputCell(
                      initialValue: state.outerDoors.woodenDoors?.glassDoors,
                      integer: true,
                      setter:
                          (value) => outerDoorsBloc.add(
                            OuterGlassWoodenDoorsChanged(value),
                          ),
                    ),
                    InputCell(
                      initialValue: state.outerDoors.aluminiumDoors?.glassDoors,
                      integer: true,
                      setter:
                          (value) => outerDoorsBloc.add(
                            OuterGlassAluminiumDoorsChanged(value),
                          ),
                    ),
                    InputCell(
                      initialValue: state.outerDoors.steelDoors?.glassDoors,
                      integer: true,
                      setter:
                          (value) => outerDoorsBloc.add(
                            OuterGlassSteelDoorsChanged(value),
                          ),
                    ),
                    RowCell(initialValue: "Yhteensä (kpl)"),
                    OutputCell(
                      integer: true,
                      getter: () => state.outerDoors.woodenDoors?.doorCount,
                    ),
                    OutputCell(
                      integer: true,
                      getter: () => state.outerDoors.aluminiumDoors?.doorCount,
                    ),
                    OutputCell(
                      integer: true,
                      getter: () => state.outerDoors.steelDoors?.doorCount,
                    ),
                    RowCell(
                      initialValue: "Kulku- ja kuormausovet, teräs (kpl)",
                    ),
                    InputCell(
                      initialValue: state.outerDoors.accessAndLoadingDoors,
                      integer: true,
                      setter:
                          (value) => outerDoorsBloc.add(
                            OuterAccessAndLoadingDoorsChanged(value),
                          ),
                    ),
                    EmptyCell(),
                    EmptyCell(),
                    Cell.header(
                      initialValue: "Ulko-ovien materiaalimäärät yhteensä",
                    ),
                    ColumnCell(initialValue: "m3"),
                    ColumnCell(initialValue: "tonnia"),
                    EmptyCell(),
                    RowCell(initialValue: "Puu"),
                    OutputCell(getter: () => state.outerDoors.totalWoodVolume),
                    OutputCell(getter: () => state.outerDoors.totalWoodTons),
                    EmptyCell(),
                    RowCell(initialValue: "Lasi"),
                    OutputCell(getter: () => state.outerDoors.totalGlassVolume),
                    OutputCell(getter: () => state.outerDoors.totalGlassTons),
                    EmptyCell(),
                    RowCell(initialValue: "Teräs"),
                    GreyCell(),
                    OutputCell(getter: () => state.outerDoors.totalSteelTons),
                    EmptyCell(),
                    RowCell(initialValue: "Alumiini"),
                    GreyCell(),
                    OutputCell(
                      getter: () => state.outerDoors.totalAluminiumTons,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                LayoutGrid(
                  columnSizes: [350.px, 100.px, 100.px, 100.px],
                  rowSizes: [
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                    50.px,
                  ],
                  children: [
                    RowCell(
                      initialValue: "Sisäovet",
                      checkbox: true,
                      checkboxValue: state.innerDoors.areDoorsRecyclable,
                      checkboxTitle: "Sisäovet ovat uudelleenkäytettäviä",
                      checkboxSetter:
                          (value) => innerDoorsBloc.add(
                            InnerDoorRecyclableChanged(value),
                          ),
                    ),
                    ColumnCell(initialValue: "Levyovet (kpl)"),
                    ColumnCell(initialValue: "Puuovet (kpl)"),
                    ColumnCell(initialValue: "Palo-ovet (kpl)"),
                    RowCell(initialValue: "Umpiovia"),
                    InputCell(
                      initialValue: state.innerDoors.panelDoors?.shutDoors,
                      integer: true,
                      setter:
                          (value) => innerDoorsBloc.add(
                            InnerShutPanelDoorsChanged(value),
                          ),
                    ),
                    InputCell(
                      initialValue: state.innerDoors.woodenDoors?.shutDoors,
                      integer: true,
                      setter:
                          (value) => innerDoorsBloc.add(
                            InnerShutWoodenDoorsChanged(value),
                          ),
                    ),
                    InputCell(
                      initialValue: state.innerDoors.fireDoors?.shutDoors,
                      integer: true,
                      setter:
                          (value) => innerDoorsBloc.add(
                            InnerShutFireDoorsChanged(value),
                          ),
                    ),
                    RowCell(initialValue: "Lasiovia"),
                    InputCell(
                      initialValue: state.innerDoors.panelDoors?.glassDoors,
                      integer: true,
                      setter:
                          (value) => innerDoorsBloc.add(
                            InnerGlassPanelDoorsChanged(value),
                          ),
                    ),
                    InputCell(
                      initialValue: state.innerDoors.woodenDoors?.glassDoors,
                      integer: true,
                      setter:
                          (value) => innerDoorsBloc.add(
                            InnerGlassWoodenDoorsChanged(value),
                          ),
                    ),
                    EmptyCell(),
                    RowCell(initialValue: "Yhteensä (kpl)"),
                    OutputCell(
                      integer: true,
                      getter: () => state.innerDoors.panelDoors?.doorCount,
                    ),
                    OutputCell(
                      integer: true,
                      getter: () => state.innerDoors.woodenDoors?.doorCount,
                    ),
                    EmptyCell(),
                    Cell.header(
                      initialValue: "Sisäovien materiaalimäärät yhteensä",
                    ),
                    ColumnCell(initialValue: "m3"),
                    ColumnCell(initialValue: "tonnia"),
                    EmptyCell(),
                    RowCell(initialValue: "Puu"),
                    OutputCell(getter: () => state.innerDoors.totalWoodVolume),
                    OutputCell(getter: () => state.innerDoors.totalWoodTons),
                    EmptyCell(),
                    RowCell(initialValue: "Lasi"),
                    OutputCell(getter: () => state.innerDoors.totalGlassVolume),
                    OutputCell(getter: () => state.innerDoors.totalGlassTons),
                    EmptyCell(),
                    RowCell(initialValue: "Teräs"),
                    GreyCell(),
                    OutputCell(getter: () => state.innerDoors.totalSteelTons),
                    EmptyCell(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
