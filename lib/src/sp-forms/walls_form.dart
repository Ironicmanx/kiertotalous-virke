import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/sp-bloc/walls_bloc.dart';
import 'package:flutter_app/src/sp-bloc/walls_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:bl_demolition_materials/src/small_properties/data_types/exports.dart';

class WallsForm extends StatelessWidget {
  const WallsForm({super.key});

  //WallMaterial
  List<DropdownMenuItem<WallMaterial?>> wallMaterialToList() {
    return [
      DropdownMenuItem<WallMaterial?>(value: null, child: Text('Valitse')),
      ...WallMaterial.values.map((type) {
        return DropdownMenuItem<WallMaterial?>(
          value: type,
          child: Text(wallMaterialToString(type)),
        );
      }),
    ];
  }

  String wallMaterialToString(WallMaterial type) {
    switch (type) {
      case WallMaterial.concrete:
        return "Betoni";
      case WallMaterial.brick:
        return "Tiili";
    }
  }

  // WoodMaterialType
  List<DropdownMenuItem<WoodMaterialType?>> woodMaterialTypeToList() {
    return [
      DropdownMenuItem<WoodMaterialType?>(value: null, child: Text('Valitse')),
      ...WoodMaterialType.values
          .where((type) => type.toString().contains('trunkWood'))
          .map((type) {
            return DropdownMenuItem<WoodMaterialType?>(
              value: type,
              child: Text(woodMaterialTypeToString(type)),
            );
          }),
    ];
  }

  String woodMaterialTypeToString(WoodMaterialType type) {
    switch (type) {
      case WoodMaterialType.trunkWood50x100:
        return "Runkopuu 50x100";
      case WoodMaterialType.trunkWood50x150:
        return "Runkopuu 50x150";
      case WoodMaterialType.trunkWood50x200:
        return "Runkopuu 50x200";
      case WoodMaterialType.trunkWood100x100:
        return "Runkopuu 100x100";
      case WoodMaterialType.trunkWood150x150:
        return "Runkopuu 150x150";
      default:
        return type.toString().split('.').last;
    }
  }

  //100mm, 200mm, 300mm
  List<DropdownMenuItem<InsulationMaterialThickness?>>
  insulationThicknessToList() {
    return [
      DropdownMenuItem<InsulationMaterialThickness?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...InsulationMaterialThickness.values.map((type) {
        return DropdownMenuItem<InsulationMaterialThickness?>(
          value: type,
          child: Text(insulationThicknessToString(type)),
        );
      }),
    ];
  }

  String insulationThicknessToString(InsulationMaterialThickness type) {
    switch (type) {
      case InsulationMaterialThickness.mm100:
        return "100mm";
      case InsulationMaterialThickness.mm200:
        return "200mm";
      case InsulationMaterialThickness.mm300:
        return "300mm";
    }
  }

  //Lautaverho, Tiili, Mineriittilevy)
  List<DropdownMenuItem<OuterWallSurfaceMaterial?>>
  outerWallSurfaceMaterialToList() {
    return [
      DropdownMenuItem<OuterWallSurfaceMaterial?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...OuterWallSurfaceMaterial.values.map((type) {
        return DropdownMenuItem<OuterWallSurfaceMaterial?>(
          value: type,
          child: Text(outerWallSurfaceMaterialToString(type)),
        );
      }),
    ];
  }

