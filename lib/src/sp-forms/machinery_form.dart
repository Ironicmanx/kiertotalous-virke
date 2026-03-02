import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/header_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/sp-bloc/machinery_bloc.dart';
import 'package:flutter_app/src/sp-bloc/machinery_event.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class SPMachineryForm extends StatelessWidget {
  const SPMachineryForm({super.key});

  @override
  Widget build(BuildContext context) {
    final machineryBloc = context.read<SPMachineryBloc>();

    return BlocBuilder<SPMachineryBloc, MachineryEquipmentAndFixedStructures>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutGrid(
            columnSizes: [
              300.px,
              160.px,
              160.px,
              160.px,
            ],
            rowSizes: [
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
              50.px,
            ],
            children: [
              FormHeader(text: 'Koneet, laitteet ja kiinteät rakenteet'),
              ColumnCell(
                initialValue: 'Kpl',
              ),
              ColumnCell(
                initialValue: 'Kg',
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'Sähkömoottorit',
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxSetter: (value) => machineryBloc.add(
                  SPAreElectricMotorsRecyclableChanged(value),
                ),
                checkboxValue: state.areElectricMotorsRecyclable,
              ),
              InputCell(
                initialValue: state.electricMotors,
                setter: (value) => machineryBloc.add(
                  SPElectricMotorsChanged(value),
                ),
                integer: true,
              ),
              OutputCell(
                getter: () => state.electricMotorsWeightKg,
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'Ilmanvaihtokoneet',
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxSetter: (value) => machineryBloc.add(
                  SPAreVentilationMachinesRecyclableChanged(value),
                ),
                checkboxValue: state.areVentilationMachinesRecyclable,
              ),
              InputCell(
                initialValue: state.ventilationMachines,
                setter: (value) => machineryBloc.add(
                  SPVentilationMachinesChanged(value),
                ),
                integer: true,
              ),
              OutputCell(
                getter: () => state.ventilationMachinesWeightKg,
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'Sähkönjakokaapit ja mittarit',
              ),
              InputCell(
                initialValue: state.electricalDistributionMachinesAndMeters,
                setter: (value) => machineryBloc.add(
                  SPElectricalDistributionMachinesAndMetersChanged(value),
                ),
                integer: true,
              ),
              OutputCell(
                getter: () =>
                    state.electricalDistributionMachinesAndMetersWeightKg,
              ),
              EmptyCell(),
              RowCell(
                initialValue: 'Vesikiertoiset lämpöpatterit',
              ),
              InputCell(
                initialValue: state.waterCirculationRadiators,
                setter: (value) => machineryBloc.add(
                  SPWaterCirculationRadiatorsChanged(value),
                ),
                integer: true,
              ),
              OutputCell(
                getter: () => state.waterCirculationRadiatorsWeightKg,
              ),
              EmptyCell(),
              GreyCell(),
              GreyCell(),
              GreyCell(),
              ColumnCell(initialValue: 'Tonnia'),
              RowCell(
                initialValue: 'Betoniset pihalaatoitukset ja muurikivet (m2)',
              ),
              InputCell(
                initialValue: state.concreteYardTilesAndStonesInSquareMeters,
                setter: (value) => machineryBloc.add(
                  SPConcreteYardTilesAndStonesInSquareMetersChanged(value),
                ),
              ),
              RowCell(
                checkbox: true,
                checkboxTitle: 'Kierrätettäviä',
                checkboxSetter: (value) => machineryBloc.add(
                  SPAreConcreteYardTilesAndWallStonesRecyclableChanged(value),
                ),
                checkboxValue:
                    state.areConcreteYardTilesAndWallStonesRecyclable,
              ),
              OutputCell(
                getter: () => state.concreteYardTilesAndStonesWeightTons,
              ),
              RowCell(
                initialValue: 'Huoneistojen väliset aidat (jm)',
              ),
              InputCell(
                initialValue: state.fencesBetweenApartmentsInMeters,
                setter: (value) => machineryBloc.add(
                  SPFencesBetweenApartmentsInMetersChanged(value),
                ),
              ),
              MenuCell<FencesBetweenApartments?>(
                setter: (value) =>
                    machineryBloc.add(SPFencesBetweenApartmentsChanged(value)),
                initialValue: state.fencesBetweenApartments,
                items: fenceTypeToList(),
              ),
              OutputCell(
                getter: () => state.fencesBetweenApartmentsWeightTons,
              ),
            ],
          ),
        ],
      );
    });
  }

  //Fence type
  List<DropdownMenuItem<FencesBetweenApartments?>> fenceTypeToList() {
    return [
      DropdownMenuItem<FencesBetweenApartments?>(
        value: null,
        child: Text('Aidan tyyppi'),
      ),
      ...FencesBetweenApartments.values.map((type) {
        return DropdownMenuItem<FencesBetweenApartments?>(
          value: type,
          child: Text(fenceTypeToString(type)),
        );
      })
    ];
  }

  String fenceTypeToString(FencesBetweenApartments type) {
    switch (type) {
      case FencesBetweenApartments.woodenFence:
        return 'Lauta-aita';
      case FencesBetweenApartments.steelMeshFence:
        return 'Teräsverkko';
      case FencesBetweenApartments.aluminiumMeshFence:
        return 'Alumiiniverkko';
    }
  }
}
