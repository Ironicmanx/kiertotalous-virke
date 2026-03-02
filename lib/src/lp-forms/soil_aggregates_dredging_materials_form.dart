import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/soil_aggregates_dredging_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/soil_aggregates_dredging_materials_event.dart';
import 'package:flutter_app/src/lp-bloc/total_soil_aggregates_dredging_materials_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SoilAggregatesDredgingMaterialsForm extends StatelessWidget {
  const SoilAggregatesDredgingMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SoilAggregatesDredgingMaterialsBloc>();

    return BlocBuilder<TotalSoilAggregatesDredgingMaterialsBloc,
        TotalSoilAggregatesDredgingMaterials>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutGrid(
              columnSizes: [
                200.px,
                400.px,
                100.px,
                100.px,
                450.px,
              ],
              rowSizes: [
                60.px,
                50.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
                60.px,
              ],
              children: [
                // row 1
                ColumnCell(initialValue: "Jätekoodi"),
                ColumnCell(
                    initialValue:
                        "Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus"),
                ColumnCell(initialValue: "Tilavuus (m3)"),
                ColumnCell(initialValue: "Määrä-arvio (tonnia)"),
                ColumnCell(initialValue: "Huomautuksia ja lisätietoja"),

                //row 2
                RowCell(initialValue: "17 05"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 4,
                  rowStart: 1,
                  child: RowCell(
                      initialValue:
                          "Maa-ainekset, kiviainekset ja ruoppausmassat",
                      centerText: true),
                ),

                // Row3
                RowCell(initialValue: "17 05 03*"),
                OutputCell(
                    getter: () =>
                        "Vaarallisia aineita sisältävät Maa- ja kiviainekset"),
                OutputCell(getter: () => state.hazardousSoilAndRock.volume),
                OutputCell(getter: () => state.hazardousSoilAndRock.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.hazardousSoilAndRock.notes,
                    setter: (value) =>
                        bloc.add(HazardousSoilAndRockNotesChanged(value))),

                // Row 4
                RowCell(initialValue: "17 05 04"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeessä 17 05 03 mainitut maa- ja kiviainekset"),
                InputCell(
                    initialValue: state.soilAndRock?.volume,
                    setter: (value) =>
                        bloc.add(SoilAndRockVolumeChanged(value))),
                InputCell(
                    initialValue: state.soilAndRock?.tons,
                    setter: (value) => bloc.add(SoilAndRockTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.soilAndRock?.notes,
                    setter: (value) =>
                        bloc.add(SoilAndRockNotesChanged(value))),

                // Row 5
                RowCell(initialValue: "17 05 05*"),
                OutputCell(
                    getter: () =>
                        "Vaarallisia aineita sisältävät ruoppausmassat"),
                InputCell(
                    initialValue: state.hazardousDredgingSpoil?.volume,
                    setter: (value) =>
                        bloc.add(HazardousDredgingSpoilVolumeChanged(value))),
                InputCell(
                    initialValue: state.hazardousDredgingSpoil?.tons,
                    setter: (value) =>
                        bloc.add(HazardousDredgingSpoilTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.hazardousDredgingSpoil?.notes,
                    setter: (value) =>
                        bloc.add(HazardousDredgingSpoilNotesChanged(value))),

                // Row 6
                RowCell(initialValue: "17 05 06"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeessä 17 05 05 mainitut ruoppausmassat"),
                InputCell(
                    initialValue: state.dredgingSpoil?.volume,
                    setter: (value) =>
                        bloc.add(DredgingSpoilVolumeChanged(value))),
                InputCell(
                    initialValue: state.dredgingSpoil?.tons,
                    setter: (value) =>
                        bloc.add(DredgingSpoilTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.dredgingSpoil?.notes,
                    setter: (value) =>
                        bloc.add(DredgingSpoilNotesChanged(value))),

                // Row 7
                RowCell(initialValue: "17 05 07*"),
                OutputCell(
                    getter: () =>
                        "Vaarallisia aineita sisältävät Ratapenkereiden sorapäällysteet"),
                InputCell(
                    initialValue: state.hazardousRailwayBallast?.volume,
                    setter: (value) =>
                        bloc.add(HazardousRailwayBallastVolumeChanged(value))),
                InputCell(
                    initialValue: state.hazardousRailwayBallast?.tons,
                    setter: (value) =>
                        bloc.add(HazardousRailwayBallastTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.hazardousRailwayBallast?.notes,
                    setter: (value) =>
                        bloc.add(HazardousRailwayBallastNotesChanged(value))),

                // Row 8
                RowCell(initialValue: "17 05 08"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeessä 17 05 07 mainitut ratapenkereiden sorapäällysteet"),
                InputCell(
                    initialValue: state.railwayBallast?.volume,
                    setter: (value) =>
                        bloc.add(RailwayBallastVolumeChanged(value))),
                InputCell(
                    initialValue: state.railwayBallast?.tons,
                    setter: (value) =>
                        bloc.add(RailwayBallastTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.railwayBallast?.notes,
                    setter: (value) =>
                        bloc.add(RailwayBallastNotesChanged(value))),
              ],
            )
          ],
        );
      },
    );
  }
}
