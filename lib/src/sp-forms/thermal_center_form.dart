import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/sp-bloc/thermal_center_bloc.dart';
import 'package:flutter_app/src/sp-bloc/thermal_center_event.dart';
import 'package:flutter_app/src/sp-bloc/total_thermal_center_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class ThermalCenterForm extends StatelessWidget {
  const ThermalCenterForm({super.key});

  String garageWallMaterialToString(GarageWallMaterial? material) {
    switch (material) {
      case GarageWallMaterial.board:
        return 'Lautaverhous';
      case GarageWallMaterial.brick:
        return 'Tiili';
      case GarageWallMaterial.steelSheet:
        return 'Teräslevy';
      case GarageWallMaterial.concrete:
        return 'Betoni';
      case GarageWallMaterial.minerite:
        return 'Mineriitti';
      case null:
        return 'Valitse';
    }
  }

  List<DropdownMenuItem<GarageWallMaterial?>> garageWallMaterialToList() {
    return [
      DropdownMenuItem<GarageWallMaterial?>(
        value: null,
        child: Text('Seinämateriaali'),
      ),
      ...GarageWallMaterial.values.map((material) {
        return DropdownMenuItem<GarageWallMaterial?>(
          value: material,
          child: Text(garageWallMaterialToString(material)),
        );
      }),
    ];
  }

  String waterRoofTypeToString(WaterRoofType? type) {
    switch (type) {
      case WaterRoofType.metalRoof:
        return 'Teräs';
      case WaterRoofType.mineriteRoof:
        return 'Mineriitti';
      case WaterRoofType.roofingFelt:
        return 'Huopa';
      case WaterRoofType.tiledRoof:
        return 'Tiili';
      case null:
        return 'Valitse';
    }
  }

  List<DropdownMenuItem<SmallPropertyRoofType?>> roofTypeToList() {
    return [
      DropdownMenuItem<SmallPropertyRoofType?>(
        value: null,
        child: Text('Kattotyyppi'),
      ),
      ...SmallPropertyRoofType.values.map((material) {
        return DropdownMenuItem<SmallPropertyRoofType?>(
          value: material,
          child: Text(roofTypeToString(material)),
        );
      }),
    ];
  }

  String roofTypeToString(SmallPropertyRoofType? type) {
    switch (type) {
      case SmallPropertyRoofType.flatRoof:
        return 'Tasakatto, ristikko jako 800mm';
      case SmallPropertyRoofType.gableRoof:
        return 'Harjakatto, ristikko jako 800mm';
      case SmallPropertyRoofType.pentRoof:
        return 'Pulpettikatto, ristikko jako 800mm';
      case null:
        return 'Kattotyyppi';
    }
  }

  List<DropdownMenuItem<WaterRoofType?>> waterRoofTypeToList() {
    return [
      DropdownMenuItem<WaterRoofType?>(
        value: null,
        child: Text('Vesikatemateriaali'),
      ),
      ...WaterRoofType.values.map((material) {
        return DropdownMenuItem<WaterRoofType?>(
          value: material,
          child: Text(waterRoofTypeToString(material)),
        );
      }),
    ];
  }

  String heatingTypeToString(HeatingType? material) {
    switch (material) {
      case HeatingType.districtHeatExchanger:
        return 'Kaukolämmönvaihdin';
      case HeatingType.electricBoiler:
        return 'Sähkökattila';
      case HeatingType.pelletBoiler:
        return 'Puu/Pellettikattila';
      case null:
        return 'Valitse';
    }
  }

  List<DropdownMenuItem<HeatingType?>> heatingTypeToMaterial() {
    return [
      DropdownMenuItem<HeatingType?>(value: null, child: Text('Valitse')),
      ...HeatingType.values.map((material) {
        return DropdownMenuItem<HeatingType?>(
          value: material,
          child: Text(heatingTypeToString(material)),
        );
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ThermalCenterBloc>();

    return BlocBuilder<TotalThermalCenterBloc, ThermalCenter>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutGrid(
              columnSizes: [
                200.px,
                150.px,
                150.px,
                150.px,
                150.px,
                150.px,
                150.px,
              ],
              rowSizes: [
                50.px,
                75.px,
                50.px,
                75.px,
                50.px,
                50.px,
                50.px,
                50.px,
                75.px,
                50.px,
                75.px,
                50.px,
                50.px,
                50.px,
                50.px,
                75.px,
                50.px,
                50.px,
              ],
              children: [
                FormHeader(text: "Lämpökeskus"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 3,
                  rowStart: 0,
                  child: RowCell(
                    checkbox: true,
                    checkboxTitle:
                        "Kiinteistö on kaukolämmössä tai suora sähkölämmitys",
                    checkboxValue: state.onDisctrictOrDirectHeating,
                    checkboxSetter: (value) =>
                        bloc.add(OnDistrictOrDirectHeatingChanged(value)),
                  ),
                ),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                RowCell(initialValue: "Lämpökeskuksen mitat"),
                ColumnCell(initialValue: "Pituus (m)"),
                ColumnCell(initialValue: "Leveys (m)"),
                ColumnCell(initialValue: "Sokkelin korkeus (m) "),
                ColumnCell(initialValue: "Seinän korkeus (m)"),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                InputCell(
                  initialValue: state.concreteLengthInMeters,
                  setter: (value) => bloc.add(ConcreteLengthChanged(value)),
                ),
                InputCell(
                  initialValue: state.concreteWidthInMeters,
                  setter: (value) => bloc.add(ConcreteWidthChanged(value)),
                ),
                InputCell(
                  initialValue: state.plinthHeightInMeters,
                  setter: (value) => bloc.add(PlinthHeightChanged(value)),
                ),
                InputCell(
                  initialValue: state.wallHeightInMeters,
                  setter: (value) => bloc.add(WallHeightChanged(value)),
                ),
                EmptyCell(),
                EmptyCell(),
                RowCell(initialValue: "Lämpökeskuksen rakenteet"),
                ColumnCell(initialValue: "Seinäpinta-ala (m2)"),
                ColumnCell(
                  initialValue: "Ulkoseinän pinta-materiaali (tonnia)",
                ),
                ColumnCell(initialValue: "Betonin määrä (tonnia)"),
                ColumnCell(initialValue: "Betoniteräksen määrä (tonnia)"),
                EmptyCell(),
                EmptyCell(),
                MenuCell<GarageWallMaterial?>(
                  setter: (value) => bloc.add(GarageWallMaterialChanged(value)),
                  initialValue: state.garageWallMaterial,
                  items: garageWallMaterialToList(),
                ),
                OutputCell(getter: () => state.wallArea),
                OutputCell(getter: () => state.outerWallSurfaceMaterial),
                OutputCell(getter: () => state.concreteTons),
                OutputCell(getter: () => state.reinforcedConcreteTons),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                FormHeader(text: "Katto"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 2,
                  rowStart: 7,
                  child: MenuCell<SmallPropertyRoofType?>(
                    setter: (value) => bloc.add(RoofTypeChanged(value)),
                    initialValue: state.roofType,
                    items: roofTypeToList(),
                  ),
                ),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                RowCell(initialValue: "Mitat"),
                ColumnCell(initialValue: "Lappeen pituus (m)"),
                ColumnCell(initialValue: "Lappeen leveys (m)"),
                ColumnCell(initialValue: "Pinta-ala (m2)"),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                InputCell(
                  initialValue: state.roofLengthInMeters,
                  setter: (value) => bloc.add(RoofLengthChanged(value)),
                ),
                InputCell(
                  initialValue: state.roofFlatInMeters,
                  setter: (value) => bloc.add(RoofFlatChanged(value)),
                ),
                OutputCell(getter: () => state.roofArea),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                ColumnCell(initialValue: "Materiaalit"),
                ColumnCell(initialValue: "Puinen ristikkorakenne (tonnia)"),
                ColumnCell(initialValue: "Aluslaudoitus (tonnia)"),
                ColumnCell(initialValue: "Vesikate (tonnia)"),
                ColumnCell(initialValue: "Aluskate määrä (tonnia)"),
                EmptyCell(),
                EmptyCell(),
                MenuCell<WaterRoofType?>(
                  setter: (value) => bloc.add(WaterRoofTypeChanged(value)),
                  initialValue: state.waterRoofType,
                  items: waterRoofTypeToList(),
                ),
                OutputCell(getter: () => state.woodenRoofLatticeWeightTons),
                OutputCell(getter: () => state.underBoardingWeightTons),
                OutputCell(getter: () => state.waterRoofWeightTons),
                OutputCell(getter: () => state.underLaymentWeightTons),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                FormHeader(text: "Lämpökattila / Lämmonvaihdin"),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                EmptyCell(),
                ColumnCell(initialValue: "Lämmitysmuoto"),
                ColumnCell(initialValue: "Teho (kW)"),
                ColumnCell(
                  initialValue:
                      "Kattiloiden, lämmönvaihtimien ja varaajien määrä (kpl)",
                ),
                ColumnCell(
                  initialValue: "Kattilan/lämmönvaihtimen paino (tonnia)",
                ),
                ColumnCell(initialValue: "Vesivaraajien määrä (kpl)"),
                ColumnCell(initialValue: "Vesivaraajan paino (tonnia)"),
                EmptyCell(),
                MenuCell<HeatingType?>(
                  setter: (value) => bloc.add(HeatingTypeChanged(value)),
                  initialValue: state.heatingType,
                  items: heatingTypeToMaterial(),
                ),
                InputCell(
                  initialValue: state.powerInKiloWatts,
                  setter: (value) => bloc.add(PowerChanged(value)),
                ),
                InputCell(
                  initialValue: state.heatingMachinesPcs,
                  setter: (value) => bloc.add(HeatingMachinesChanged(value)),
                  integer: true,
                ),
                OutputCell(getter: () => state.boilerOrHeatExchangerWeightTons),
                InputCell(
                  initialValue: state.waterHeatersPcs,
                  setter: (value) => bloc.add(WaterHeatersChanged(value)),
                  integer: true,
                ),
                OutputCell(getter: () => state.waterHeaterWeightTons),
                EmptyCell(),
                RowCell(
                  checkbox: true,
                  checkboxTitle: "Uudelleenkäytettäviä",
                  checkboxValue: state.areRecyclable,
                  checkboxSetter: (value) =>
                      bloc.add(AreRecyclableChanged(value)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
