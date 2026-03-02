import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/fixtures_and_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixtures_and_structures_event.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../shared/info_button.dart';
import '../shared/tooltip_texts.dart';

/// Fixtures and Structures Form
class FixturesAndStructuresForm extends StatelessWidget {
  const FixturesAndStructuresForm({super.key});

  @override
  Widget build(BuildContext context) {
    final fixturesBloc = context.read<FixturesAndStructuresBloc>();

    return BlocBuilder<FixturesAndStructuresBloc, FixturesAndStructures>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(
              text: 'Rakennukseen liittyvät kiintokalusteet ja rakenteet',
            ),
            const SizedBox(height: 20),
            LayoutGrid(
              columnSizes: [300.px, 140.px, 140.px, 140.px, 140.px],
              rowSizes: [50.px, 50.px, 50.px, 50.px, 50.px],
              children: [
                RowCell(
                  initialValue: "",
                  checkbox: true,
                  checkboxTitle: "Kalusteet ovat uudelleenkäytettäviä",
                  checkboxValue: state.fixturesRecyclable,
                  checkboxSetter: (value) =>
                      fixturesBloc.add(FixturesRecyclableChanged(value)),
                ),
                ColumnCell(initialValue: "Oletuspaino (kg/m)"),
                ColumnCell(
                  initialValue: "kg/m",
                  iconButton: InfoButton(
                    text: TooltipTexts
                        .hvacAndElectricalInstallations.detailedWeightPerMeters,
                  ),
                ),
                ColumnCell(initialValue: "Metriä (m)"),
                ColumnCell(initialValue: "Tonnia"),
                RowCell(initialValue: "Sadevesikourut ja rännit"),
                ColumnCell(initialValue: "2"),
                InputCell(
                  initialValue:
                      state.rainGuttersAndDownSpouts?.weightKgPerMeter,
                  setter: (value) =>
                      fixturesBloc.add(RainGuttersWeightChanged(value)),
                ),
                InputCell(
                  initialValue: state.rainGuttersAndDownSpouts?.meters,
                  setter: (value) =>
                      fixturesBloc.add(RainGuttersMetersChanged(value)),
                ),
                OutputCell(getter: () => state.rainGuttersAndDownSpouts?.tons),
                RowCell(initialValue: "Palotikkaat ja kulkusillat"),
                ColumnCell(initialValue: "10"),
                InputCell(
                  initialValue: state.fireLaddersAndWalkways?.weightKgPerMeter,
                  setter: (value) =>
                      fixturesBloc.add(FireLaddersWeightChanged(value)),
                ),
                InputCell(
                  initialValue: state.fireLaddersAndWalkways?.meters,
                  setter: (value) =>
                      fixturesBloc.add(FireLaddersMetersChanged(value)),
                ),
                OutputCell(getter: () => state.fireLaddersAndWalkways?.tons),
                RowCell(
                  initialValue: "Panssariverkkoaita alumiini korkeus 2 m",
                ),
                ColumnCell(initialValue: "4"),
                InputCell(
                  initialValue:
                      state.aluminiumChainLinkFences?.weightKgPerMeter,
                  setter: (value) => fixturesBloc.add(
                    AluminiumChainLinkFencesWeightChanged(value),
                  ),
                ),
                InputCell(
                  initialValue: state.aluminiumChainLinkFences?.meters,
                  setter: (value) => fixturesBloc.add(
                    AluminiumChainLinkFencesMetersChanged(value),
                  ),
                ),
                OutputCell(getter: () => state.aluminiumChainLinkFences?.tons),
                RowCell(initialValue: "Panssariverkkoaita teräs korkeus 2 m"),
                ColumnCell(initialValue: "5"),
                InputCell(
                  initialValue: state.steelChainLinkFences?.weightKgPerMeter,
                  setter: (value) => fixturesBloc.add(
                    SteelChainLinkFencesWeightChanged(value),
                  ),
                ),
                InputCell(
                  initialValue: state.steelChainLinkFences?.meters,
                  setter: (value) => fixturesBloc.add(
                    SteelChainLinkFencesMetersChanged(value),
                  ),
                ),
                OutputCell(getter: () => state.steelChainLinkFences?.tons),
              ],
            ),
          ],
        );
      },
    );
  }
}
