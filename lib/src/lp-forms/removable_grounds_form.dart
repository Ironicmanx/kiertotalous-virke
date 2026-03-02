import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/excavation_area_bloc.dart';
import 'package:flutter_app/src/lp-bloc/excavation_area_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RemovableGroundsForm extends StatelessWidget {
  const RemovableGroundsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final excavationAreaBloc = context.read<ExcavationAreaBloc>();

    return BlocBuilder<ExcavationAreaBloc, ExcavationArea>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(
              text: 'Poistettavat maa-ainekset, poistettava alue ja määrä'),
          LayoutGrid(
            columnSizes: [
              400.px,
              160.px,
            ],
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
                initialValue: 'Poistettavan alueen pinta-ala (m2)',
              ),
              InputCell(
                initialValue: state.areaToRemoveSize,
                setter: (value) => excavationAreaBloc.add(
                  AreaToRemoveSizeChanged(value),
                ),
              ),
              RowCell(initialValue: 'Poistettavan alueen syvyys (m)'),
              InputCell(
                initialValue: state.areaToRemoveDepth,
                setter: (value) => excavationAreaBloc.add(
                  AreaToRemoveDepthChanged(value),
                ),
              ),
              RowCell(initialValue: 'Poistettava määrä (m3)'),
              OutputCell(getter: () => state.volumeToRemove),
              RowCell(initialValue: 'Poistettavan puhtaan maan osuus (%)'),
              InputCell(
                initialValue: state.cleanSoilPortionPercentage,
                percentage: true,
                setter: (value) => excavationAreaBloc.add(
                  CleanSoilPortionPercentageChanged(value),
                ),
              ),
              RowCell(initialValue: 'Puhdas maa (tonnia)'),
              OutputCell(getter: () => state.cleanLandTons),
              RowCell(initialValue: 'Saastunut maa (tonnia)'),
              OutputCell(getter: () => state.contaminatedLandTons),
              RowCell(initialValue: 'Saastunut maa (m3)'),
              OutputCell(getter: () => state.contaminatedSoil),
              RowCell(initialValue: 'Asfaltti alue (m2)'),
              InputCell(
                initialValue: state.asphaltArea,
                setter: (value) => excavationAreaBloc.add(
                  AsphaltAreaChanged(value),
                ),
              ),
              RowCell(initialValue: 'Asfaltti (tonnia)'),
              OutputCell(getter: () => state.asphaltTons),
              RowCell(initialValue: 'Asfaltti (m3)'),
              OutputCell(getter: () => state.asphaltVolume),
            ],
          ),
        ],
      );
    });
  }
}
