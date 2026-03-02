import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/other_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/other_materials_event.dart';
import 'package:flutter_app/src/lp-bloc/total_other_materials_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/input_text_row_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class OtherMaterialsForm extends StatelessWidget {
  const OtherMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OtherMaterialsBloc>();

    return BlocBuilder<TotalOtherMaterialsBloc, TotalOtherMaterials>(
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
                RowCell(initialValue: "17 09"),
                GridPlacement(
                  columnStart: 1,
                  columnSpan: 4,
                  rowStart: 1,
                  child: RowCell(
                      initialValue:
                          "Muut rakentamisessa ja purkamisessa syntyvät jätteet",
                      centerText: true),
                ),

                // Row 3
                RowCell(initialValue: "17 09 01*"),
                OutputCell(
                    getter: () =>
                        "Rakentamisessa ja purkamisessa elohopeaa sisältävät jätteet"),
                InputCell(
                    initialValue: state.mercuryContainingMaterials?.volume,
                    setter: (value) => bloc
                        .add(MercuryContainingMaterialsVolumeChanged(value))),
                InputCell(
                    initialValue: state.mercuryContainingMaterials?.tons,
                    setter: (value) =>
                        bloc.add(MercuryContainingMaterialsTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.mercuryContainingMaterials?.notes,
                    setter: (value) => bloc
                        .add(MercuryContainingMaterialsNotesChanged(value))),

                // Row 4
                RowCell(initialValue: "17 09 02*"),
                OutputCell(
                    getter: () =>
                        "PCB-yhdisteitä sisältävät purkujätteet (kuten tiivistysmassat, hartsipohjaiset lattiapäällysteet, umpiolasit, ja muuntajat)"),
                OutputCell(
                    getter: () => state.pcbContainingDemolitionWaste.volume),
                OutputCell(
                    getter: () => state.pcbContainingDemolitionWaste.tons),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.pcbContainingDemolitionWaste.notes,
                    setter: (value) => bloc
                        .add(PCBContainingDemolitionWasteNotesChanged(value))),

                // Row 5
                RowCell(initialValue: "17 09 03*"),
                OutputCell(
                    getter: () =>
                        "Muut vaarallisia aineita sisältävät jätteet (mukaan lukien sekalaiset jätteet)"),
                InputCell(
                    initialValue: state.otherHazardousDemolitionWaste?.volume,
                    setter: (value) => bloc.add(
                        OtherHazardousDemolitionWasteVolumeChanged(value))),
                InputCell(
                    initialValue: state.otherHazardousDemolitionWaste?.tons,
                    setter: (value) => bloc
                        .add(OtherHazardousDemolitionWasteTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.otherHazardousDemolitionWaste?.notes,
                    setter: (value) => bloc
                        .add(OtherHazardousDemolitionWasteNotesChanged(value))),

                // Row 6
                RowCell(initialValue: "17 09 04"),
                OutputCell(
                    getter: () =>
                        "Muut kuin nimikkeissä 17 09 01, 17 09 02 ja 17 09 03 mainitut rakentamisessa ja purkamisessa syntyvät sekalaiset jätteet"),
                InputCell(
                    initialValue: state.otherDemolitionWaste?.volume,
                    setter: (value) =>
                        bloc.add(OtherDemolitionWasteVolumeChanged(value))),
                InputCell(
                    initialValue: state.otherDemolitionWaste?.tons,
                    setter: (value) =>
                        bloc.add(OtherDemolitionWasteTonsChanged(value))),
                InputTextRowCell(
                    label: "Kirjoita tähän",
                    initialValue: state.otherDemolitionWaste?.notes,
                    setter: (value) =>
                        bloc.add(OtherDemolitionWasteNotesChanged(value))),
              ],
            )
          ],
        );
      },
    );
  }
}
