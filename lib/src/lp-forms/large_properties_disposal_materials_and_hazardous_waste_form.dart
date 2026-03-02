import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_disposal_materials_and_hazardous_waste_event.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_disposal_materials_and_hazardous_waste_bloc.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class LargePropertiesDisposalMaterialsAndHazardousWasteForm
    extends StatelessWidget {
  const LargePropertiesDisposalMaterialsAndHazardousWasteForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DisposalMaterialsAndHazardousWasteBloc>();

    return BlocBuilder<TotalDisposalMaterialsAndHazardousWasteBloc,
        TotalDisposalMaterialsAndHazardousWaste>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutGrid(
            columnSizes: [
              210.px,
              120.px,
              120.px,
              120.px,
              120.px,
            ],
            rowSizes: [
              75.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
            ],
            children: [
              // First row
              HeaderCell(
                  initialValue:
                      "Loppusijoitettavat materiaalit ja ongelmajätteet"),
              ColumnCell(initialValue: "Purkukustannus (€/kpl tai €/tonni)"),
              ColumnCell(initialValue: "Materiaalierän hinta (€)"),
              ColumnCell(initialValue: "Tilvauus (m3)"),
              ColumnCell(initialValue: "Määräarvio (tonnia)"),
              // Second row
              RowCell(initialValue: "Kierrätyskelvoton tiilijäte"),
              InputCell(
                initialValue:
                    state.nonRecyclableBrickWaste.demolitionOrProcessingCost,
                setter: (value) => bloc.add(
                    NonRecyclableBrickWasteDemolitionOrProcessingCostChanged(
                        value)),
              ),
              OutputCell(
                  getter: () => state.nonRecyclableBrickWaste.batchPrice),
              OutputCell(getter: () => state.nonRecyclableBrickWaste.volume),
              OutputCell(getter: () => state.nonRecyclableBrickWaste.tons),
              // Third row
              RowCell(initialValue: "Saastunut maa"),
              InputCell(
                initialValue: state.contaminatedSoil.demolitionOrProcessingCost,
                setter: (value) => bloc.add(
                    ContaminatedSoilDemolitionOrProcessingCostChanged(value)),
              ),
              OutputCell(getter: () => state.contaminatedSoil.batchPrice),
              OutputCell(getter: () => state.contaminatedSoil.volume),
              OutputCell(getter: () => state.contaminatedSoil.tons),
              // Fourth row
              RowCell(initialValue: "Asbestia tai BCP-maalia sisältävä betoni"),
              InputCell(
                initialValue:
                    state.asbestosOrBCPConcrete.demolitionOrProcessingCost,
                setter: (value) => bloc.add(
                    AsbestosOrBCPConcreteDemolitionOrProcessingCostChanged(
                        value)),
              ),
              OutputCell(getter: () => state.asbestosOrBCPConcrete.batchPrice),
              OutputCell(getter: () => state.asbestosOrBCPConcrete.volume),
              OutputCell(getter: () => state.asbestosOrBCPConcrete.tons),
              // Fifth row
              RowCell(initialValue: "Bitumi"),
              InputCell(
                initialValue: state.bitumen.demolitionOrProcessingCost,
                setter: (value) =>
                    bloc.add(BitumenDemolitionOrProcessingCostChanged(value)),
              ),
              OutputCell(getter: () => state.bitumen.batchPrice),
              OutputCell(getter: () => state.bitumen.volume),
              OutputCell(getter: () => state.bitumen.tons),
              // Sixth row
              RowCell(
                  initialValue:
                      "Mineriitti, tiilet, kattohuopa, kaakelit yms. (sis. asbestia)"),
              InputCell(
                initialValue: state
                    .otherAsbestosContainingMaterial.demolitionOrProcessingCost,
                setter: (value) => bloc.add(
                    OtherAsbestosContainingMaterialDemolitionOrProcessingCostChanged(
                        value)),
              ),
              OutputCell(
                  getter: () =>
                      state.otherAsbestosContainingMaterial.batchPrice),
              OutputCell(
                  getter: () => state.otherAsbestosContainingMaterial.volume),
              OutputCell(
                  getter: () => state.otherAsbestosContainingMaterial.tons),
              // Seventh row
              RowCell(initialValue: "Yhteensä"),
              GreyCell(),
              OutputCell(getter: () => state.totalBatchPrice),
              OutputCell(getter: () => state.totalVolume),
              OutputCell(getter: () => state.totalTons),
            ],
          ),
        ],
      );
    });
  }
}
