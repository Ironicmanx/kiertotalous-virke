import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_event.dart';

class RoomSpaceSurfaceMaterialPercentagesForm extends StatelessWidget {
  const RoomSpaceSurfaceMaterialPercentagesForm({super.key});

  @override
  Widget build(BuildContext context) {
    final internalWallFramesAndSurfaceMaterialBloc =
        context.read<InternalWallFramesAndSurfaceMaterialBloc>();

    return BlocBuilder<InternalWallFramesAndSurfaceMaterialBloc,
        InternalWallFramesAndSurfaceMaterial>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            FormHeader(
              text:
                  'Seinien pintarakenteen osuus (%) kaikista väliseinistä (seinäpinta-alasta)',
            ),
            LayoutGrid(
              columnSizes: [
                335.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                110.px,
                120.px,
                120.px,
                120.px,
              ],
              rowSizes: [
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px
              ],
              children: [
                RowCell(
                  checkbox: true,
                  checkboxTitle: 'Pinnoite sisältää asbestia',
                  checkboxValue: state.surfaceMaterialCoatingContainsAsbestos,
                  checkboxSetter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                          SurfaceMaterialCoatingContainsAsbestosChanged(value)),
                ),
                ColumnCell(
                  initialValue: 'Toimistotilat',
                ),
                ColumnCell(
                  initialValue: 'Aulat ja muut yleiset tilat',
                ),
                ColumnCell(
                  initialValue: 'WC ja pesutilat',
                ),
                ColumnCell(
                  initialValue: 'Keittiöt',
                ),
                ColumnCell(
                  initialValue: 'Opetus-/hoitotilat (m2)',
                ),
                ColumnCell(
                  initialValue: 'Varastot ja työtilat',
                ),
                ColumnCell(
                  initialValue: 'Muut tilat',
                ),
                ColumnCell(
                  initialValue: 'Kaikki tilat yhteensä (m2)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (m3)',
                ),
                ColumnCell(
                  initialValue: 'Materiaalimäärä yhteensä (t)',
                ),
                RowCell(
                  initialValue: 'Lastulevy',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.chipboardPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(state.officeSpaces!
                        .copyWith(chipboardPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .lobbiesAndOtherCommonAreas?.chipboardPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    LobbiesAndOtherCommonAreasChanged(state
                        .lobbiesAndOtherCommonAreas!
                        .copyWith(chipboardPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.chipboardPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(chipboardPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.chipboardPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(state.kitchens!
                        .copyWith(chipboardPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .teachingAndTreatmentSpaces?.chipboardPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(chipboardPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.chipboardPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(chipboardPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.chipboardPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(state.otherSpaces!
                        .copyWith(chipboardPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalChipboardArea,
                ),
                OutputCell(
                  getter: () => state.totalChipboardVolume,
                ),
                OutputCell(
                  getter: () => state.totalChipboardTons,
                ),
                RowCell(
                  initialValue: 'Kipsilevy (Cybroc)',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.cybrocPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(state.officeSpaces!
                        .copyWith(cybrocPortionPercentage: value)),
                  ),
                ),
                InputCell(
                  initialValue:
                      state.lobbiesAndOtherCommonAreas?.cybrocPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    LobbiesAndOtherCommonAreasChanged(state
                        .lobbiesAndOtherCommonAreas!
                        .copyWith(cybrocPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .restroomsAndWashingFacilities?.cybrocPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(cybrocPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.cybrocPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(state.kitchens!
                        .copyWith(cybrocPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.teachingAndTreatmentSpaces?.cybrocPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(cybrocPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.cybrocPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(cybrocPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.cybrocPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(state.otherSpaces!
                        .copyWith(cybrocPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalCybrocArea,
                ),
                OutputCell(
                  getter: () => state.totalCybrocVolume,
                ),
                OutputCell(
                  getter: () => state.totalCybrocTons,
                ),
                RowCell(
                  initialValue: 'Lautapaneeli',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.boardPanelPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(state.officeSpaces!
                        .copyWith(boardPanelPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .lobbiesAndOtherCommonAreas?.boardPanelPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    LobbiesAndOtherCommonAreasChanged(state
                        .lobbiesAndOtherCommonAreas!
                        .copyWith(boardPanelPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.boardPanelPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(boardPanelPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.boardPanelPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(state.kitchens!
                        .copyWith(boardPanelPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .teachingAndTreatmentSpaces?.boardPanelPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(boardPanelPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.boardPanelPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(boardPanelPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.otherSpaces?.boardPanelPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(state.otherSpaces!
                        .copyWith(boardPanelPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalBoardPanelArea,
                ),
                OutputCell(
                  getter: () => state.totalBoardPanelVolume,
                ),
                OutputCell(
                  getter: () => state.totalBoardPanelTons,
                ),
                RowCell(
                  initialValue: 'Kaakeliseinä',
                ),
                InputCell(
                  initialValue:
                      state.officeSpaces?.ceramicTileWallsPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(state.officeSpaces!
                        .copyWith(ceramicTileWallsPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas
                      ?.ceramicTileWallsPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    LobbiesAndOtherCommonAreasChanged(state
                        .lobbiesAndOtherCommonAreas!
                        .copyWith(ceramicTileWallsPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.ceramicTileWallsPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(ceramicTileWallsPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.kitchens?.ceramicTileWallsPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(state.kitchens!
                        .copyWith(ceramicTileWallsPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces
                      ?.ceramicTileWallsPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(ceramicTileWallsPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .storageAndWorkspaces?.ceramicTileWallsPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(ceramicTileWallsPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.otherSpaces?.ceramicTileWallsPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(state.otherSpaces!
                        .copyWith(ceramicTileWallsPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalCeramicTileWallsArea,
                ),
                OutputCell(
                  getter: () => state.totalCeramicTileWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalCeramicTileWallsTons,
                ),
                RowCell(
                  initialValue: 'Maalattu rapattu tiiliseinä',
                ),
                InputCell(
                  initialValue: state
                      .officeSpaces?.paintedPlasteredBrickWallPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(state.officeSpaces!.copyWith(
                        paintedPlasteredBrickWallPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas
                      ?.paintedPlasteredBrickWallPortionPercentage,
                  setter: (value) => internalWallFramesAndSurfaceMaterialBloc
                      .add(LobbiesAndOtherCommonAreasChanged(
                          state.lobbiesAndOtherCommonAreas!.copyWith(
                              paintedPlasteredBrickWallPortionPercentage:
                                  value))),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.paintedPlasteredBrickWallPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(
                        state.restroomsAndWashingFacilities!.copyWith(
                            paintedPlasteredBrickWallPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .kitchens?.paintedPlasteredBrickWallPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(state.kitchens!.copyWith(
                        paintedPlasteredBrickWallPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces
                      ?.paintedPlasteredBrickWallPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(
                        state.teachingAndTreatmentSpaces!.copyWith(
                            paintedPlasteredBrickWallPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces
                      ?.paintedPlasteredBrickWallPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(
                            paintedPlasteredBrickWallPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .otherSpaces?.paintedPlasteredBrickWallPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(state.otherSpaces!.copyWith(
                        paintedPlasteredBrickWallPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalPaintedPlasteredBrickWallArea,
                ),
                OutputCell(
                    getter: () => state.totalPaintedPlasteredBrickWallVolume),
                OutputCell(
                    getter: () => state.totalPaintedPlasteredBrickWallTons),
                RowCell(
                  initialValue: 'Muovimatto',
                ),
                InputCell(
                  initialValue:
                      state.officeSpaces?.plasticCarpetPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(state.officeSpaces!
                        .copyWith(plasticCarpetPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas
                      ?.plasticCarpetPortionPercentage,
                  setter: (value) => internalWallFramesAndSurfaceMaterialBloc
                      .add(LobbiesAndOtherCommonAreasChanged(state
                          .lobbiesAndOtherCommonAreas!
                          .copyWith(plasticCarpetPortionPercentage: value))),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.plasticCarpetPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(plasticCarpetPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.kitchens?.plasticCarpetPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(state.kitchens!
                        .copyWith(plasticCarpetPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces
                      ?.plasticCarpetPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(plasticCarpetPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue: state
                      .storageAndWorkspaces?.plasticCarpetPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(plasticCarpetPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                InputCell(
                  initialValue:
                      state.otherSpaces?.plasticCarpetPortionPercentage,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(state.otherSpaces!
                        .copyWith(plasticCarpetPortionPercentage: value)),
                  ),
                  percentage: true,
                ),
                OutputCell(getter: () => state.totalPlasticCarpetArea),
                OutputCell(getter: () => state.totalPlasticCarpetVolume),
                OutputCell(getter: () => state.totalPlasticCarpetTons),
                RowCell(
                  initialValue: 'Väliseinien rakenteet yhteensä (%)',
                ),
                OutputCell(
                  getter: () => state.officeSpaces
                      ?.totalPartitionWallsStructuresPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.lobbiesAndOtherCommonAreas
                      ?.totalPartitionWallsStructuresPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.restroomsAndWashingFacilities
                      ?.totalPartitionWallsStructuresPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .kitchens?.totalPartitionWallsStructuresPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.teachingAndTreatmentSpaces
                      ?.totalPartitionWallsStructuresPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.storageAndWorkspaces
                      ?.totalPartitionWallsStructuresPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.otherSpaces
                      ?.totalPartitionWallsStructuresPortionPercentage,
                  percentage: true,
                ),
                OutputCell(getter: () => state.totalSpacesWallArea),
                GreyCell(),
                GreyCell(),
              ],
            ),
          ],
        ),
      );
    });
  }
}
