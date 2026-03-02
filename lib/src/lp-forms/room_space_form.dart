import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_bloc.dart';
import 'package:flutter_app/src/lp-bloc/internal_wall_frames_and_surface_material_event.dart';

class RoomSpaceForm extends StatelessWidget {
  const RoomSpaceForm({super.key});

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
                  'Erilaiset tilat kuten toimistot, aulat, luokkahuoneet, asuintilat ja muut vastaavat huoneet',
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
              ],
              children: [
                EmptyCell(),
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
                  initialValue: 'Puurunkoiset seinät (jm)',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.woodFramedWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(
                        state.officeSpaces!.copyWith(woodFramedWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue:
                      state.lobbiesAndOtherCommonAreas?.woodFramedWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    LobbiesAndOtherCommonAreasChanged(state
                        .lobbiesAndOtherCommonAreas!
                        .copyWith(woodFramedWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue:
                      state.restroomsAndWashingFacilities?.woodFramedWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(woodFramedWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.kitchens?.woodFramedWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(
                        state.kitchens!.copyWith(woodFramedWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue:
                      state.teachingAndTreatmentSpaces?.woodFramedWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(woodFramedWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces?.woodFramedWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(woodFramedWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.otherSpaces?.woodFramedWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(
                        state.otherSpaces!.copyWith(woodFramedWalls: value)),
                  ),
                ),
                OutputCell(
                  getter: () => state.totalWoodFramedWallsInSquareMeters,
                ),
                OutputCell(
                  getter: () => state.totalWoodFramedWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalWoodFramedWallsTons,
                ),
                RowCell(
                  initialValue: 'Tiiliseinät (jm)',
                ),
                InputCell(
                  initialValue: state.officeSpaces?.brickWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(
                        state.officeSpaces!.copyWith(brickWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas?.brickWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    LobbiesAndOtherCommonAreasChanged(state
                        .lobbiesAndOtherCommonAreas!
                        .copyWith(brickWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities?.brickWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(brickWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.kitchens?.brickWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(
                        state.kitchens!.copyWith(brickWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces?.brickWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(brickWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.storageAndWorkspaces?.brickWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(brickWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.otherSpaces?.brickWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(
                        state.otherSpaces!.copyWith(brickWalls: value)),
                  ),
                ),
                OutputCell(
                  getter: () => state.totalBrickWallsInSquareMeters,
                ),
                OutputCell(
                  getter: () => state.totalBrickWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalBrickWallsTons,
                ),
                RowCell(
                  initialValue: 'Betonielementti-/Valuseinät (jm)',
                ),
                InputCell(
                  initialValue:
                      state.officeSpaces?.concreteElementOrCastingWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OfficeSpacesChanged(state.officeSpaces!
                        .copyWith(concreteElementOrCastingWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.lobbiesAndOtherCommonAreas
                      ?.concreteElementOrCastingWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    LobbiesAndOtherCommonAreasChanged(state
                        .lobbiesAndOtherCommonAreas!
                        .copyWith(concreteElementOrCastingWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.restroomsAndWashingFacilities
                      ?.concreteElementOrCastingWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    RestroomsAndWashingFacilitiesChanged(state
                        .restroomsAndWashingFacilities!
                        .copyWith(concreteElementOrCastingWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.kitchens?.concreteElementOrCastingWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    KitchensChanged(state.kitchens!
                        .copyWith(concreteElementOrCastingWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue: state.teachingAndTreatmentSpaces
                      ?.concreteElementOrCastingWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    TeachingAndTreatmentSpacesChanged(state
                        .teachingAndTreatmentSpaces!
                        .copyWith(concreteElementOrCastingWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.concreteElementOrCastingWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    StorageAndWorkSpacesChanged(state.storageAndWorkspaces!
                        .copyWith(concreteElementOrCastingWalls: value)),
                  ),
                ),
                InputCell(
                  initialValue:
                      state.otherSpaces?.concreteElementOrCastingWalls,
                  setter: (value) =>
                      internalWallFramesAndSurfaceMaterialBloc.add(
                    OtherSpacesChanged(state.otherSpaces!
                        .copyWith(concreteElementOrCastingWalls: value)),
                  ),
                ),
                OutputCell(
                  getter: () =>
                      state.totalConcreteElementOrCastingWallsInSquareMeters,
                ),
                OutputCell(
                  getter: () => state.totalConcreteElementOrCastingWallsVolume,
                ),
                OutputCell(
                  getter: () => state.totalConcreteElementOrCastingWallsTons,
                ),
                RowCell(
                  initialValue: 'Tilan seinäpituus yhteensä (jm)',
                ),
                OutputCell(
                  getter: () => state.officeSpaces?.totalWallLength,
                ),
                OutputCell(
                  getter: () =>
                      state.lobbiesAndOtherCommonAreas?.totalWallLength,
                ),
                OutputCell(
                  getter: () =>
                      state.restroomsAndWashingFacilities?.totalWallLength,
                ),
                OutputCell(
                  getter: () => state.kitchens?.totalWallLength,
                ),
                OutputCell(
                  getter: () =>
                      state.teachingAndTreatmentSpaces?.totalWallLength,
                ),
                OutputCell(
                  getter: () => state.storageAndWorkspaces?.totalWallLength,
                ),
                OutputCell(
                  getter: () => state.otherSpaces?.totalWallLength,
                ),
                OutputCell(
                  getter: () => state.totalSpacesWall,
                ),
                GreyCell(),
                GreyCell(),
                RowCell(
                  initialValue: 'Tilan seinäpinta-ala yhteensä (m2)',
                ),
                OutputCell(getter: () => state.totalOfficeSpaces.totalWallArea),
                OutputCell(
                  getter: () =>
                      state.totalLobbiesAndOtherCommonAreas.totalWallArea,
                ),
                OutputCell(
                  getter: () =>
                      state.totalRestroomsAndWashingFacilities.totalWallArea,
                ),
                OutputCell(
                  getter: () => state.totalKitchens.totalWallArea,
                ),
                OutputCell(
                  getter: () =>
                      state.totalTeachingAndTreatmentSpaces.totalWallArea,
                ),
                OutputCell(
                  getter: () => state.totalStorageAndWorkspaces.totalWallArea,
                ),
                OutputCell(
                  getter: () => state.totalOtherSpaces.totalWallArea,
                ),
                OutputCell(
                  getter: () => state.totalSpacesWallArea,
                ),
                GreyCell(),
                GreyCell(),
                RowCell(
                  initialValue: 'Tilan osuus seinien kokonaispinta-alasta (%)',
                ),
                OutputCell(
                  getter: () =>
                      state.totalOfficeSpaces.totalWallAreaPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalLobbiesAndOtherCommonAreas
                      .totalWallAreaPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalRestroomsAndWashingFacilities
                      .totalWallAreaPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () =>
                      state.totalKitchens.totalWallAreaPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalTeachingAndTreatmentSpaces
                      .totalWallAreaPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state
                      .totalStorageAndWorkspaces.totalWallAreaPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () =>
                      state.totalOtherSpaces.totalWallAreaPortionPercentage,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.totalWallAreaPortionPercentage,
                  percentage: true,
                ),
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
