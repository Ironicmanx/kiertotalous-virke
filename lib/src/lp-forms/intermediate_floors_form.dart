import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/intermediate_floors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/intermediate_floors_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/error_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class IntermediateFloorsForm extends StatelessWidget {
  const IntermediateFloorsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final intermediateFloorsBloc = context.read<IntermediateFloorsBloc>();

    return BlocBuilder<IntermediateFloorsBloc, TotalIntermediateFloors>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                FormHeader(text: 'Välipohjat'),
                LayoutGrid(
                  columnSizes: [200.px, 150.px, 150.px],
                  rowSizes: [50.px, 50.px],
                  children: [
                    Cell.header(
                      initialValue: "Välipohjien laskennassa käytetyt arvot",
                    ),
                    ColumnCell(initialValue: "Kerrosala (m2)"),
                    ColumnCell(initialValue: "Kerroksia (kpl)"),
                    EmptyCell(),
                    OutputCell(
                      getter: () =>
                          state.totalBuildingDimensions?.grossFloorArea,
                    ),
                    OutputCell(
                      getter: () => state.totalBuildingDimensions
                          ?.floorCountExcludingBasements,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FormHeader(text: 'Välipohjien pinta-alat ja runkorakenteet'),
                LayoutGrid(
                  columnSizes: [425.px, 150.px, 150.px],
                  rowSizes: [60.px, 50.px, 50.px, 50.px, 50.px, 50.px, 50.px],
                  children: [
                    RowCell(
                      initialValue: "",
                      checkbox: true,
                      checkboxValue:
                          state.hollowCoreSlabsAndGlulamBeamRecyclable,
                      checkboxTitle:
                          "Ontelolaatat ja liimapuupalkit ovat uudelleenkäytettäviä",
                      checkboxSetter: (value) => intermediateFloorsBloc.add(
                        HollowCoreSlabsAndGlulamBeamRecyclableChanged(
                          value,
                        ),
                      ),
                    ),
                    ColumnCell(
                      initialValue: "Rakenteen osuus koko kerrosalasta (%)",
                    ),
                    ColumnCell(initialValue: "Lattiapinta-ala (m²)"),
                    RowCell(initialValue: "Puurunko (m²)"),
                    InputCell(
                      initialValue: state.woodFramePercentage,
                      percentage: true,
                      setter: (value) => intermediateFloorsBloc.add(
                        WoodFramePercentageChanged(value),
                      ),
                    ),
                    OutputCell(getter: () => state.woodFrameFloorArea),
                    RowCell(
                      initialValue: "Betonivalu, oletuspaksuus 200 mm (m²)",
                    ),
                    InputCell(
                      initialValue: state.concreteCastingPercentage,
                      percentage: true,
                      setter: (value) => intermediateFloorsBloc.add(
                        ConcreteCastingPercentageChanged(value),
                      ),
                    ),
                    OutputCell(getter: () => state.concreteCastingFloorArea),
                    RowCell(initialValue: "Ontelolaatta (m²)"),
                    InputCell(
                      initialValue: state.hollowCoreSlabPercentage,
                      percentage: true,
                      setter: (value) => intermediateFloorsBloc.add(
                        HollowCoreSlabPercentageChanged(value),
                      ),
                    ),
                    OutputCell(getter: () => state.hollowCoreSlabFloorArea),
                    RowCell(
                      initialValue: "Liimapalkki, oletusmäärä 0,4 jm/m² (m²)",
                    ),
                    InputCell(
                      initialValue: state.glulamBeamPercentage,
                      percentage: true,
                      setter: (value) => intermediateFloorsBloc.add(
                        GlulamBeamPercentageChanged(value),
                      ),
                    ),
                    OutputCell(getter: () => state.glulamBeamFloorArea),
                    RowCell(
                      initialValue:
                          "Välipohjien lattiapinta-alat yhteensä (% / kerrosala yhteensä m²)",
                    ),
                    OutputCell(
                      getter: () => state.totalPercentage,
                      percentage: true,
                    ),
                    OutputCell(getter: () => state.totalFloorArea),
                    ErrorCell(getters: () => [state.totalPercentage]),
                  ],
                ),
                const SizedBox(height: 20),
                LayoutGrid(
                  columnSizes: List.filled(3, 50.px),
                  rowSizes: List.filled(3, 50.px),
                  children: List.generate(9, (index) => EmptyCell()),
                ),
                const SizedBox(height: 20),
                LayoutGrid(
                  columnSizes: [150.px, 150.px, 150.px, 150.px, 150.px, 150.px],
                  rowSizes: List.filled(5, 50.px),
                  children: [
                    Cell.header(initialValue: 'Rakenne'),
                    ColumnCell(initialValue: 'Puuta (m³)'),
                    ColumnCell(initialValue: 'Puuta (tonnia)'),
                    ColumnCell(initialValue: 'Betonia (m³)'),
                    ColumnCell(initialValue: 'Betoni (tonnia)'),
                    ColumnCell(initialValue: 'Betoniteräs (tonnia)'),
                    RowCell(initialValue: 'Puurunko'),
                    OutputCell(getter: () => state.woodFrameWoodVolume),
                    OutputCell(getter: () => state.woodFrameWoodTons),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    RowCell(initialValue: 'Betonivalu'),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(
                      getter: () => state.concreteCastingConcreteVolume,
                    ),
                    OutputCell(getter: () => state.concreteCastingConcreteTons),
                    OutputCell(getter: () => state.concreteCastingRebarTons),
                    RowCell(initialValue: 'Ontelolaatta'),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(
                      getter: () => state.hollowCoreSlabConcreteVolume,
                    ),
                    OutputCell(getter: () => state.hollowCoreSlabConcreteTons),
                    OutputCell(getter: () => ""),
                    RowCell(initialValue: 'Liimapalkki'),
                    OutputCell(getter: () => state.glulamBeamWoodVolume),
                    OutputCell(getter: () => state.glulamBeamWoodTons),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
                    OutputCell(getter: () => ""),
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
