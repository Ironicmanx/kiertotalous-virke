import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/hvac_and_electrical_installations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/hvac_and_electrical_installations_event.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// HVAC and Electrical Installations UI Form
class HVACAndElectricalInstallationsForm extends StatelessWidget {
  const HVACAndElectricalInstallationsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final hvacVBloc = context.read<HvacAndElectricalInstallationsBloc>();

    return BlocBuilder<HvacAndElectricalInstallationsBloc,
        HvacAndElectricalInstallations>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeader(text: "LVI- ja sähköasennukset"),

          // Grid: 6 columns, 9 rows
          LayoutGrid(
            columnSizes: [210.px, 150.px, 150.px, 150.px, 150.px, 150.px],
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
              ColumnCell(initialValue: "Johdot ja putket"),
              ColumnCell(initialValue: "Oletuspaino (kg/m)"),
              ColumnCell(
                initialValue: "kg/m",
                iconButton: InfoButton(
                    text: TooltipTexts.hvacAndElectricalInstallations
                        .detailedWeightPerMeters),
              ),
              ColumnCell(initialValue: "Metriä (m)"),
              ColumnCell(initialValue: "Kuutioita (m3)"),
              ColumnCell(initialValue: "Tonnia"),
              RowCell(initialValue: "Vesiputket (kupari)"),
              ColumnCell(initialValue: "0.0207"),
              InputCell(
                initialValue: state.copperWaterPipes?.weightKgPerMeter,
                setter: (value) =>
                    hvacVBloc.add(CopperWaterPipesWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.copperWaterPipes?.meters,
                setter: (value) =>
                    hvacVBloc.add(CopperWaterPipesMetersChanged(value)),
              ),
              GreyCell(),
              OutputCell(getter: () => state.copperWaterPipes?.tons),
              RowCell(initialValue: "Vesiputket (muovi)"),
              ColumnCell(initialValue: "0.12"),
              InputCell(
                initialValue: state.plasticWaterPipes?.weightKgPerMeter,
                setter: (value) =>
                    hvacVBloc.add(PlasticWaterPipesWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.plasticWaterPipes?.meters,
                setter: (value) =>
                    hvacVBloc.add(PlasticWaterPipesMetersChanged(value)),
              ),
              OutputCell(getter: () => state.plasticWaterPipes?.volume),
              OutputCell(getter: () => state.plasticWaterPipes?.tons),
              RowCell(
                  initialValue:
                      "Keskuslämmitysputket, vesikiertoinen lämmitys (teräs)"),
              ColumnCell(initialValue: "4.3"),
              InputCell(
                initialValue: state.centralHeatingPipes?.weightKgPerMeter,
                setter: (value) =>
                    hvacVBloc.add(CentralHeatingPipesWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.centralHeatingPipes?.meters,
                setter: (value) =>
                    hvacVBloc.add(CentralHeatingPipesMetersChanged(value)),
              ),
              GreyCell(),
              OutputCell(getter: () => state.centralHeatingPipes?.tons),
              RowCell(initialValue: "Viemäriputket valurauta DN 150"),
              ColumnCell(initialValue: "141"),
              InputCell(
                initialValue: state.castIronSewagePipes?.weightKgPerMeter,
                setter: (value) =>
                    hvacVBloc.add(CastIronSewagePipesWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.castIronSewagePipes?.meters,
                setter: (value) =>
                    hvacVBloc.add(CastIronSewagePipesMetersChanged(value)),
              ),
              GreyCell(),
              OutputCell(getter: () => state.castIronSewagePipes?.tons),
              RowCell(initialValue: "Viemäriputket muovi DN 150"),
              ColumnCell(initialValue: "22"),
              InputCell(
                initialValue: state.plasticSewagePipes?.weightKgPerMeter,
                setter: (value) =>
                    hvacVBloc.add(PlasticSewagePipesWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.plasticSewagePipes?.meters,
                setter: (value) =>
                    hvacVBloc.add(PlasticSewagePipesMetersChanged(value)),
              ),
              OutputCell(getter: () => state.plasticSewagePipes?.volume),
              OutputCell(getter: () => state.plasticSewagePipes?.tons),
              RowCell(initialValue: "Ilmastointiputket teräs DN 300"),
              ColumnCell(initialValue: "25"),
              InputCell(
                initialValue:
                    state.steelVentilationPipes300Dn?.weightKgPerMeter,
                setter: (value) => hvacVBloc
                    .add(SteelVentilationPipes300DnWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.steelVentilationPipes300Dn?.meters,
                setter: (value) => hvacVBloc
                    .add(SteelVentilationPipes300DnMetersChanged(value)),
              ),
              GreyCell(),
              OutputCell(getter: () => state.steelVentilationPipes300Dn?.tons),
              RowCell(initialValue: "Ilmastointiputket teräs DN 500"),
              ColumnCell(initialValue: "52"),
              InputCell(
                initialValue:
                    state.steelVentilationPipes500Dn?.weightKgPerMeter,
                setter: (value) => hvacVBloc
                    .add(SteelVentilationPipes500DnWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.steelVentilationPipes500Dn?.meters,
                setter: (value) => hvacVBloc
                    .add(SteelVentilationPipes500DnMetersChanged(value)),
              ),
              GreyCell(),
              OutputCell(getter: () => state.steelVentilationPipes500Dn?.tons),
              RowCell(initialValue: "Sähköjohdot (kupari)"),
              ColumnCell(initialValue: "0.13"),
              InputCell(
                initialValue: state.copperElectricalWires?.weightKgPerMeter,
                setter: (value) =>
                    hvacVBloc.add(CopperElectricalWiresWeightChanged(value)),
              ),
              InputCell(
                initialValue: state.copperElectricalWires?.meters,
                setter: (value) =>
                    hvacVBloc.add(CopperElectricalWiresMetersChanged(value)),
              ),
              GreyCell(),
              OutputCell(getter: () => state.copperElectricalWires?.tons),
            ],
          ),
        ],
      );
    });
  }
}
