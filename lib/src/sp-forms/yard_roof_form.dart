import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/sp-bloc/yard_roof_bloc.dart';
import 'package:flutter_app/src/sp-bloc/yard_roof_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class YardRoofForm extends StatelessWidget {
  const YardRoofForm({super.key});

  List<DropdownMenuItem<SmallPropertyRoofType?>> roofTypeToList() {
    return [
      const DropdownMenuItem<SmallPropertyRoofType?>(
        value: null,
        child: Text('Valitse Kattotyyppi'),
      ),
      ...SmallPropertyRoofType.values.map((type) {
        return DropdownMenuItem<SmallPropertyRoofType?>(
          value: type,
          child: Text(roofTypesToString(type)),
        );
      }),
    ];
  }

  String roofTypesToString(SmallPropertyRoofType type) {
    switch (type) {
      case SmallPropertyRoofType.flatRoof:
        return "Tasakatto, ristikko jako 800mm";
      case SmallPropertyRoofType.gableRoof:
        return "Harjakatto, ristikko jako 800mm";
      case SmallPropertyRoofType.pentRoof:
        return "Pulpettikatto, ristikko jako 800mm";
    }
  }

  List<DropdownMenuItem<WaterRoofType?>> waterRoofTypeToList() {
    return [
      const DropdownMenuItem<WaterRoofType?>(
        value: null,
        child: Text('Materiaali'),
      ),
      ...WaterRoofType.values.map((type) {
        return DropdownMenuItem<WaterRoofType?>(
          value: type,
          child: Text(waterRoofTypeToString(type)),
        );
      }),
    ];
  }

  String waterRoofTypeToString(WaterRoofType type) {
    switch (type) {
      case WaterRoofType.metalRoof:
        return "Teräs";
      case WaterRoofType.mineriteRoof:
        return "Mineriitti";
      case WaterRoofType.roofingFelt:
        return "Huopa";
      case WaterRoofType.tiledRoof:
        return "Tiili";
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<YardRoofBloc>();

    return BlocBuilder<YardRoofBloc, YardRoof>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutGrid(columnSizes: [
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
          ], rowSizes: [
            50.px,
            75.px,
            50.px
          ], children: [
            FormHeader(text: "Katto"),
            GridPlacement(
                columnStart: 1,
                columnSpan: 2,
                rowStart: 0,
                child: MenuCell(
                  initialValue: state.roofType,
                  items: roofTypeToList(),
                  setter: (value) => bloc.add(RoofTypeChanged(value)),
                )),
            EmptyCell(),
            MenuCell(
              initialValue: state.waterRoofType,
              items: waterRoofTypeToList(),
              setter: (value) => bloc.add(WaterRoofTypeChanged(value)),
            ),
            EmptyCell(),
            EmptyCell(),
            ColumnCell(initialValue: "Lappeen pituus (m)"),
            ColumnCell(initialValue: "Lappeen Leveys (m)"),
            ColumnCell(initialValue: "Kattopinta-ala (m2)"),
            ColumnCell(initialValue: "Puisen ristikkorakenteen paino (tonnia)"),
            ColumnCell(initialValue: "Aluslaudoituksen paino (tonnia)"),
            ColumnCell(initialValue: "Vesikatteen paino (tonnia)"),
            ColumnCell(initialValue: "Aluskate (tonnia)"),
            InputCell(
              initialValue: state.lapelLengthInMeters,
              setter: (value) => bloc.add(LapelLengthChanged(value)),
            ),
            InputCell(
              initialValue: state.lapelWidthInMeters,
              setter: (value) => bloc.add(LapelWidthChanged(value)),
            ),
            OutputCell(getter: () => state.roofArea),
            OutputCell(getter: () => state.woodenRoofLatticeWeightTons),
            OutputCell(getter: () => state.underBoardingWeightTons),
            OutputCell(getter: () => state.waterRoofWeightTons),
            OutputCell(getter: () => state.underlaymentWeightTons),
          ])
        ],
      );
    });
  }
}
