import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_bloc.dart';
import 'package:flutter_app/src/sp-bloc/electrical_installations_and_hvac_event.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SPElectricalInstallationsAndhvacForm extends StatelessWidget {
  const SPElectricalInstallationsAndhvacForm({super.key});

  @override
  Widget build(BuildContext context) {
    final hvacBloc =
        context.read<SmallPropertiesElectricalInstallationsAndHvacBloc>();

    return BlocBuilder<SmallPropertiesElectricalInstallationsAndHvacBloc, Hvac>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: 'Sähköasennukset ja LVI'),
            LayoutGrid(
              columnSizes: [250.px, 160.px, 160.px],
              rowSizes: [
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px
              ],
              children: [
                EmptyCell(),
                ColumnCell(initialValue: 'Metriä'),
                ColumnCell(initialValue: 'KG'),
                RowCell(initialValue: 'Sähköjohdot, kupari'),
                InputCell(
                  initialValue: state.electricalWiresCopper,
                  setter: (value) =>
                      hvacBloc.add(SPElectricalWiresCopperChanged(value)),
                ),
                OutputCell(
                  getter: () => state.electricalWiresCopperWeightKg,
                ),
                RowCell(initialValue: 'Kupariputket'),
                InputCell(
                  initialValue: state.copperPipes,
                  setter: (value) => hvacBloc.add(SPCopperPipesChanged(value)),
                ),
                OutputCell(
                  getter: () => state.copperPipesWeightKg,
                ),
                RowCell(initialValue: 'Muoviputket, vesi'),
                InputCell(
                  initialValue: state.plasticPipesWater,
                  setter: (value) =>
                      hvacBloc.add(SPPlasticPipesWaterChanged(value)),
                ),
                OutputCell(
                  getter: () => state.plasticPipesWaterWeightKg,
                ),
                RowCell(initialValue: 'Ilmastointiputket D200'),
                InputCell(
                  initialValue: state.ventilationPipesD200,
                  setter: (value) =>
                      hvacBloc.add(SPVentilationPipesD200Changed(value)),
                ),
                OutputCell(
                  getter: () => state.ventilationPipesD200WeightKg,
                ),
                RowCell(
                  initialValue: 'Keskuslämmitysputket',
                ),
                InputCell(
                  initialValue: state.centralHeatingPipes,
                  setter: (value) =>
                      hvacBloc.add(SPCentralHeatingPipesChanged(value)),
                ),
                OutputCell(
                  getter: () => state.centralHeatingPipesWeightKg,
                ),
                RowCell(initialValue: 'Valurautaputket'),
                InputCell(
                  initialValue: state.castIronPipes,
                  setter: (value) =>
                      hvacBloc.add(SPCastIronPipesChanged(value)),
                ),
                OutputCell(
                  getter: () => state.castIronPipesWeightKg,
                ),
                RowCell(
                  initialValue: 'Muoviset viemäriputket',
                ),
                InputCell(
                  initialValue: state.sewagePipesPlastic,
                  setter: (value) =>
                      hvacBloc.add(SPSewagePipesPlasticChanged(value)),
                ),
                OutputCell(
                  getter: () => state.sewagePipesPlasticWeightKg,
                ),
                RowCell(
                  initialValue: 'Sadevesikourut ja rännit',
                ),
                InputCell(
                  initialValue: state.rainGutters,
                  setter: (value) => hvacBloc.add(SPRainGuttersChanged(value)),
                ),
                OutputCell(
                  getter: () => state.rainGuttersWeightKg,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