  String outerWallSurfaceMaterialToString(OuterWallSurfaceMaterial type) {
    switch (type) {
      case OuterWallSurfaceMaterial.boardCurtain:
        return "Lautaverho";
      case OuterWallSurfaceMaterial.brick:
        return "Tiili";
      case OuterWallSurfaceMaterial.mineriteBoard:
        return "Mineriittilevy";
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WallsBloc>();

    return BlocBuilder<WallsBloc, Walls>(
      builder: (context, state) {
        return LayoutGrid(
          columnSizes: [
            200.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
            130.px,
          ],
          rowSizes: [50.px, 90.px, 50.px, 50.px],
          children: [
            FormHeader(text: "Ulko- ja kantavien väliseinien materiaalit"),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            MenuCell<WallMaterial?>(
              setter: (value) => bloc.add(WallMaterialChanged(value)),
              initialValue: state.wallMaterial,
              items: wallMaterialToList(),
            ),
            GridPlacement(
              columnStart: 7,
              columnSpan: 2,
              rowStart: 0,
              child: MenuCell<WoodMaterialType?>(
                setter: (value) => bloc.add(WoodMaterialTypeChanged(value)),
                initialValue: state.woodMaterialType,
                items: woodMaterialTypeToList(),
              ),
            ),
            MenuCell<InsulationMaterialThickness?>(
              setter:
                  (value) =>
                      bloc.add(InsulationMaterialThicknessChanged(value)),
              initialValue: state.insulationMaterialThickness,
              items: insulationThicknessToList(),
            ),
            MenuCell<OuterWallSurfaceMaterial?>(
              setter:
                  (value) => bloc.add(OuterWallSurfaceMaterialChanged(value)),
              initialValue: state.outerWallSurfaceMaterial,
              items: outerWallSurfaceMaterialToList(),
            ),
            EmptyCell(),
            ColumnCell(initialValue: "Seinän pituus (m)"),
            ColumnCell(initialValue: "Seinän leveys (m)"),
            ColumnCell(initialValue: "Seinän korkeus (m)"),
            ColumnCell(initialValue: "Ulkoseinän pinta-ala (m2)"),
            ColumnCell(initialValue: "Ulkoverhous (kivi tai tiili) (jm)"),
            ColumnCell(
              initialValue:
                  "Kantavat kiviseinät ja osittainen ulkovuoraus (tonnia)",
            ),
            ColumnCell(initialValue: "Seinärunko (tonnia)"),
            ColumnCell(initialValue: "Tuulensuojalevyn määrä (tonnia)"),
            ColumnCell(initialValue: "Eristemateriaali (tonnia)"),
            ColumnCell(initialValue: "Ulkoseinän pintamateriaali (tonnia)"),
            EmptyCell(),
            InputCell(
              initialValue: state.lengthInMeters,
              setter: (value) => bloc.add(LengthInMetersChanged(value)),
            ),
            InputCell(
              initialValue: state.widthInMeters,
              setter: (value) => bloc.add(WidthInMetersChanged(value)),
            ),
            InputCell(
              initialValue: state.heightInMeters,
              setter: (value) => bloc.add(HeightInMetersChanged(value)),
            ),
            OutputCell(getter: () => state.outerWallArea),
            InputCell(
              initialValue: state.stoneOrBrickWallsInLinearMeters,
              setter: (value) => bloc.add(StoneOrBrickWallsChanged(value)),
            ),
            OutputCell(getter: () => state.partitionWallsTons),
            OutputCell(getter: () => state.cleanWoodOrBurnableWoodTons),
            OutputCell(getter: () => state.windProtectionBoardTons),
            OutputCell(getter: () => state.insulationWoolTons),
            OutputCell(getter: () => state.outerWallBoardCurtainTons),
            RowCell(initialValue: "Uudelleenkäytettävät materiaalit"),
            RowCell(
              checkbox: true,
              checkboxSetter:
                  (value) => bloc.add(TrunkWoodRecyclableChanged(value)),
              checkboxTitle: "Runkopuu",
              checkboxValue: state.isTrunkWoodRecyclable,
            ),
            RowCell(
              checkbox: true,
              checkboxSetter:
                  (value) => bloc.add(InsulationWoolRecyclableChanged(value)),
              checkboxTitle: "Eristevilla",
              checkboxValue: state.isInsulationWoolRecyclable,
            ),
            GridPlacement(
              columnStart: 3,
              columnSpan: 2,
              rowStart: 3,
              child: RowCell(
                checkbox: true,
                checkboxSetter:
                    (value) => bloc.add(AggregateRecyclableChanged(value)),
                checkboxTitle: "Kiviaines (tiili ja betoni)",
                checkboxValue: state.isAggregateRecyclable,
              ),
            ),
          ],
        );
      },
    );
  }
}
