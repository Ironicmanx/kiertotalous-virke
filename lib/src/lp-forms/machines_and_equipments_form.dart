import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/machines_and_equipments_bloc.dart';
import 'package:flutter_app/src/lp-bloc/machines_and_equipments_event.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// Machines and Equipments UI Form
class MachinesAndEquipmentsForm extends StatelessWidget {
  const MachinesAndEquipmentsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final machinesAndEquipmentsBloc = context.read<MachinesAndEquipmentsBloc>();

    return BlocBuilder<MachinesAndEquipmentsBloc, MachinesAndEquipments>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: "Koneet ja laitteet"),
            //Grid: 5 columns, 9 rows
            LayoutGrid(
              columnSizes: [300.px, 150.px, 150.px, 150.px, 150.px],
              rowSizes: [
                50.px,
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
                RowCell(
                  checkbox: true,
                  checkboxTitle: "Laitteet ovat uudelleenkäytettäviä",
                  checkboxValue: state.machinesRecyclable,
                  checkboxSetter:
                      (value) => machinesAndEquipmentsBloc.add(
                        MachinesRecyclableChanged(value),
                      ),
                ),
                ColumnCell(initialValue: "Oletuspaino (kg/kpl)"),
                ColumnCell(
                  initialValue: "kg/kpl",
                  iconButton: InfoButton(
                    text:
                        TooltipTexts
                            .hvacAndElectricalInstallations
                            .machineDetailedWeight,
                  ),
                ),
                ColumnCell(initialValue: "Määrä (kpl)"),
                ColumnCell(initialValue: "Tonnia"),
                RowCell(initialValue: "Vesivaraajat (sähkö, pienet)"),
                ColumnCell(initialValue: "100"),
                InputCell(
                  initialValue:
                      state.smallElectricalAccumulators?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        SmallElectricalWaterAccumulatorsWeightChanged(value),
                      ),
                ),
                InputCell(
                  initialValue: state.smallElectricalAccumulators?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        SmallElectricalWaterAccumulatorsQuantityChanged(value),
                      ),
                  integer: true,
                ),
                OutputCell(
                  getter: () => state.smallElectricalAccumulators?.tons,
                ),
                RowCell(
                  initialValue:
                      "Vesivaraajat, suuret (sähkö, kaukolämpö 500-100L)",
                ),
                ColumnCell(initialValue: "400"),
                InputCell(
                  initialValue:
                      state.largeElectricalAccumulators?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        LargeElectricalWaterAccumulatorsWeightChanged(value),
                      ),
                ),
                InputCell(
                  initialValue: state.largeElectricalAccumulators?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        LargeElectricalWaterAccumulatorsQuantityChanged(value),
                      ),
                  integer: true,
                ),
                OutputCell(
                  getter: () => state.largeElectricalAccumulators?.tons,
                ),
                RowCell(initialValue: "Lämpöpatterit (sähkö)"),
                ColumnCell(initialValue: "8"),
                InputCell(
                  initialValue: state.electricRadiators?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        ElectricRadiatorsWeightChanged(value),
                      ),
                ),
                InputCell(
                  initialValue: state.electricRadiators?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        ElectricRadiatorsQuantityChanged(value),
                      ),
                  integer: true,
                ),
                OutputCell(getter: () => state.electricRadiators?.tons),
                RowCell(initialValue: "Lämpöpatterit (vesikiertoinen)"),
                ColumnCell(initialValue: "15"),
                InputCell(
                  initialValue:
                      state.waterCirculatedRadiators?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        WaterCirculatedRadiatorsWeightChanged(value),
                      ),
                ),
                InputCell(
                  initialValue: state.waterCirculatedRadiators?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        WaterCirculatedRadiatorsQuantityChanged(value),
                      ),
                  integer: true,
                ),
                OutputCell(getter: () => state.waterCirculatedRadiators?.tons),
                RowCell(initialValue: "Ilmanvaihtokoneet"),
                ColumnCell(initialValue: "100"),
                InputCell(
                  initialValue: state.ventilationUnits?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        VentilationUnitsWeightChanged(value),
                      ),
                ),
                InputCell(
                  initialValue: state.ventilationUnits?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        VentilationUnitsQuantityChanged(value),
                      ),
                  integer: true,
                ),
                OutputCell(getter: () => state.ventilationUnits?.tons),
                RowCell(initialValue: "Sähkönjakokaapit ja mittarit"),
                ColumnCell(initialValue: "20"),
                InputCell(
                  initialValue:
                      state
                          .electricalDistributionCabinetsAndMeters
                          ?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        ElectricalDistributionCabinetsAndMetersWeightChanged(
                          value,
                        ),
                      ),
                ),
                InputCell(
                  initialValue:
                      state.electricalDistributionCabinetsAndMeters?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        ElectricalDistributionCabinetsAndMetersQuantityChanged(
                          value,
                        ),
                      ),
                  integer: true,
                ),
                OutputCell(
                  getter:
                      () => state.electricalDistributionCabinetsAndMeters?.tons,
                ),
                RowCell(initialValue: "Sähkömoottorit ja kiertovesipumput"),
                ColumnCell(initialValue: "25"),
                InputCell(
                  initialValue:
                      state.electricMotorsAndCirculationPumps?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        ElectricMotorsAndCirculationPumpsWeightChanged(value),
                      ),
                ),
                InputCell(
                  initialValue:
                      state.electricMotorsAndCirculationPumps?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        ElectricMotorsAndCirculationPumpsQuantityChanged(value),
                      ),
                  integer: true,
                ),
                OutputCell(
                  getter: () => state.electricMotorsAndCirculationPumps?.tons,
                ),
                RowCell(initialValue: "Huippuimurit"),
                ColumnCell(initialValue: "15"),
                InputCell(
                  initialValue: state.roofExhaustFans?.weightKgPerPiece,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        RoofExhaustFansWeightChanged(value),
                      ),
                ),
                InputCell(
                  initialValue: state.roofExhaustFans?.quantity,
                  setter:
                      (value) => machinesAndEquipmentsBloc.add(
                        RoofExhaustFansQuantityChanged(value),
                      ),
                  integer: true,
                ),
                OutputCell(getter: () => state.roofExhaustFans?.tons),
              ],
            ),
          ],
        );
      },
    );
  }
}
