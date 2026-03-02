import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/building_dimensions_bloc.dart';
import 'package:flutter_app/src/lp-bloc/building_dimensions_event.dart';
import 'package:flutter_app/src/lp-bloc/total_building_dimensions_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// Get values from [TotalBuildingDimensionsBloc],
/// sets values to [BuildingDimensionsBloc].
class TotalBuildingDimensionsForm extends StatelessWidget {
  const TotalBuildingDimensionsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final buildingDimensionsBloc = context.read<BuildingDimensionsBloc>();

    return BlocBuilder<TotalBuildingDimensionsBloc, TotalBuildingDimensions>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(text: 'Rakennuksen pinta-ala'),
          LayoutGrid(
            columnSizes: [
              400.px,
              160.px,
              160.px,
            ],
            rowSizes: [
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
            ],
            children: [
              EmptyCell(),
              EmptyCell(),
              ColumnCell(initialValue: 'Laskennallinen arvo'),
              RowCell(
                initialValue: 'Rakennuksen kerrospinta-ala (bruttoala) (m2)',
                iconButton:
                    InfoButton(text: TooltipTexts.outerSheath.grossFloorArea),
              ),
              InputCell(
                initialValue: state.buildingDimensions?.grossFloorArea,
                setter: (value) => buildingDimensionsBloc.add(
                  GrossFloorAreaChanged(value),
                ),
              ),
              OutputCell(
                // supposed to be empty for now (14.3.25)
                getter: () => state.calculatedGrossFloorArea,
              ),
              RowCell(
                initialValue: 'Rakennuksen tilavuus (m3)',
                iconButton: InfoButton(text: TooltipTexts.outerSheath.volume),
              ),
              InputCell(
                initialValue: state.buildingDimensions?.volume,
                setter: (value) => buildingDimensionsBloc.add(
                  VolumeChanged(value),
                ),
              ),
              OutputCell(
                getter: () => state.calculatedVolume,
              ),
              RowCell(
                initialValue: 'Kerrosten määrä, ilman kellaritiloja',
              ),
              InputCell(
                initialValue:
                    state.buildingDimensions?.floorCountExcludingCellars,
                setter: (value) => buildingDimensionsBloc.add(
                  FloorCountExcludingCellarsChanged(value),
                ),
                integer: true,
              ),
              // this is supposed to be empty for now (14.3.25)
              GreyCell(),
              RowCell(
                initialValue: 'Keskimääräinen pinta-ala (m2)',
                iconButton:
                    InfoButton(text: TooltipTexts.outerSheath.averageArea),
              ),
              InputCell(
                initialValue: state.buildingDimensions?.averageArea,
                setter: (value) => buildingDimensionsBloc.add(
                  AverageAreaChanged(value),
                ),
              ),
              OutputCell(
                getter: () => state.calculatedAreaPerFloor,
              ),
              RowCell(
                initialValue:
                    'Kerrospinta-ala yhteensä (ei kellaritiloja) (m2)',
                iconButton: InfoButton(
                    text: TooltipTexts
                        .outerSheath.grossFloorAreaExcludingCellars),
              ),
              OutputCell(
                getter: () => state.grossFloorAreaExcludingCellars,
              ),
              GreyCell(),
            ],
          ),
        ],
      );
    });
  }
}
