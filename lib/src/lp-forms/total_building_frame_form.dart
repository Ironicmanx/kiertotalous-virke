import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/building_frame_event.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_bloc.dart';
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

/// This form only sets values to [BuildingFrameBloc]
/// but uses getters of [TotalBuildingFrameBloc].
class TotalBuildingFrameForm extends StatelessWidget {
  const TotalBuildingFrameForm({super.key});

  @override
  Widget build(BuildContext context) {
    final buildingFrameBloc = context.read<BuildingFrameBloc>();

    return BlocBuilder<TotalBuildingFrameBloc, TotalBuildingFrame>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(
              text: 'Rakennuksen runko',
            ),
            LayoutGrid(
              columnSizes: [
                400.px,
                160.px,
                160.px,
              ],
              rowSizes: [
                100.px,
                50.px,
              ],
              children: [
                RowCell(
                  initialValue: 'Ulkoseinien kehämitta (jm)',
                  checkbox: true,
                  checkboxTitle: 'Käytä perustuksen kehämittaa',
                  checkboxValue:
                      state.buildingFrame?.useFoundationCircumference ?? false,
                  checkboxSetter: (value) => buildingFrameBloc.add(
                    UseFoundationCircumferenceChanged(value),
                  ),
                ),
                OutputCell(
                  getter: () => state.externalWallsPerimeter,
                ),
                InputCell(
                  initialValue: state.buildingFrame?.externalWallsPerimeter,
                  enabled: !(state.buildingFrame!.useFoundationCircumference),
                  setter: (value) => buildingFrameBloc.add(
                    ExternalWallsPerimeterChanged(value),
                  ),
                ),
                RowCell(
                  initialValue: 'Ulkoseinien keskikorkeus (m)',
                ),
                InputCell(
                  initialValue: state.buildingFrame?.externalWallsAverageHeight,
                  setter: (value) => buildingFrameBloc.add(
                    ExternalWallsAverageHeightChanged(
                      value,
                    ),
                  ),
                ),
                EmptyCell(),
              ],
            ),
            // empty space between forms
            SizedBox(height: 32),
            LayoutGrid(
              columnSizes: [
                400.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
                100.px,
              ],
              rowSizes: [
                100.px,
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
                  initialValue: 'Rakennemateriaalit',
                  checkbox: true,
                  // TODO: fix overflow issues and enable longer text
                  // 'Liima-, betoni-, teräs- ja betonielementit ovat kierrätettäviä',
                  checkboxTitle: 'Elementit ovat kierrätettäviä',
                  checkboxValue: state.buildingFrame?.areMaterialsRecyclable,
                  checkboxSetter: (value) => buildingFrameBloc.add(
                    AreMaterialsRecyclableChanged(value),
                  ),
                ),
                ColumnCell(
                  initialValue: 'Osuus (%)',
                ),
                ColumnCell(
                  initialValue: 'Osuus (m2)',
                ),
                ColumnCell(
                  initialValue: 'Puuta (m3)',
                ),
                ColumnCell(
                  initialValue: 'Puuta (tonnia)',
                ),
                ColumnCell(
                  initialValue: 'Betonia (m3)',
                ),
                ColumnCell(
                  initialValue: 'Betonia (tonnia)',
                ),
                ColumnCell(
                  initialValue: 'Terästä (tonnia)',
                ),
                ColumnCell(
                  initialValue: 'Tiiliä (m3)',
                ),
                ColumnCell(
                  initialValue: 'Tiiliä (tonnia)',
                ),
                RowCell(
                  initialValue: 'Puurunko',
                ),

                // puurunko
                InputCell(
                  percentage: true,
                  initialValue: state.buildingFrame?.woodPortionPercentage,
                  setter: (value) => buildingFrameBloc.add(
                    WoodPortionPercentageChanged(value),
                  ),
                ),
                OutputCell(getter: () => state.woodFramePart.area),
                OutputCell(getter: () => state.woodFramePart.woodVolume),
                OutputCell(getter: () => state.woodFramePart.woodTons),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),

                // liimapalkit
                RowCell(
                  initialValue: 'Liimapalkit',
                ),
                InputCell(
                  percentage: true,
                  initialValue: state
                      .buildingFrame?.glulamVerticalColumnsPortionPercentage,
                  setter: (value) => buildingFrameBloc.add(
                    GlulamVerticalColumnsPortionPercentageChanged(value),
                  ),
                ),
                OutputCell(getter: () => state.glulamBeamsPart.area),
                OutputCell(getter: () => state.glulamBeamsPart.woodVolume),
                OutputCell(getter: () => state.glulamBeamsPart.woodTons),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),

