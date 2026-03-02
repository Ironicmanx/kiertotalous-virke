import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/bituminous_mixtures_coal_tar_products_bloc.dart';
import 'package:flutter_app/src/lp-bloc/bituminous_mixtures_coal_tar_products_event.dart';
import 'package:flutter_app/src/lp-bloc/total_bituminous_mixtures_coal_tar_products_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class BituminousMixturesCoalTarProductsForm extends StatelessWidget {
  const BituminousMixturesCoalTarProductsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BituminousMixturesCoalTarProductsBloc>();

    return BlocBuilder<TotalBituminousMixturesCoalTarProductsBloc,
        TotalBituminousMixturesCoalTarProducts>(
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
              ],
              children: [
                // Row 1
                ColumnCell(initialValue: "Jätekoodi"),
                ColumnCell(
                    initialValue:
                        "Jätejakeen nimitys, jätelain mukainen pääluokka ja tarkennus"),
                ColumnCell(initialValue: "Tilavuus (m3)"),
                ColumnCell(initialValue: "Määrä-arvio (tonnia)"),
                ColumnCell(initialValue: "Huomautuksia ja lisätietoja"),

                // Row 2
                RowCell(initialValue: "17 03"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 4,
                  rowStart: 1,
                  child: RowCell(
                      initialValue:
                          "Bitumiseokset, kivihiiliterva ja -tervatuotteet",
                      centerText: true),
                ),

                // Row 3
                RowCell(initialValue: "17 03 01*"),
                OutputCell(
                    getter: () =>
                        "Bitumiseokset, jotka sisältävät kivihiilitervaa"),
                OutputCell(
                    getter: () =>
                        state.coalTarContainingBituminousMixtures.volume),
                OutputCell(
                    getter: () =>
                        state.coalTarContainingBituminousMixtures.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue:
                        state.coalTarContainingBituminousMixtures.notes,
                    setter: (value) => bloc.add(
                        CoalTarContainingBituminousMixturesNotesChanged(
                            value))),

                // Row 4
                RowCell(initialValue: "17 03 02"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeessä 17 03 01 mainitut bitumiseokset"),
                InputCell(
                    initialValue: state.otherBituminousMixtures?.volume,
                    setter: (value) =>
                        bloc.add(OtherBituminousMixturesVolumeChanged(value))),
                InputCell(
                    initialValue: state.otherBituminousMixtures?.tons,
                    setter: (value) =>
                        bloc.add(OtherBituminousMixturesTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.otherBituminousMixtures?.notes,
                    setter: (value) =>
                        bloc.add(OtherBituminousMixturesNotesChanged(value))),

                // Row 4
                RowCell(initialValue: "179/2012 39"),
                OutputCell(getter: () => ""),
                InputCell(
                    initialValue: state.unnamed?.volume,
                    setter: (value) => bloc.add(UnnamedVolumeChanged(value))),
                InputCell(
                    initialValue: state.unnamed?.tons,
                    setter: (value) => bloc.add(UnnamedTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.unnamed?.notes,
                    setter: (value) => bloc.add(UnnamedNotesChanged(value))),

                // Row 5
                RowCell(initialValue: "17 03 03*"),
                OutputCell(getter: () => "Kivihiiliterva ja -tervatuotteet"),
                InputCell(
                    initialValue: state.coalTarAndTarProducts?.volume,
                    setter: (value) =>
                        bloc.add(CoalTarAndTarProductsVolumeChanged(value))),
                InputCell(
                    initialValue: state.coalTarAndTarProducts?.tons,
                    setter: (value) =>
                        bloc.add(CoalTarAndTarProductsTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.coalTarAndTarProducts?.notes,
                    setter: (value) =>
                        bloc.add(CoalTarAndTarProductsNotesChanged(value))),
              ],
            )
          ],
        );
      },
    );
  }
}
