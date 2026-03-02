import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/cellar_bloc.dart';
import 'package:flutter_app/src/lp-bloc/cellar_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// Cellar UI Form
class CellarForm extends StatelessWidget {
  const CellarForm({super.key});

  /// Converts CellarExteriorMaterial enum values to display names
  /// and returns them as a list of DropdownMenuItems.
  List<DropdownMenuItem<CellarExteriorMaterial?>> toList() {
    return [
      DropdownMenuItem<CellarExteriorMaterial?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...CellarExteriorMaterial.values.map((type) {
        return DropdownMenuItem<CellarExteriorMaterial?>(
          value: type,
          child: Text(typeToString(type)),
        );
      }),
    ];
  }

  String typeToString(CellarExteriorMaterial type) {
    switch (type) {
      case CellarExteriorMaterial.concreteCasting:
        return "Betonivalu";
      case CellarExteriorMaterial.brick:
        return "Tiiliseinä";
      case CellarExteriorMaterial.concreteBlock:
        return "Harkkoseinä";
    }
  }

  @override
  Widget build(BuildContext context) {
    final cellarBloc = context.read<CellarBloc>();

    return BlocBuilder<CellarBloc, Cellar>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: 'Kellari'),
            // Existing grid for cellar details
            LayoutGrid(
              columnSizes: [210.px, 120.px, 120.px],
              rowSizes: [
                50.px,
                50.px,
                50.px,
              ],
              children: [
                RowCell(initialValue: 'Kellarin lattia-ala (m²)'),
                InputCell(
                  initialValue: state.floorArea,
                  setter: (value) =>
                      cellarBloc.add(CellarFloorAreaChanged(value)),
                ),
                EmptyCell(),
                RowCell(initialValue: 'Kellarin ulkoseinien kehämitta (jm)'),
                InputCell(
                  initialValue: state.exteriorWallsPerimeter,
                  setter: (value) =>
                      cellarBloc.add(CellarPerimeterChanged(value)),
                ),
                MenuCell<CellarExteriorMaterial?>(
                  setter: (value) =>
                      cellarBloc.add(CellarMaterialChanged(value)),
                  initialValue: state.exteriorWallsMaterial,
                  items: toList(),
                ),
                RowCell(initialValue: 'Kellarin seinän korkeus (m)'),
                InputCell(
                  initialValue: state.wallHeight,
                  setter: (value) =>
                      cellarBloc.add(CellarWallHeightChanged(value)),
                ),
                EmptyCell(),
              ],
            ),

            const SizedBox(height: 20), // Space before next grid

            // New grid for demolition materials
            LayoutGrid(
              columnSizes: [210.px, 120.px, 120.px], // Adjusted column widths
              rowSizes: [
                75.px,
                50.px,
                50.px,
                50.px,
                50.px,
                70.px,
                70.px,
                50.px,
              ], // 1 header row + 8 material rows
              children: [
                Cell.header(
                    initialValue:
                        "Kellarin lattian ja ulkoseinien purkumateriaalimäärät"),
                ColumnCell(initialValue: "Tonnia"),
                ColumnCell(initialValue: "m³"),
                RowCell(initialValue: "Betonia"),
                OutputCell(getter: () => state.concreteTons),
                OutputCell(getter: () => state.concreteVolume),
                RowCell(initialValue: "Betoniterästä"),
                OutputCell(getter: () => state.rebarTons),
                OutputCell(getter: () => ''),
                RowCell(initialValue: "Tiiliä"),
                OutputCell(getter: () => state.brickTons),
                OutputCell(getter: () => state.brickVolume),
                RowCell(initialValue: "Harkkoja"),
                OutputCell(getter: () => state.blockTons),
                OutputCell(getter: () => state.blockVolume),
                RowCell(initialValue: "Lasi- ja mineraalieristevilla (tonnia)"),
                OutputCell(
                    getter: () => state.glassAndMineralWoolInsulationTons),
                OutputCell(
                    getter: () => state.glassAndMineralWoolInsulationVolume),
                RowCell(
                    initialValue: "Muovijäte, styrox, kosteuseriste yms. (m3)"),
                OutputCell(getter: () => state.plasticWasteTons),
                OutputCell(getter: () => state.plasticWasteVolume),
                RowCell(initialValue: "Kuumabitumisively"),
                OutputCell(getter: () => state.hotBitumenCoatingTons),
                OutputCell(getter: () => state.hotBitumenCoatingVolume),
              ],
            ),
          ],
        );
      },
    );
  }
}