                // betonipalkit
                RowCell(
                  initialValue: 'Betonipalkit',
                ),
                InputCell(
                  percentage: true,
                  initialValue: state
                      .buildingFrame?.concreteVerticalColumnsPortionPercentage,
                  setter: (value) => buildingFrameBloc.add(
                    ConcreteVerticalColumnsPortionPercentageChanged(value),
                  ),
                ),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () => state.concreteVerticalColumnsPart.woodTons,
                ),
                OutputCell(
                  getter: () =>
                      state.concreteVerticalColumnsPart.concreteVolume,
                ),
                OutputCell(
                  getter: () => state.concreteVerticalColumnsPart.concreteTons,
                ),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                // teräspalkit
                RowCell(
                  initialValue: 'Teräspalkit',
                ),
                InputCell(
                  percentage: true,
                  initialValue: state
                      .buildingFrame?.steelVerticalColumnsPortionPercentage,
                  setter: (value) => buildingFrameBloc.add(
                    SteelVerticalColumnsPortionPercentageChanged(value),
                  ),
                ),
                OutputCell(getter: () => state.steelVerticalColumnsPart.area),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () => state.steelVerticalColumnsPart.steelTons,
                ),
                Cell.grey(),
                Cell.grey(),

                // kantavat tiiliseinät
                RowCell(
                  initialValue: 'Kantavat tiiliseinät',
                ),
                InputCell(
                  percentage: true,
                  initialValue: state.buildingFrame
                      ?.doubleLoadBearingBrickWallPortionPercentage,
                  setter: (value) => buildingFrameBloc.add(
                    DoubleLoadBearingBrickWallPortionPercentageChanged(value),
                  ),
                ),
                OutputCell(
                  getter: () => state.doubleLoadBearingBrickWallPart.area,
                ),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () =>
                      state.doubleLoadBearingBrickWallPart.brickVolume,
                ),
                OutputCell(
                  getter: () => state.doubleLoadBearingBrickWallPart.brickTons,
                ),

                // betonielementit
                RowCell(
                  initialValue: 'Betonielementit',
                ),
                InputCell(
                  percentage: true,
                  initialValue: state.buildingFrame
                      ?.concreteElementWallsWithoutFrameworkPortionPercentage,
                  setter: (value) => buildingFrameBloc.add(
                    ConcreteElementWallsWithoutFrameworkPortionPercentageChanged(
                        value),
                  ),
                ),
                OutputCell(
                  getter: () =>
                      state.concreteElementWallsWithoutFrameworkPart.area,
                ),
                Cell.grey(),
                Cell.grey(),
                OutputCell(
                  getter: () => state
                      .concreteElementWallsWithoutFrameworkPart.concreteVolume,
                ),
                OutputCell(
                  getter: () => state
                      .concreteElementWallsWithoutFrameworkPart.concreteTons,
                ),
                Cell.grey(),
                Cell.grey(),
                Cell.grey(),

                // yhteensä
                RowCell(
                  initialValue: 'Yhteensä',
                ),
                OutputCell(
                  getter: () => state.totalStructuralPartsPortionPercentage,
                  percentage: true,
                ),
                OutputCell(getter: () => state.totalStructuralPartsArea),
                OutputCell(getter: () => state.woodVolume),
                OutputCell(getter: () => state.woodTons),
                OutputCell(getter: () => state.concreteVolume),
                OutputCell(getter: () => state.concreteTons),
                OutputCell(getter: () => state.steelTons),
                OutputCell(getter: () => state.brickVolume),
                OutputCell(getter: () => state.brickTons),
                ErrorCell(
                    getters: () =>
                        [state.totalStructuralPartsPortionPercentage])
              ],
            ),
          ],
        );
      },
    );
  }
}
