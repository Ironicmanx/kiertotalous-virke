import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/fixed_furniture_bloc.dart';
import 'package:flutter_app/src/lp-bloc/fixed_furniture_event.dart';
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

/// Fixed Furniture UI Form
class FixedFurnitureForm extends StatelessWidget {
  const FixedFurnitureForm({super.key});

  @override
  Widget build(BuildContext context) {
    final fixedFurnitureBloc = context.read<FixedFurnitureBloc>();

    return BlocBuilder<FixedFurnitureBloc, FixedFurniture>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: "Kalustetyyppi ja määrät"),

            // First grid: 2 columns, 14 rows
            LayoutGrid(
              columnSizes: [400.px, 150.px],
              rowSizes: List.filled(14, 50.px),
              children: [
                RowCell(
                  initialValue: "Kalustetyyppi",
                  checkbox: true,
                  checkboxTitle: "Kalusteet ovat uudelleenkäytettäviä",
                  checkboxValue: state.isFurnitureRecyclable,
                  checkboxSetter: (value) => fixedFurnitureBloc.add(
                    FixedFurnitureRecyclableChanged(value),
                  ),
                ),
                ColumnCell(initialValue: "Määrä (kpl/jm/m2)"),
                //2
                RowCell(initialValue: "WC-istuimet"),
                InputCell(
                  initialValue: state.porcelainToilets,
                  integer: true,
                  setter: (value) => fixedFurnitureBloc.add(
                    PorcelainToiletsChanged(value),
                  ),
                ),
                //3
                RowCell(initialValue: "Posliinialtaat"),
                InputCell(
                  initialValue: state.porcelainSinks,
                  integer: true,
                  setter: (value) =>
                      fixedFurnitureBloc.add(PorcelainSinksChanged(value)),
                ),
                //4
                RowCell(initialValue: "Teräspöydät"),
                InputCell(
                  initialValue: state.steelTables,
                  integer: true,
                  setter: (value) =>
                      fixedFurnitureBloc.add(SteelTablesChanged(value)),
                ),
                //5
                RowCell(initialValue: "Kaapistot ja säilytystilat"),
                GreyCell(),
                //6
                RowCell(
                  initialValue: "Keittiökaapistot (lastulevy/puu)",
                  iconButton: InfoButton(
                    text: TooltipTexts
                        .partitionWallsDoorsAndWindows
                        .fixedFurnitureTooltipTexts
                        .chipboardOrWoodenKitchenCabinets,
                  ),
                ),
                InputCell(
                  initialValue: state.kitchenClosetsWoodOrChipboard,
                  integer: true,
                  setter: (value) =>
                      fixedFurnitureBloc.add(KitchenClosetsChanged(value)),
                ),
                //7
                RowCell(initialValue: "Pukukaapit (teräs)"),
                InputCell(
                  initialValue: state.steelLockerCabinets,
                  integer: true,
                  setter: (value) => fixedFurnitureBloc.add(
                    SteelLockerCabinetsChanged(value),
                  ),
                ),
                //8
                RowCell(
                  initialValue: "Vaatekaapit, ym. (puulevy)",
                  iconButton: InfoButton(
                    text: TooltipTexts.partitionWallsDoorsAndWindows
                        .fixedFurnitureTooltipTexts.woodPanelClosets,
                  ),
                ),
                InputCell(
                  initialValue: state.clothingOrOtherClosetsWood,
                  integer: true,
                  setter: (value) =>
                      fixedFurnitureBloc.add(ClothingClosetsChanged(value)),
                ),
                //9
                RowCell(initialValue: "Sähkölaitteet"),
                GreyCell(),
                //10
                RowCell(initialValue: "Sähköliedet (tauko/kahvitilat)"),
                InputCell(
                  initialValue: state.electricStoves,
                  integer: true,
                  setter: (value) =>
                      fixedFurnitureBloc.add(ElectricStovesChanged(value)),
                ),
                //11
                RowCell(initialValue: "Suurtalous sähköliedet"),
                InputCell(
                  initialValue: state.industrialElectricStoves,
                  integer: true,
                  setter: (value) => fixedFurnitureBloc.add(
                    IndustrialElectricStovesChanged(value),
                  ),
                ),
                //12
                RowCell(initialValue: "Kylmiökaapit"),
                InputCell(
                  initialValue: state.coldRoomCabinets,
                  integer: true,
                  setter: (value) => fixedFurnitureBloc.add(
                    ColdRoomCabinetsChanged(value),
                  ),
                ),
                //13
                RowCell(initialValue: "Jääkaapit"),
                InputCell(
                  initialValue: state.refrigerators,
                  integer: true,
                  setter: (value) =>
                      fixedFurnitureBloc.add(RefrigeratorsChanged(value)),
                ),
                //14
                RowCell(initialValue: "Saunakiukaat"),
                InputCell(
                  initialValue: state.saunaStoves,
                  integer: true,
                  setter: (value) =>
                      fixedFurnitureBloc.add(SaunaStovesChanged(value)),
                ),
              ],
            ),

            SizedBox(height: 20), // Space before next grid
            FormHeader(text: 'Kalusteiden materiaalimäärät'),

            // Second grid: 3 columns, 6 rows
            LayoutGrid(
              columnSizes: [150.px, 150.px, 150.px],
              rowSizes: List.filled(6, 50.px),
              children: [
                ColumnCell(initialValue: "Materiaali"),
                ColumnCell(initialValue: "Materiaalimäärä yhteensä (m3)"),
                ColumnCell(initialValue: "Materiaalimäärä yhteensä (tonnia)"),
                //2
                RowCell(initialValue: "Keramiikka"),
                OutputCell(getter: () => state.ceramicVolume),
                OutputCell(getter: () => state.ceramicTons),
                //3
                RowCell(initialValue: "RST-teräs"),
                GreyCell(),
                OutputCell(getter: () => state.stainlessSteelTons),
                //4
                RowCell(initialValue: "Teräs"),
                GreyCell(),
                OutputCell(getter: () => state.steelTons),
                //5
                RowCell(initialValue: "Lastulevy"),
                OutputCell(getter: () => state.chipboardVolume),
                OutputCell(getter: () => state.chipboardTons),
                //6
                RowCell(initialValue: "Sähköromu"),
                GreyCell(),
                OutputCell(getter: () => state.electricScrapTons),
              ],
            ),
          ],
        );
      },
    );
  }
}
