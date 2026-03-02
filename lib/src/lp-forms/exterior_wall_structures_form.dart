import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/light_grey_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class OuterWallsForm extends StatelessWidget {
  const OuterWallsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final totalBuildingFrameBloc = context.read<TotalBuildingFrameBloc>();
    return BlocBuilder<TotalBuildingFrameBloc, TotalBuildingFrame>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exterior Wall Structures Form
          SizedBox(height: 50), // Space before next grid

          FormHeader(text: 'Ulkoseinärakenteiden osuus ja pinta-ala'),
          LayoutGrid(
            columnSizes: [
              150.px,
              100.px,
              100.px,
              100.px,
              100.px,
              100.px,
              100.px,
              100.px,
              100.px,
              100.px,
            ],
            rowSizes: [
              75.px,
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
            // List.filled(14, 50.px),
            children: [
              Cell.header(initialValue: 'Seinärakenne'),
              Cell.column(initialValue: 'Kaksinkertainen tiiliseinä'),
              Cell.column(initialValue: 'Betonielementtiseinä'),
              Cell.column(initialValue: 'Tiiliverhoiltu seinä'),
              Cell.column(initialValue: 'Lautaseinä'),
              Cell.column(initialValue: 'Profiilipelti'),
              Cell.column(initialValue: 'Teräsprofiili sandwichrakenne'),
              Cell.column(initialValue: 'Mineriitti tai muu kivilevy'),
              Cell.column(initialValue: 'Yhteensä'),
              Cell.empty(),
              Cell.row(
                initialValue: 'Rakenteen osuus koko ulkoseinistä (%)',
              ),
              Cell.output(
                percentage: true,
                getter: () =>
                    state.doubleLoadBearingBrickWallPart.portionPercentage,
              ),
              Cell.output(
                percentage: true,
                getter: () => state
                    .concreteElementWallsWithoutFrameworkPart.portionPercentage,
              ),
              Cell.input(
                initialValue:
                    state.buildingFrame?.brickCladWallPortionPercentage,
                percentage: true,
                setter: (value) => totalBuildingFrameBloc.add(
                  BuildingFrameChanged(
                    state.buildingFrame!
                        // TODO: unsure about this one, shouldn't it be brickVeneerWallPortionPercentage?
                        .copyWith(brickCladWallPortionPercentage: value),
                  ),
                ),
              ),
              Cell.input(
                initialValue: state.buildingFrame?.boardWallPortionPercentage,
                percentage: true,
                setter: (value) => totalBuildingFrameBloc.add(
                  BuildingFrameChanged(
                    state.buildingFrame!
                        .copyWith(boardWallPortionPercentage: value),
                  ),
                ),
              ),
              Cell.input(
                initialValue:
                    state.buildingFrame?.profiledSheetMetalPortionPercentage,
                percentage: true,
                setter: (value) => totalBuildingFrameBloc.add(
                  BuildingFrameChanged(
                    state.buildingFrame!
                        .copyWith(profiledSheetMetalPortionPercentage: value),
                  ),
                ),
              ),
              Cell.input(
                initialValue: state.buildingFrame
                    ?.steelProfileSandwichStructurePortionPercentage,
                percentage: true,
                setter: (value) => totalBuildingFrameBloc.add(
                  BuildingFrameChanged(
                    state.buildingFrame!.copyWith(
                        steelProfileSandwichStructurePortionPercentage: value),
                  ),
                ),
              ),
              Cell.input(
                initialValue: state
                    .buildingFrame?.mineriteOrOtherStoneBoardPortionPercentage,
                percentage: true,
                setter: (value) => totalBuildingFrameBloc.add(
                  BuildingFrameChanged(
                    state.buildingFrame!.copyWith(
                        mineriteOrOtherStoneBoardPortionPercentage: value),
                  ),
                ),
              ),
              Cell.output(
                percentage: true,
                getter: () => state.totalEnvelopePartsPortionPercentage,
              ),
              Cell.empty(),
              Cell.row(initialValue: 'Pinta-ala (m2)'),
              Cell.output(
                getter: () => state.doubleLoadBearingBrickWallPart.area,
              ),
              Cell.output(
                getter: () =>
                    state.concreteElementWallsWithoutFrameworkPart.area,
              ),
              Cell.output(
                getter: () => state.brickVeneerWallFramePart.area,
              ),
              Cell.output(
                getter: () => state.woodenPlankWallFramePart.area,
              ),
              Cell.output(
                getter: () => state.profiledSheetMetalFramePart.area,
              ),
              Cell.output(
                getter: () => state.steelSandwichPanelFramePart.area,
              ),
              Cell.output(
                getter: () => state.mineriteOrOtherStoneFramePart.area,
              ),
              Cell.output(
                getter: () => state.totalEnvelopePartsArea,
              ),
              Cell.empty(),

              // second part of the form
              Cell.header(initialValue: 'Purkumateriaalien määrä'),
              LightGreyCell(),
              LightGreyCell(),
              LightGreyCell(),
              LightGreyCell(),
              LightGreyCell(),
              LightGreyCell(),
              LightGreyCell(),
              Cell.column(initialValue: 'Yhteensä (m3)'),
              Cell.column(initialValue: 'Yhteensä (tonnia)'),
              Cell.row(initialValue: 'Tuulensuojalevy (bituliitti, tms.)'),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                getter: () =>
                    state.brickVeneerWallFramePart.windProtectionBoardTons,
              ),
              Cell.output(
                getter: () =>
                    state.woodenPlankWallFramePart.windProtectionBoardTons,
              ),
              Cell.output(
                getter: () =>
                    state.profiledSheetMetalFramePart.windProtectionBoardTons,
              ),
              Cell.grey(),
              Cell.grey(),
              Cell.output(getter: () => state.windProtectionBoardVolume),
              Cell.output(getter: () => state.windProtectionBoardTons),
              Cell.row(initialValue: 'Mineraalivilla'),
              Cell.output(
                  getter: () => state.doubleLoadBearingBrickWallPart
                      .mineralWoolInsulationTons),
              Cell.output(
                getter: () => state.concreteElementWallsWithoutFrameworkPart
                    .mineralWoolInsulationTons,
              ),
              Cell.output(
                getter: () =>
                    state.brickVeneerWallFramePart.mineralWoolInsulationTons,
              ),
              Cell.output(
                getter: () =>
                    state.woodenPlankWallFramePart.mineralWoolInsulationTons,
              ),
              Cell.output(
                getter: () =>
                    state.profiledSheetMetalFramePart.mineralWoolInsulationTons,
              ),
              Cell.output(
                getter: () =>
                    state.steelSandwichPanelFramePart.mineralWoolInsulationTons,
              ),
              Cell.output(
                getter: () => state
                    .mineriteOrOtherStoneFramePart.mineralWoolInsulationTons,
              ),
              Cell.output(getter: () => state.mineralWoolInsulationVolume),
              Cell.output(getter: () => state.mineralWoolInsulationTons),
              Cell.row(initialValue: '130mm kalkki- tai punatiili'),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                getter: () => state.brickVeneerWallFramePart.limeOrRedBrickTons,
              ),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(getter: () => state.limeOrRedBrickVolume),
              Cell.output(getter: () => state.limeOrRedBrickTons),
              Cell.row(initialValue: '20m ulkoverhouslauta'),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                getter: () =>
                    state.woodenPlankWallFramePart.exteriorWoodCladdingTons,
              ),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(getter: () => state.exteriorWoodCladdingVolume),
              Cell.output(getter: () => state.exteriorWoodCladdingTons),
              Cell.row(initialValue: '11mm kipsilevy'),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                getter: () => state.brickVeneerWallFramePart.gypsumBoardTons,
              ),
              Cell.output(
                getter: () => state.woodenPlankWallFramePart.gypsumBoardTons,
              ),
              Cell.output(
                getter: () => state.profiledSheetMetalFramePart.gypsumBoardTons,
              ),
              Cell.output(
                getter: () => state.steelSandwichPanelFramePart.gypsumBoardTons,
              ),
              Cell.grey(),
              Cell.output(getter: () => state.gypsumBoardVolume),
              Cell.output(getter: () => state.gypsumBoardTons),
              Cell.row(initialValue: 'Profiilipelti (teräs)'),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                getter: () =>
                    state.profiledSheetMetalFramePart.profileSteelSheetTons,
              ),
              Cell.grey(),
              Cell.grey(),
              Cell.output(getter: () => state.profileSteelSheetVolume),
              Cell.output(getter: () => state.profileSteelSheetTons),
              Cell.row(initialValue: 'Puolikova kuitulevy'),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                getter: () =>
                    state.mineriteOrOtherStoneFramePart.semiHardFiberBoardTons,
              ),
              Cell.output(getter: () => state.semiHardFiberBoardVolume),
              Cell.output(getter: () => state.semiHardFiberBoardTons),
              Cell.row(initialValue: 'Styrox'),
              Cell.grey(),
              Cell.output(
                getter: () => state
                    .concreteElementWallsWithoutFrameworkPart.styrofoamTons,
              ),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                  getter: () =>
                      state.steelSandwichPanelFramePart.styrofoamTons),
              Cell.grey(),
              Cell.output(getter: () => state.styrofoamVolume),
              Cell.output(getter: () => state.styrofoamTons),
              Cell.row(initialValue: 'Rappaus, sisä- ja ulkoseinät'),
              Cell.output(
                getter: () =>
                    state.doubleLoadBearingBrickWallPart.plasterCoatingTons,
              ),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(getter: () => state.plasterCoatingVolume),
              Cell.output(getter: () => state.plasterCoatingTons),
              Cell.row(initialValue: 'Mineriittilevy'),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.grey(),
              Cell.output(
                getter: () =>
                    state.mineriteOrOtherStoneFramePart.mineriteBoardTons,
              ),
              Cell.output(getter: () => state.mineriteBoardVolume),
              Cell.output(getter: () => state.mineriteBoardTons),
            ],
          ),
        ],
      );
    });
  }
}
