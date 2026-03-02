import 'package:flutter/material.dart';

import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/sp-bloc/total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class SmallPropertiesTotalDemolitionWasteAndCostsForm extends StatelessWidget {
  const SmallPropertiesTotalDemolitionWasteAndCostsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmallPropertiesTotalDemolitionWasteAndCostsBloc,
        SmallPropertiesTotalDemolitionWasteAndCosts>(builder: (context, state) {
      return LayoutGrid(
        columnSizes: [230.px, 200.px],
        rowSizes: [
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
          50.px,
        ],
        children: [
          RowCell(initialValue: "Kokonaispurkujätemäärä (tonnia)"),
          OutputCell(getter: () => state.totalTons),
          RowCell(initialValue: "Purkukustannusarvio (€)"),
          OutputCell(getter: () => state.estimatedDemolitionCost),
          RowCell(initialValue: "Purkukustannus/neliö (€/m2)"),
          OutputCell(getter: () => state.demolitionCostPerSquareMeter),
          RowCell(initialValue: "Purkukustannus/kuutio (€/m3)"),
          OutputCell(getter: () => state.demolitionCostPerCubicMeter),
          RowCell(initialValue: "Myytävät materiaalierät"),
          OutputCell(getter: () => state.sellableMaterialBatchesPrice),
        ],
      );
    });
  }
}
