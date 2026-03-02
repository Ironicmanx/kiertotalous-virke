import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/floor_structures_bloc.dart';
import 'package:flutter_app/src/lp-bloc/floor_structures_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/error_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class FloorStructuresForm extends StatelessWidget {
  const FloorStructuresForm({super.key});

  @override
  Widget build(BuildContext context) {
    final floorStructuresBloc = context.read<FloorStructuresBloc>();

    return BlocBuilder<FloorStructuresBloc, FloorStructures>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeader(text: 'Lattiarakenteet'),
            LayoutGrid(
              columnSizes: [
                232.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
              ],
              rowSizes: [75.px, 50.px],
              children: [
                Cell.empty(),
                Cell.column(initialValue: 'Toimistotilat (m2)'),
                Cell.column(initialValue: 'Aulat ja muut yleiset tilat (m2)'),
                Cell.column(initialValue: 'WC- ja pesutilat (m2)'),
                Cell.column(initialValue: 'Keittiöt (m2)'),
                Cell.column(initialValue: 'Opetus-/hoitotilat (m2)'),
                Cell.column(initialValue: 'Varastot ja työtilat (m2)'),
                Cell.column(initialValue: 'Muut tilat (m2)'),
                Cell.column(initialValue: 'Pinta-alat yhteensä (m2)'),
                Cell.row(initialValue: 'Tilan pinta-ala yhteensä (m2)'),
                Cell.input(
                  initialValue: state.officeSpaces?.totalArea,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OfficeSpacesChanged(
                          state.officeSpaces!.copyWith(totalArea: value),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue: state.lobbiesAndOtherCommonAreas?.totalArea,
                  setter:
                      (value) => floorStructuresBloc.add(
                        LobbiesAndOtherCommonAreasChanged(
                          state.lobbiesAndOtherCommonAreas!.copyWith(
                            totalArea: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue: state.restroomsAndWashingFacilities?.totalArea,
                  setter:
                      (value) => floorStructuresBloc.add(
                        RestRoomsAndWashingFacilitiesChanged(
                          state.restroomsAndWashingFacilities!.copyWith(
                            totalArea: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue: state.kitchens?.totalArea,
                  setter:
                      (value) => floorStructuresBloc.add(
                        KitchensChanged(
                          state.kitchens!.copyWith(totalArea: value),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue: state.teachingAndTreatmentSpaces?.totalArea,
                  setter:
                      (value) => floorStructuresBloc.add(
                        TeachingAndTreatmentSpacesChanged(
                          state.teachingAndTreatmentSpaces!.copyWith(
                            totalArea: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue: state.storageAndWorkspaces?.totalArea,
                  setter:
                      (value) => floorStructuresBloc.add(
                        StorageAndWorkspacesChanged(
                          state.storageAndWorkspaces!.copyWith(
                            totalArea: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue: state.otherSpaces?.totalArea,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OtherSpacesChanged(
                          state.otherSpaces!.copyWith(totalArea: value),
                        ),
                      ),
                ),
                Cell.output(getter: () => state.totalArea),
              ],
            ),
            const SizedBox(height: 40),
            LayoutGrid(
              columnSizes: [
                232.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
              ],
              rowSizes: [75.px, 50.px, 50.px, 50.px, 50.px],
              children: [
                Cell.header(
                  initialValue:
                      'Rakennelattiat, prosenttiosuus koko välipohjan pinta-alasta',
                ),
                Cell.column(initialValue: 'Toimistotilat (m2)'),
                Cell.column(initialValue: 'Aulat ja muut yleiset tilat (m2)'),
                Cell.column(initialValue: 'WC- ja pesutilat (m2)'),
                Cell.column(initialValue: 'Keittiöt (m2)'),
                Cell.column(initialValue: 'Opetus-/hoitotilat (m2)'),
                Cell.column(initialValue: 'Varastot ja työtilat (m2)'),
                Cell.column(initialValue: 'Muut tilat (m2)'),
                Cell.column(initialValue: 'Materiaali yht. (m3)'),
                Cell.column(initialValue: 'Materiaali yht. (tonnia)'),
                Cell.row(initialValue: 'Lastulevy'),
                Cell.input(
                  initialValue:
                      state.officeSpaces?.chipBoardMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OfficeSpacesChanged(
                          state.officeSpaces!.copyWith(
                            chipBoardMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .lobbiesAndOtherCommonAreas
                          ?.chipBoardMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        LobbiesAndOtherCommonAreasChanged(
                          state.lobbiesAndOtherCommonAreas!.copyWith(
                            chipBoardMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .restroomsAndWashingFacilities
                          ?.chipBoardMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        RestRoomsAndWashingFacilitiesChanged(
                          state.restroomsAndWashingFacilities!.copyWith(
                            chipBoardMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state.kitchens?.chipBoardMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        KitchensChanged(
                          state.kitchens!.copyWith(
                            chipBoardMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .teachingAndTreatmentSpaces
                          ?.chipBoardMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        TeachingAndTreatmentSpacesChanged(
                          state.teachingAndTreatmentSpaces!.copyWith(
                            chipBoardMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .storageAndWorkspaces
                          ?.chipBoardMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        StorageAndWorkspacesChanged(
                          state.storageAndWorkspaces!.copyWith(
                            chipBoardMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state.otherSpaces?.chipBoardMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OtherSpacesChanged(
                          state.otherSpaces!.copyWith(
                            chipBoardMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.output(getter: () => state.chipBoardMidsoleVolume),
                Cell.output(getter: () => state.chipBoardMidsoleTons),
                Cell.row(initialValue: 'Kipsilevy (cybroc)'),
                Cell.input(
                  initialValue:
                      state
                          .officeSpaces
                          ?.gypsumBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OfficeSpacesChanged(
                          state.officeSpaces!.copyWith(
                            gypsumBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .lobbiesAndOtherCommonAreas
                          ?.gypsumBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        LobbiesAndOtherCommonAreasChanged(
                          state.lobbiesAndOtherCommonAreas!.copyWith(
                            gypsumBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .restroomsAndWashingFacilities
                          ?.gypsumBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        RestRoomsAndWashingFacilitiesChanged(
                          state.restroomsAndWashingFacilities!.copyWith(
                            gypsumBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state.kitchens?.gypsumBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        KitchensChanged(
                          state.kitchens!.copyWith(
                            gypsumBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .teachingAndTreatmentSpaces
                          ?.gypsumBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        TeachingAndTreatmentSpacesChanged(
                          state.teachingAndTreatmentSpaces!.copyWith(
                            gypsumBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .storageAndWorkspaces
                          ?.gypsumBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        StorageAndWorkspacesChanged(
                          state.storageAndWorkspaces!.copyWith(
                            gypsumBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state.otherSpaces?.gypsumBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OtherSpacesChanged(
                          state.otherSpaces!.copyWith(
                            gypsumBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.output(getter: () => state.gypsumBoardingMidsoleVolume),
                Cell.output(getter: () => state.gypsumBoardingMidsoleTons),
                Cell.row(initialValue: 'Umpilaudoitus'),
                Cell.input(
                  initialValue:
                      state.officeSpaces?.solidBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OfficeSpacesChanged(
                          state.officeSpaces!.copyWith(
                            solidBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .lobbiesAndOtherCommonAreas
                          ?.solidBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        LobbiesAndOtherCommonAreasChanged(
                          state.lobbiesAndOtherCommonAreas!.copyWith(
                            solidBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .restroomsAndWashingFacilities
                          ?.solidBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        RestRoomsAndWashingFacilitiesChanged(
                          state.restroomsAndWashingFacilities!.copyWith(
                            solidBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state.kitchens?.solidBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        KitchensChanged(
                          state.kitchens!.copyWith(
                            solidBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .teachingAndTreatmentSpaces
                          ?.solidBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        TeachingAndTreatmentSpacesChanged(
                          state.teachingAndTreatmentSpaces!.copyWith(
                            solidBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state
                          .storageAndWorkspaces
                          ?.solidBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        StorageAndWorkspacesChanged(
                          state.storageAndWorkspaces!.copyWith(
                            solidBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.input(
                  initialValue:
                      state.otherSpaces?.solidBoardingMidsolePortionPercentage,
                  percentage: true,
                  setter:
                      (value) => floorStructuresBloc.add(
                        OtherSpacesChanged(
                          state.otherSpaces!.copyWith(
                            solidBoardingMidsolePortionPercentage: value,
                          ),
                        ),
                      ),
                ),
                Cell.output(getter: () => state.solidBoardingMidsoleVolume),
                Cell.output(getter: () => state.solidBoardingMidsoleTons),
                Cell.row(initialValue: 'Välipohjan rakenteet yhteensä (%)'),
                Cell.output(
                  percentage: true,
                  getter:
                      () => state.officeSpaces?.midsolePortionPercentageTotal,
                ),
                Cell.output(
                  percentage: true,
                  getter:
                      () =>
                          state
                              .lobbiesAndOtherCommonAreas
                              ?.midsolePortionPercentageTotal,
                ),
                Cell.output(
                  percentage: true,
                  getter:
                      () =>
                          state
                              .restroomsAndWashingFacilities
                              ?.midsolePortionPercentageTotal,
                ),
                Cell.output(
                  percentage: true,
                  getter: () => state.kitchens?.midsolePortionPercentageTotal,
                ),
                Cell.output(
                  percentage: true,
                  getter:
                      () =>
                          state
                              .teachingAndTreatmentSpaces
                              ?.midsolePortionPercentageTotal,
                ),
                Cell.output(
                  percentage: true,
                  getter:
                      () =>
                          state
                              .storageAndWorkspaces
                              ?.midsolePortionPercentageTotal,
                ),
                Cell.output(
                  percentage: true,
                  getter:
                      () => state.otherSpaces?.midsolePortionPercentageTotal,
                ),
                Cell.empty(),
                Cell.empty(),
              ],
            ),
            // TODO: why double header? needs fixing
            FormHeader(text: 'Lattian pintamateriaali'),
            FormHeader(
              text:
                  'Pinnoitemateriaalin prosenttiosuus tilan lattiapinta-alasta',
            ),
            LayoutGrid(
              columnSizes: [
                232.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
                140.px,
              ],
              rowSizes: [75.px, 50.px, 50.px, 50.px, 50.px, 50.px, 75.px],
              children: [
                RowCell(
                  // intentionally empty, at least for now
                  initialValue: "",
                  checkbox: true,
                  checkboxValue: state.surfaceMaterialCoatingContainsAsbestos,
                  checkboxTitle: "Pinnoite sisältää asbestia",
                  checkboxSetter:
                      (value) => floorStructuresBloc.add(
                        SurfaceMaterialCoatingContainsAsbestosChanged(value),
                      ),
                ),
                ColumnCell(initialValue: 'Toimistotilat'),
                ColumnCell(initialValue: 'Aulat ja muut yleiset tilat'),
                ColumnCell(initialValue: 'WC ja pesutilat'),
                ColumnCell(initialValue: 'Keittiöt'),
                ColumnCell(
                  initialValue: 'Opetus-/hoitotilat (m2)',
                  iconButton: InfoButton(
                    text:
                        TooltipTexts
                            .outerSheath
                            .floorStructures
                            .teachingAndTreatmentSpaces,
                  ),
                ),
                ColumnCell(initialValue: 'Varastot ja työtilat'),
                ColumnCell(initialValue: 'Muut tilat'),
                ColumnCell(initialValue: 'Materiaalimäärä yhteensä (m3)'),
                ColumnCell(initialValue: 'Materiaalimäärä yhteensä (tonnia)'),
                RowCell(initialValue: 'Lattiapaneeli'),
                InputCell(
                  initialValue:
                      state.officeSpaces?.floorPanelFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OfficeSpacesChanged(
                        state.officeSpaces!.copyWith(
                          floorPanelFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .lobbiesAndOtherCommonAreas
                          ?.floorPanelFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      LobbiesAndOtherCommonAreasChanged(
                        state.lobbiesAndOtherCommonAreas!.copyWith(
                          floorPanelFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .restroomsAndWashingFacilities
                          ?.floorPanelFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      RestRoomsAndWashingFacilitiesChanged(
                        state.restroomsAndWashingFacilities!.copyWith(
                          floorPanelFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state.kitchens?.floorPanelFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      KitchensChanged(
                        state.kitchens!.copyWith(
                          floorPanelFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .teachingAndTreatmentSpaces
                          ?.floorPanelFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      TeachingAndTreatmentSpacesChanged(
                        state.teachingAndTreatmentSpaces!.copyWith(
                          floorPanelFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .storageAndWorkspaces
                          ?.floorPanelFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      StorageAndWorkspacesChanged(
                        state.storageAndWorkspaces!.copyWith(
                          floorPanelFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state.otherSpaces?.floorPanelFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OtherSpacesChanged(
                        state.otherSpaces!.copyWith(
                          floorPanelFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                OutputCell(getter: () => state.floorPanelFloorVolume),
                OutputCell(getter: () => state.floorPanelFloorTons),
                RowCell(initialValue: 'Muovimatto tai muovilaatta'),
                InputCell(
                  initialValue:
                      state
                          .officeSpaces
                          ?.plasticCarpetOrPlasticTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OfficeSpacesChanged(
                        state.officeSpaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortionPercentage:
                              value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .lobbiesAndOtherCommonAreas
                          ?.plasticCarpetOrPlasticTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      LobbiesAndOtherCommonAreasChanged(
                        state.lobbiesAndOtherCommonAreas!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortionPercentage:
                              value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .restroomsAndWashingFacilities
                          ?.plasticCarpetOrPlasticTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      RestRoomsAndWashingFacilitiesChanged(
                        state.restroomsAndWashingFacilities!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortionPercentage:
                              value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .kitchens
                          ?.plasticCarpetOrPlasticTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      KitchensChanged(
                        state.kitchens!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortionPercentage:
                              value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .teachingAndTreatmentSpaces
                          ?.plasticCarpetOrPlasticTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      TeachingAndTreatmentSpacesChanged(
                        state.teachingAndTreatmentSpaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortionPercentage:
                              value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .storageAndWorkspaces
                          ?.plasticCarpetOrPlasticTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      StorageAndWorkspacesChanged(
                        state.storageAndWorkspaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortionPercentage:
                              value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .otherSpaces
                          ?.plasticCarpetOrPlasticTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OtherSpacesChanged(
                        state.otherSpaces!.copyWith(
                          plasticCarpetOrPlasticTileFloorPortionPercentage:
                              value,
                        ),
                      ),
                    );
                  },
                ),
                OutputCell(
                  getter: () => state.plasticCarpetOrPlasticTileFloorTons,
                ),
                OutputCell(
                  getter: () => state.plasticCarpetOrPlasticTileFloorTons,
                ),
                RowCell(initialValue: 'Parketti'),
                InputCell(
                  initialValue:
                      state.officeSpaces?.parquetFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OfficeSpacesChanged(
                        state.officeSpaces!.copyWith(
                          parquetFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .lobbiesAndOtherCommonAreas
                          ?.parquetFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      LobbiesAndOtherCommonAreasChanged(
                        state.lobbiesAndOtherCommonAreas!.copyWith(
                          parquetFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .restroomsAndWashingFacilities
                          ?.parquetFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      RestRoomsAndWashingFacilitiesChanged(
                        state.restroomsAndWashingFacilities!.copyWith(
                          parquetFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue: state.kitchens?.parquetFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      KitchensChanged(
                        state.kitchens!.copyWith(
                          parquetFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .teachingAndTreatmentSpaces
                          ?.parquetFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      TeachingAndTreatmentSpacesChanged(
                        state.teachingAndTreatmentSpaces!.copyWith(
                          parquetFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state.storageAndWorkspaces?.parquetFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      StorageAndWorkspacesChanged(
                        state.storageAndWorkspaces!.copyWith(
                          parquetFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state.otherSpaces?.parquetFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OtherSpacesChanged(
                        state.otherSpaces!.copyWith(
                          parquetFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                OutputCell(getter: () => state.parquetFloorVolume),
                OutputCell(getter: () => state.parquetFloorTons),
                RowCell(initialValue: 'Kaakelilaatta'),
                InputCell(
                  initialValue:
                      state.officeSpaces?.ceramicTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OfficeSpacesChanged(
                        state.officeSpaces!.copyWith(
                          ceramicTileFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .lobbiesAndOtherCommonAreas
                          ?.ceramicTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      LobbiesAndOtherCommonAreasChanged(
                        state.lobbiesAndOtherCommonAreas!.copyWith(
                          ceramicTileFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .restroomsAndWashingFacilities
                          ?.ceramicTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      RestRoomsAndWashingFacilitiesChanged(
                        state.restroomsAndWashingFacilities!.copyWith(
                          ceramicTileFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state.kitchens?.ceramicTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      KitchensChanged(
                        state.kitchens!.copyWith(
                          ceramicTileFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .teachingAndTreatmentSpaces
                          ?.ceramicTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      TeachingAndTreatmentSpacesChanged(
                        state.teachingAndTreatmentSpaces!.copyWith(
                          ceramicTileFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state
                          .storageAndWorkspaces
                          ?.ceramicTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      StorageAndWorkspacesChanged(
                        state.storageAndWorkspaces!.copyWith(
                          ceramicTileFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                InputCell(
                  initialValue:
                      state.otherSpaces?.ceramicTileFloorPortionPercentage,
                  percentage: true,
                  setter: (value) {
                    floorStructuresBloc.add(
                      OtherSpacesChanged(
                        state.otherSpaces!.copyWith(
                          ceramicTileFloorPortionPercentage: value,
                        ),
                      ),
                    );
                  },
                ),
                OutputCell(getter: () => state.ceramicTileFloorVolume),
                OutputCell(getter: () => state.ceramicTileFloorTons),
                RowCell(initialValue: 'Pintamateriaalit yhteensä (%)'),
                OutputCell(
                  getter: () => state.officeSpaces?.floorPortionPercentageTotal,
                  percentage: true,
                ),
                OutputCell(
                  getter:
                      () =>
                          state
                              .lobbiesAndOtherCommonAreas
                              ?.floorPortionPercentageTotal,
                  percentage: true,
                ),
                OutputCell(
                  getter:
                      () =>
                          state
                              .restroomsAndWashingFacilities
                              ?.floorPortionPercentageTotal,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.kitchens?.floorPortionPercentageTotal,
                  percentage: true,
                ),
                OutputCell(
                  getter:
                      () =>
                          state
                              .teachingAndTreatmentSpaces
                              ?.floorPortionPercentageTotal,
                  percentage: true,
                ),
                OutputCell(
                  getter:
                      () =>
                          state
                              .storageAndWorkspaces
                              ?.floorPortionPercentageTotal,
                  percentage: true,
                ),
                OutputCell(
                  getter: () => state.otherSpaces?.floorPortionPercentageTotal,
                  percentage: true,
                ),
                EmptyCell(),
                EmptyCell(),
                ErrorCell(
                  getters:
                      () => [
                        state.officeSpaces?.floorPortionPercentageTotal,
                        state
                            .lobbiesAndOtherCommonAreas
                            ?.floorPortionPercentageTotal,
                        state
                            .restroomsAndWashingFacilities
                            ?.floorPortionPercentageTotal,
                        state.kitchens?.floorPortionPercentageTotal,
                        state
                            .teachingAndTreatmentSpaces
                            ?.floorPortionPercentageTotal,
                        state.storageAndWorkspaces?.floorPortionPercentageTotal,
                      ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
