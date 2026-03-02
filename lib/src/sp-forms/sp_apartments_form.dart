import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/sp-bloc/apartment_size_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SpApartmentsForm extends StatelessWidget {
  const SpApartmentsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApartmentSizeBloc, ApartmentSize>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutGrid(
              columnSizes: [
                200.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
              ],
              rowSizes: [
                50.px,
                50.px,
                50.px,
              ],
              children: [
                Cell.header(initialValue: 'Huoneiston koko'),
                Cell.column(initialValue: '1h'),
                Cell.column(initialValue: '2h'),
                Cell.column(initialValue: '3h'),
                Cell.column(initialValue: '4h'),
                Cell.column(initialValue: 'Yhteensä'),
                Cell.row(initialValue: 'Kappalemäärä'),
                Cell.output(getter: () => state.oneRoom?.pcsPerHouse),
                Cell.output(getter: () => state.twoRooms?.pcsPerHouse),
                Cell.output(getter: () => state.threeRooms?.pcsPerHouse),
                Cell.output(getter: () => state.fourRooms?.pcsPerHouse),
                Cell.output(getter: () => state.totalRoomCount),
                Cell.row(initialValue: 'Lattia-ala'),
                Cell.output(getter: () => state.oneRoom?.floorAreaPerApartment),
                Cell.output(
                    getter: () => state.twoRooms?.floorAreaPerApartment),
                Cell.output(
                    getter: () => state.threeRooms?.floorAreaPerApartment),
                Cell.output(
                    getter: () => state.fourRooms?.floorAreaPerApartment),
                Cell.output(getter: () => state.totalFloorArea),
              ],
            ),
          ],
        );
      },
    );
  }
}
