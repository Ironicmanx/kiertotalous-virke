import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/total_roofs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_roofs_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RoofsForm extends StatelessWidget {
  const RoofsForm({super.key});

  /// Converts RoofType enum values to display names
  /// and returns them as a list of DropdownMenuItems.
  List<DropdownMenuItem<RoofType?>> _roofTypeToList() {
    return [
      DropdownMenuItem<RoofType?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...RoofType.values.map((type) {
        return DropdownMenuItem<RoofType?>(
          value: type,
          child: Text(_roofTypeToString(type)),
        );
      }),
    ];
  }

  /// Converts WaterRoofType enum values to display names
  /// and returns them as a list of DropdownMenuItems.
  List<DropdownMenuItem<WaterRoofType?>> _waterRoofTypeToList() {
    return [
      DropdownMenuItem<WaterRoofType?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...WaterRoofType.values.map((type) {
        return DropdownMenuItem<WaterRoofType?>(
          value: type,
          child: Text(_waterRoofTypeToString(type)),
        );
      }),
    ];
  }

  /// Converts RoofType enum to a user-friendly display name.
  String _roofTypeToString(RoofType type) {
    switch (type) {
      case RoofType.woodenTruss:
        return 'Puuristikko';
      case RoofType.steelTruss:
        return 'Teräsristikko';
      case RoofType.concreteBeam:
        return 'Betonipalkki';
    }
  }

  /// Converts WaterRoofType enum to a user-friendly display name.
  String _waterRoofTypeToString(WaterRoofType type) {
    switch (type) {
      case WaterRoofType.metalRoof:
        return 'Peltikatto';
      case WaterRoofType.roofingFelt:
        return 'Kattohuopa';
      case WaterRoofType.mineriteRoof:
        return 'Mineriittikate';
      case WaterRoofType.tiledRoof:
        return 'Tiilikate';
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalRoofsBloc = context.read<TotalRoofsBloc>();

    return BlocBuilder<TotalRoofsBloc, TotalRoofs>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(
              text: 'Katon pinta-ala',
            ),
            LayoutGrid(
              columnSizes: [
                400.px,
                170.px,
                170.px,
              ],
              rowSizes: [
                140.px,
                100.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
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
              children: <Cell>[
                Cell.row(
                  initialValue:
                      'Todellinen, mitatun tai piirustuksen mukainen kattopinta-ala (m2), TAI pohjanalanmukainen oletusmitoitus',
                  iconButton:
                      InfoButton(text: TooltipTexts.outerSheath.roof.area),
                  checkbox: true,
                  checkboxSetter: (value) => totalRoofsBloc.add(
                    RoofsChanged(
                      state.roofs!.copyWith(
                        useDefaultDimensions: value,
                      ),
                    ),
                  ),
                  checkboxTitle: 'Käytä oletusmitoitusta',
                  checkboxValue: state.roofs?.useDefaultDimensions,
                ),
                Cell.input(
                  initialValue: state.roofs?.ceilingArea,
                  enabled: !(state.roofs?.useDefaultDimensions)!,
                  setter: (value) => totalRoofsBloc.add(
                    RoofsChanged(
                      state.roofs!.copyWith(
                        ceilingArea: value,
                      ),
                    ),
                  ),
                ),
                Cell.empty(),
                Cell.header(
                  initialValue: 'Kattotyyppi',
                ),
                Cell.column(
                  initialValue: 'Pinta-ala (m2)',
                  iconButton: InfoButton(
                      text: TooltipTexts.outerSheath.roof.areaDefault),
                ),
                Cell.column(
                  initialValue: 'Kattotyypin osuus koko kattopinta-alasta (%)',
                  iconButton: InfoButton(
                      text: TooltipTexts
                          .outerSheath.roof.ridgeOrGableRoofPortion),
                ),
                Cell.row(
                  initialValue: 'Harja-/aumakatto',
                ),
                Cell.output(
                  getter: () => state.ridgeOrGableRoofArea,
                ),
                Cell.input(
                  percentage: true,
                  initialValue: state.roofs?.ridgeOrGableRoofPortionPercentage,
                  setter: (value) => totalRoofsBloc.add(
                    RoofsChanged(
                      state.roofs!.copyWith(
                        ridgeOrGableRoofPortionPercentage: value,
                      ),
                    ),
                  ),
                ),
                Cell.row(
                  initialValue: 'Tasa-/pulpettikatto',
                ),
                Cell.output(
                  getter: () => state.flatOrMonoPitchedRoofArea,
                ),
                Cell.output(
                  percentage: true,
                  getter: () =>
                      state.roofs?.flatOrMonoPitchedRoofPortionPercentage,
                ),
                Cell.row(
                  initialValue: 'Koko kattopinta-ala (m2)',
                ),
                Cell.output(
                  getter: () => state.calculatedCeilingArea,
                ),
                Cell.empty(),
                Cell.header(
                  initialValue: 'Rakenne ja materiaalit',
                ),
                Cell.menu(
                  setter: (value) => totalRoofsBloc.add(RoofsChanged(
                      state.roofs!.copyWith(ridgeOrGableRoofType: value))),
                  initialValue: state.roofs?.ridgeOrGableRoofType,
                  items: _roofTypeToList(),
                ),
                Cell.menu(
                  setter: (value) {
                    totalRoofsBloc.add(RoofsChanged(state.roofs!
                        .copyWith(flatOrMonoPitchedRoofType: value)));
                  },
                  initialValue: state.roofs?.flatOrMonoPitchedRoofType,
                  items: _roofTypeToList(),
                ),
                Cell.row(
                  initialValue: 'Vesikatto',
                  checkbox: true,
                  checkboxSetter: (value) => totalRoofsBloc.add(
                    RoofsChanged(
                      state.roofs!.copyWith(
                        roofTrussesAreRecyclable: value,
                      ),
                    ),
                  ),
                  checkboxTitle: 'Kattoristikot kierrätettävissä',
                  checkboxValue: state.roofs?.roofTrussesAreRecyclable,
                ),
                Cell.menu(
                  setter: (value) => totalRoofsBloc.add(
                    RoofsChanged(
                      state.roofs!.copyWith(ridgeOrGableWaterRoofType: value),
                    ),
                  ),
                  initialValue: state.roofs?.ridgeOrGableWaterRoofType,
                  items: _waterRoofTypeToList(),
                ),
                Cell.menu(
                  setter: (value) => totalRoofsBloc.add(
                    TotalRoofsChanged(
                      state.copyWith.roofs!
                          .call(flatOrMonoPitchedWaterRoofType: value),
                    ),
                  ),
                  initialValue: state.roofs?.flatOrMonoPitchedWaterRoofType,
                  items: _waterRoofTypeToList(),
                ),
                Cell.header(
                  initialValue: 'Katon purkumateriaalimäärät',
                ),
                Cell.column(
                  initialValue: 'm3',
                ),
                Cell.column(
                  initialValue: 'Tonnia',
                ),
                Cell.row(
                  initialValue:
                      'Puuta (kattoristikot, aluslaudoitus ja kannattimet)',
                  iconButton: InfoButton(
                      text: TooltipTexts
                          .outerSheath.roof.demolitionMaterialCount),
                ),
                Cell.output(
                  getter: () => state.woodVolume,
                ),
                Cell.output(
                  getter: () => state.woodTons,
                ),
                Cell.row(
                  initialValue: 'Terästä (teräsristikot, kattopellit)',
                ),
                Cell.output(
                  // there doesn't seem to be a getter for this in TotalRoofs
                  getter: () {},
                ),
                Cell.output(
                  getter: () => state.steelTons,
                ),
                Cell.row(
                  initialValue: 'Betoni',
                ),
                Cell.output(
                  getter: () => state.concreteVolume,
                ),
                Cell.output(
                  getter: () => state.concreteTons,
                ),
                Cell.row(
                  initialValue: 'Lasi- ja mineraalieristevilla',
                ),
                Cell.output(
                  getter: () => state.insulationVolume,
                ),
                Cell.output(
                  getter: () => state.insulationTons,
                ),
                Cell.row(
                  initialValue: 'Aluskate',
                ),
                Cell.output(
                  getter: () => state.underlayVolume,
                ),
                Cell.output(
                  getter: () => state.underlayTons,
                ),
                Cell.row(
                  initialValue: 'Bitumikermikate (kattohuopa)',
                ),
                Cell.output(
                  getter: () => state.bitumenVolume,
                ),
                Cell.output(
                  getter: () => state.bitumenTons,
                ),
                Cell.row(
                  initialValue: 'Mineriittikate',
                ),
                Cell.output(
                  getter: () => state.mineriteVolume,
                ),
                Cell.output(
                  getter: () => state.mineriteTons,
                ),
                Cell.row(
                  initialValue: 'Kattotiilet',
                ),
                Cell.output(
                  getter: () => state.roofTileVolume,
                ),
                Cell.output(
                  getter: () => state.roofTileTons,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
