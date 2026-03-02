import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/sp-bloc/sp_excavation_area_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_excavation_area_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SBRemovableGroundsForm extends StatelessWidget {
  const SBRemovableGroundsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final excavationAreaBloc = context.read<SBExcavationAreaBloc>();

    return BlocBuilder<SBExcavationAreaBloc, SmallPropertiesExcavationArea>(
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
            ],
            children: [
              RowCell(
                initialValue: 'Poistettavan alueen pinta-ala (m2)',
              ),
              InputCell(
                initialValue: state.areOfTheRemovableSoil,
                setter: (value) => excavationAreaBloc.add(
                  AreaofTheRemovableSoilChanged(value),
                ),
              ),
              RowCell(initialValue: 'Poistettavan alueen syvyys (m)'),
              InputCell(
                initialValue: state.depthInMeters,
                setter: (value) => excavationAreaBloc.add(
                  DepthInMetersChanged(value),
                ),
              ),
              RowCell(initialValue: 'Poistettava määrä (m3)'),
              OutputCell(getter: () => state.soilToBeRemovedVolume),
              RowCell(initialValue: 'Poistettava maa yhteensä (tonnia)'),
              OutputCell(getter: () => state.soilToBeRemovedTons),
              RowCell(initialValue: 'Poistettavan puhtaan maan osuus (%)'),
              InputCell(
                initialValue: state.removableCleanSoilInPercents,
                percentage: true,
                setter: (value) => excavationAreaBloc.add(
                  CleanSoilPortionPercentageChanged(value),
                ),
              ),
              RowCell(initialValue: 'Poistettavasta maasta saastunutta (%)'),
              OutputCell(
                getter: () => state.contaminatedSoil,
                percentage: true,
              ),
              RowCell(initialValue: 'Asfaltti alue (m2)'),
              InputCell(
                initialValue: state.asphaltAreaInSquareMeters,
                setter: (value) => excavationAreaBloc.add(
                  AsphaltAreaInSquareMetersChanged(value),
                ),
              ),
              RowCell(initialValue: 'Asfaltti (tonnia)'),
              OutputCell(getter: () => state.asphaltTons),
            ],
          ),
        ],
      );
    });
  }
}
