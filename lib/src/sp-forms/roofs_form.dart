import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/sp-bloc/roofs_bloc.dart';
import 'package:flutter_app/src/sp-bloc/roofs_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SmallPropertiesRoofsForm extends StatelessWidget {
  const SmallPropertiesRoofsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final roofsBloc = context.read<SmallPropertiesRoofsBloc>();

    return BlocBuilder<SmallPropertiesRoofsBloc, Roof>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(text: 'Katto'),
          LayoutGrid(columnSizes: [
            200.px,
            160.px,
            170.px,
            160.px,
            160.px,
            160.px,
            185.px,
            150.px,
          ], rowSizes: [
            50.px,
            50.px,
            50.px,
            50.px,
          ], children: [
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            MenuCell<WaterRoofType?>(
                setter: (value) => roofsBloc.add(WaterRoofTypeChanged(value)),
                initialValue: state.waterRoofType,
                items: waterRoofTypeToList()),
            EmptyCell(),
            MenuCell<SmallPropertyRoofType?>(
                setter: (value) =>
                    roofsBloc.add(SmallPropertyRoofTypeChanged(value)),
                initialValue: state.roofType,
                items: roofTypeToList()),
            HeaderCell(initialValue: 'Katon lappeen pituus (m)'),
            HeaderCell(initialValue: 'Katon lappeen leveys (m)'),
            HeaderCell(initialValue: 'Katon pinta-ala (m2)'),
            HeaderCell(initialValue: 'Puinen ristikkorakenne (tonnia)'),
            HeaderCell(initialValue: 'Aluslaudoituksen paino (tonnia)'),
            HeaderCell(initialValue: 'Vesikatteen paino (tonnia)'),
            HeaderCell(initialValue: 'Aluskate (tonnia)'),
            RowCell(initialValue: ''),
            InputCell(
              initialValue: state.slopeLengthInMeters,
              setter: (value) =>
                  roofsBloc.add(SlopeLengthInMetersChanged(value)),
            ),
            InputCell(
              initialValue: state.slopeWidthInMeters,
              setter: (value) =>
                  roofsBloc.add(SlopeWidhthInMetersChanged(value)),
            ),
            OutputCell(getter: () => state.roofArea),
            OutputCell(getter: () => state.woodenRoofLatticeWeightTons),
            OutputCell(getter: () => state.underBoardingWeightTons),
            OutputCell(getter: () => state.waterRoofWeightKgPerSqm),
            OutputCell(getter: () => state.underLaymentTons),
            RowCell(initialValue: 'Kierrätyskelpoiset materiaalit'),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Puu                 ',
              checkboxSetter: (value) =>
                  roofsBloc.add(ContainsRecyclableWoodChanged(value)),
              checkboxValue: state.containsRecyclableWood,
            ),
            RowCell(
              checkbox: true,
              checkboxTitle: 'Katemateriaali\nsisältää asbestia',
              checkboxSetter: (value) =>
                  roofsBloc.add(CoveringMaterialContainsAsbestosChanged(value)),
              checkboxValue: state.coveringMaterialContainsAsbestos,
            ),
          ]),
        ],
      );
    });
  }

  //Roof type
  List<DropdownMenuItem<SmallPropertyRoofType?>> roofTypeToList() {
    return [
      DropdownMenuItem<SmallPropertyRoofType?>(
        value: null,
        child: Text('Kattotyyppi                    '),
      ),
      ...SmallPropertyRoofType.values.map((type) {
        return DropdownMenuItem<SmallPropertyRoofType?>(
          value: type,
          child: Text(smallPropertyRoofTypeToString(type)),
        );
      })
    ];
  }

  String smallPropertyRoofTypeToString(SmallPropertyRoofType type) {
    switch (type) {
      case SmallPropertyRoofType.gableRoof:
        return 'Harjakatto';
      case SmallPropertyRoofType.flatRoof:
        return 'Tasakatto';
      case SmallPropertyRoofType.pentRoof:
        return 'Pulpettikatto';
    }
  }

  //Water roof type
  List<DropdownMenuItem<WaterRoofType?>> waterRoofTypeToList() {
    return [
      DropdownMenuItem<WaterRoofType?>(
        value: null,
        child: Text('Vesikattotyyppi            '),
      ),
      ...WaterRoofType.values.map((type) {
        return DropdownMenuItem<WaterRoofType?>(
          value: type,
          child: Text(waterRoofTypeToString(type)),
        );
      })
    ];
  }

  String waterRoofTypeToString(WaterRoofType type) {
    switch (type) {
      case WaterRoofType.metalRoof:
        return 'Teräs';
      case WaterRoofType.roofingFelt:
        return 'Huopa';
      case WaterRoofType.mineriteRoof:
        return 'Mineriitti';
      case WaterRoofType.tiledRoof:
        return 'Tiili';
    }
  }
}
