import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_bloc.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class CarportOrGarageForm extends StatelessWidget {
  const CarportOrGarageForm({super.key});

  List<DropdownMenuItem<FoundationType?>> foundationTypeToList() {
    return [
      DropdownMenuItem<FoundationType?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...FoundationType.values.map((type) {
        return DropdownMenuItem<FoundationType?>(
          value: type,
          child: Text(foundationTypeToString(type)),
        );
      }),
    ];
  }

  List<DropdownMenuItem<GarageWallMaterial?>> garageWallMaterialToList() {
    return [
      DropdownMenuItem<GarageWallMaterial?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...GarageWallMaterial.values.map((type) {
        return DropdownMenuItem<GarageWallMaterial?>(
          value: type,
          child: Text(garageWallMaterialToString(type)),
        );
      }),
    ];
  }

  List<DropdownMenuItem<InsulationMaterialThickness?>>
      insulationMaterialThicknessToList() {
    return [
      DropdownMenuItem<InsulationMaterialThickness?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...InsulationMaterialThickness.values.map((type) {
        return DropdownMenuItem<InsulationMaterialThickness?>(
          value: type,
          child: Text(insulationMaterialThicknessToString(type)),
        );
      }),
    ];
  }

  String foundationTypeToString(FoundationType type) {
    switch (type) {
      case FoundationType.concretePillars:
        return 'Betonipilarit';
      case FoundationType.concreteSlab:
        return 'Betonilaatta';
    }
  }

  String garageWallMaterialToString(GarageWallMaterial type) {
    switch (type) {
      case GarageWallMaterial.board:
        return 'Lauta';
      case GarageWallMaterial.brick:
        return 'Tiili';
      case GarageWallMaterial.steelSheet:
        return 'Teräspelti';
      case GarageWallMaterial.concrete:
        return 'Betoni';
      case GarageWallMaterial.minerite:
        return 'Mineriitti';
    }
  }

  String insulationMaterialThicknessToString(InsulationMaterialThickness type) {
    switch (type) {
      case InsulationMaterialThickness.mm100:
        return '100mm';
      case InsulationMaterialThickness.mm200:
        return '200mm';
      case InsulationMaterialThickness.mm300:
        return '300mm';
    }
  }

  @override
  Widget build(BuildContext context) {
    final carBloc = context.read<CarportOrGarageBloc>();

    return BlocBuilder<CarportOrGarageBloc, CarportOrGarage>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutGrid(
              columnSizes: [
                200.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
              ],
              rowSizes: [
                75.px,
                50.px,
              ],
              children: [
                Cell.header(
                  initialValue:
                      'Autokatos tai talli, erilliset ulkovarastot ja lämpökeskus',
                ),
                Cell.column(initialValue: 'Rakennuksen pituus (m)'),
                Cell.column(initialValue: 'Rakennuksen leveys (m)'),
                Cell.column(initialValue: 'Rakennuksen tyyppi'),
                Cell.column(initialValue: 'Asfaltti (tonnia)'),
                Cell.column(initialValue: 'Betoni (tonnia)'),
                Cell.empty(),
                Cell.input(
                  initialValue: state.buildingLengthInMeters,
                  setter: (value) => carBloc.add(
                    BuildingLengthInMetersChanged(value),
                  ),
                ),
                Cell.input(
                  initialValue: state.buildingWidthInMeters,
                  setter: (value) => carBloc.add(
                    BuildingWidthInMetersChanged(value),
                  ),
                ),
                Cell.menu(
                  initialValue: state.foundationType,
                  items: foundationTypeToList(),
                  setter: (value) => carBloc.add(
                    FoundationTypeChanged(value),
                  ),
                ),
                Cell.output(
                  getter: () => state.asphaltTons,
                ),
                Cell.output(
                  getter: () => state.concreteTons,
                )
              ],
            ),
            const SizedBox(height: 40),
            LayoutGrid(
              columnSizes: [
                200.px,
                140.px,
                140.px,
                140.px,
                140.px,
              ],
              rowSizes: [
                75.px,
                50.px,
                50.px,
                50.px,
                50.px,
              ],
              children: [
                Cell.header(initialValue: 'Katoksen tai tallin seinät'),
                Cell.column(initialValue: 'Eristepaksuus (villa)'),
                Cell.column(initialValue: 'Pinta-ala (m2)'),
                Cell.column(initialValue: 'Seinämateriaali (tonnia)'),
                Cell.column(initialValue: 'Eriste (tonnia)'),
                Cell.row(initialValue: 'Seinän keskimääräinen korkeus (m)'),
                Cell.input(
                  initialValue: state.wallAverageHeight,
                  setter: (value) => carBloc.add(
                    WallAverageHeightChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.wallArea),
                Cell.output(getter: () => state.wallMaterialTons),
                Cell.output(getter: () => state.insulationThicknessTons),
                Cell.row(initialValue: 'Rakennuksen seinäpituus yhteensä (jm)'),
                Cell.input(
                  initialValue: state.buildingWallLengthTotal,
                  setter: (value) => carBloc.add(
                    BuildingWallLengthTotalChanged(value),
                  ),
                ),
                Cell.empty(),
                Cell.empty(),
                Cell.empty(),
                Cell.row(initialValue: 'Villan paksuus'),
                Cell.menu(
                  initialValue: state.insulationMaterialThickness,
                  items: insulationMaterialThicknessToList(),
                  setter: (value) => carBloc.add(
                    InsulationMaterialThicknessChanged(value),
                  ),
                ),
                Cell.empty(),
                Cell.empty(),
                Cell.empty(),
                Cell.row(initialValue: 'Seinämateriaali'),
                Cell.menu(
                  initialValue: state.garageWallMaterial,
                  items: garageWallMaterialToList(),
                  setter: (value) => carBloc.add(
                    GarageWallMaterialChanged(value),
                  ),
                ),
                Cell.empty(),
                Cell.empty(),
                Cell.empty(),
              ],
            ),
          ],
        );
      },
    );
  }
}
