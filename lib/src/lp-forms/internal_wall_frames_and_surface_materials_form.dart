import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class InternalWallFramesAndSurfaceMaterialsForm extends StatelessWidget {
  const InternalWallFramesAndSurfaceMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final internalWallFramesAndSurfaceMaterialBloc =
        context.read<InternalWallFramesAndSurfaceMaterialBloc>();

    return BlocBuilder<InternalWallFramesAndSurfaceMaterialBloc,
        InternalWallFramesAndSurfaceMaterial>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(
            text: 'Sisäseinien rungot ja pintamateriaalit',
          ),
          LayoutGrid(
            columnSizes: [
              350.px,
              120.px,
            ],
            rowSizes: [50.px, 50.px, 50.px],
            children: [
              RowCell(
                  iconButton: InfoButton(
                      text: TooltipTexts
                          .partitionWallsDoorsAndWindows
                          .interiorWallFramesAndSurfaceMaterials
                          .overallInnerWallLength),
                  initialValue:
                      'Sisäseinien kokonaispituus, kaikki kerrokset (jm)'),
              InputCell(
                initialValue: state.overallWallLength,
                setter: (value) => internalWallFramesAndSurfaceMaterialBloc.add(
                  OverallLengthOfInternalWallsAllFloorsChanged(value),
                ),
              ),
              RowCell(initialValue: 'Sisäseinien keskikorkeus (m)'),
              InputCell(
                initialValue: state.averageWallHeight,
                setter: (value) => internalWallFramesAndSurfaceMaterialBloc.add(
                  AverageHeightOfInternalWallsChanged(value),
                ),
              ),
              RowCell(initialValue: 'Sisäseinien kokonaispinta-ala (m2)'),
              OutputCell(
                getter: () => state.totalArea,
              ),
            ],
          ),
        ],
      );
    });
  }
}
