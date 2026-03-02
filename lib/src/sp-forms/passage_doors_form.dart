import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_event.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_event.dart';
import 'package:flutter_app/src/sp-bloc/sp_door_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class PassageDoorsForm extends StatelessWidget {
  const PassageDoorsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final passageBloc = context.read<PassageDoorsBloc>();
    final hallBloc = context.read<HallDoorsBloc>();

    return BlocBuilder<SpDoorBloc, SpDoorsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutGrid(
              columnSizes: [270.px, 140.px, 140.px, 140.px],
              rowSizes: [
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
                Cell.row(
                  initialValue: 'Kulkuovet',
                  checkbox: true,
                  checkboxTitle: 'Uudelleenkäytettäviä',
                  checkboxValue: state.passageDoors.doorsRecyclable,
                  checkboxSetter: (value) => passageBloc.add(
                    PassageAreDoorsRecyclableChanged(value),
                  ),
                ),
                Cell.column(initialValue: 'Puuovet (kpl)'),
                Cell.column(initialValue: 'Alumiiniovet (kpl)'),
                Cell.column(initialValue: 'Teräsovet (kpl)'),
                Cell.row(initialValue: 'Umpiovia'),
                Cell.input(
                  initialValue: state.passageDoors.woodenDoor!.shutDoors,
                  integer: true,
                  setter: (value) =>
                      passageBloc.add(PassageShutWoodenDoorsChanged(value)),
                ),
                Cell.input(
                  initialValue: state.passageDoors.aluminiumDoor!.shutDoors,
                  integer: true,
                  setter: (value) => passageBloc.add(
                    PassageShutAluminiumDoorsChanged(value),
                  ),
                ),
                Cell.input(
                  initialValue: state.passageDoors.steelDoor!.shutDoors,
                  integer: true,
                  setter: (value) =>
                      passageBloc.add(PassageShutSteelDoorsChanged(value)),
                ),
                Cell.row(initialValue: 'Lasiovia'),
                Cell.input(
                  initialValue: state.passageDoors.woodenDoor!.glassDoors,
                  integer: true,
                  setter: (value) => passageBloc.add(
                    PassageGlassWoodenDoorsChanged(value),
                  ),
                ),
                Cell.input(
                  initialValue: state.passageDoors.aluminiumDoor!.glassDoors,
                  integer: true,
                  setter: (value) => passageBloc.add(
                    PassageGlassAluminiumDoorsChanged(value),
                  ),
                ),
                Cell.input(
                  initialValue: state.passageDoors.steelDoor!.glassDoors,
                  integer: true,
                  setter: (value) =>
                      passageBloc.add(PassageGlassSteelDoorsChanged(value)),
                ),
                Cell.row(initialValue: 'Materiaalimäärä (tonnia)'),
                Cell.output(getter: () => state.passageDoors.woodenDoorTons),
                Cell.output(getter: () => state.passageDoors.aluminiumDoorTons),
                Cell.output(getter: () => state.passageDoors.steelDoorTons),
                Cell.row(initialValue: 'Lasia (tonnia)'),
                Cell.output(
                  getter: () => state.passageDoors.woodenDoorGlassTons,
                ),
                Cell.output(
                  getter: () => state.passageDoors.aluminiumDoorGlassTons,
                ),
                Cell.output(
                  getter: () => state.passageDoors.steelDoorGlassTons,
                ),
                Cell.header(initialValue: 'Halliovet, oletus 3x5m'),
                Cell.column(initialValue: 'Puuovet'),
                Cell.column(initialValue: 'Alumiiniovet'),
                Cell.column(initialValue: 'Teräsovet'),
                Cell.row(initialValue: 'Kpl'),
                Cell.input(
                  initialValue: state.hallDoors.woodenDoors,
                  setter: (value) => hallBloc.add(WoodenDoorsChanged(value)),
                  integer: true,
                ),
                Cell.input(
                  initialValue: state.hallDoors.aluminiumDoors,
                  integer: true,
                  setter: (value) => hallBloc.add(AluminiumDoorsChanged(value)),
                ),
                Cell.input(
                  initialValue: state.hallDoors.steelDoors,
                  integer: true,
                  setter: (value) => hallBloc.add(SteelDoorsChanged(value)),
                ),
                Cell.row(initialValue: 'Tonnia'),
                Cell.output(getter: () => state.hallDoors.woodenDoorTons),
                Cell.output(getter: () => state.hallDoors.aluminiumDoorTons),
                Cell.output(getter: () => state.hallDoors.steelDoorTons),
              ],
            ),
          ],
        );
      },
    );
  }
}
