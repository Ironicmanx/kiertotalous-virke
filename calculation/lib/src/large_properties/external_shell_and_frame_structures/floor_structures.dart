import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';
import 'floor_structure.dart';

part 'floor_structures.freezed.dart';
part 'floor_structures.g.dart';

@freezed
abstract class FloorStructures with _$FloorStructures {
  const FloorStructures._();

  const factory FloorStructures(
          {FloorStructure? officeSpaces,
          FloorStructure? lobbiesAndOtherCommonAreas,
          FloorStructure? restroomsAndWashingFacilities,
          FloorStructure? kitchens,
          FloorStructure? teachingAndTreatmentSpaces,
          FloorStructure? storageAndWorkspaces,
          FloorStructure? otherSpaces,
          @Default(false) bool surfaceMaterialCoatingContainsAsbestos}) =
      _FloorStructures;

  factory FloorStructures.fromJson(Map<String, dynamic> json) =>
      _$FloorStructuresFromJson(json);

  num? get totalArea => Utils.sumOrNull([
        officeSpaces?.totalArea,
        lobbiesAndOtherCommonAreas?.totalArea,
        restroomsAndWashingFacilities?.totalArea,
        kitchens?.totalArea,
        teachingAndTreatmentSpaces?.totalArea,
        storageAndWorkspaces?.totalArea,
        otherSpaces?.totalArea
      ]);

  num? get chipBoardMidsoleVolume {
    final volumeSum = Utils.sumOrNull([
      officeSpaces?.chipBoardMidsoleArea,
      lobbiesAndOtherCommonAreas?.chipBoardMidsoleArea,
      restroomsAndWashingFacilities?.chipBoardMidsoleArea,
      kitchens?.chipBoardMidsoleArea,
      teachingAndTreatmentSpaces?.chipBoardMidsoleArea,
      storageAndWorkspaces?.chipBoardMidsoleArea,
      otherSpaces?.chipBoardMidsoleArea
    ]);

    return volumeSum == null
        ? null
        : volumeSum *
            UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerSqm /
            1000;
  }

  num? get gypsumBoardingMidsoleVolume {
    final volumeSum = Utils.sumOrNull([
      officeSpaces?.gypsumBoardingMidsoleArea,
      lobbiesAndOtherCommonAreas?.gypsumBoardingMidsoleArea,
      restroomsAndWashingFacilities?.gypsumBoardingMidsoleArea,
      kitchens?.gypsumBoardingMidsoleArea,
      teachingAndTreatmentSpaces?.gypsumBoardingMidsoleArea,
      storageAndWorkspaces?.gypsumBoardingMidsoleArea,
      otherSpaces?.gypsumBoardingMidsoleArea
    ]);

    return volumeSum == null
        ? null
        : volumeSum *
            UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerSqm /
            1000;
  }

  num? get solidBoardingMidsoleVolume {
    final volumeSum = Utils.sumOrNull([
      officeSpaces?.solidBoardingMidsoleArea,
      lobbiesAndOtherCommonAreas?.solidBoardingMidsoleArea,
      restroomsAndWashingFacilities?.solidBoardingMidsoleArea,
      kitchens?.solidBoardingMidsoleArea,
      teachingAndTreatmentSpaces?.solidBoardingMidsoleArea,
      storageAndWorkspaces?.solidBoardingMidsoleArea,
      otherSpaces?.solidBoardingMidsoleArea
    ]);

    return volumeSum == null
        ? null
        : volumeSum *
            UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerSqm /
            1000;
  }

  num? get chipBoardMidsoleTons => chipBoardMidsoleVolume == null
      ? null
      : chipBoardMidsoleVolume! /
          1000 *
          UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerCbm;

  num? get gypsumBoardingMidsoleTons => gypsumBoardingMidsoleVolume == null
      ? null
      : gypsumBoardingMidsoleVolume! *
          1000 /
          UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerCbm;

  num? get solidBoardingMidsoleTons => solidBoardingMidsoleVolume == null
      ? null
      : solidBoardingMidsoleVolume! *
          1000 /
          UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerCbm;

  num? get floorPanelFloorVolume {
    final volumeSum = Utils.sumOrNull([
      officeSpaces?.floorPanelFloorArea,
      lobbiesAndOtherCommonAreas?.floorPanelFloorArea,
      restroomsAndWashingFacilities?.floorPanelFloorArea,
      kitchens?.floorPanelFloorArea,
      teachingAndTreatmentSpaces?.floorPanelFloorArea,
      storageAndWorkspaces?.floorPanelFloorArea,
      otherSpaces?.floorPanelFloorArea
    ]);

    return volumeSum == null
        ? null
        : volumeSum *
            UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerSqm /
            1000;
  }

  num? get plasticCarpetOrPlasticTileFloorVolume {
    final volumeSum = Utils.sumOrNull([
      officeSpaces?.plasticCarpetOrPlasticTileFloorArea,
      lobbiesAndOtherCommonAreas?.plasticCarpetOrPlasticTileFloorArea,
      restroomsAndWashingFacilities?.plasticCarpetOrPlasticTileFloorArea,
      kitchens?.plasticCarpetOrPlasticTileFloorArea,
      teachingAndTreatmentSpaces?.plasticCarpetOrPlasticTileFloorArea,
      storageAndWorkspaces?.plasticCarpetOrPlasticTileFloorArea,
      otherSpaces?.plasticCarpetOrPlasticTileFloorArea
    ]);

    return volumeSum == null
        ? null
        : volumeSum *
            FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
            1000;
  }

  num? get parquetFloorVolume {
    final volumeSum = Utils.sumOrNull([
      officeSpaces?.parquetFloorArea,
      lobbiesAndOtherCommonAreas?.parquetFloorArea,
      restroomsAndWashingFacilities?.parquetFloorArea,
      kitchens?.parquetFloorArea,
      teachingAndTreatmentSpaces?.parquetFloorArea,
      storageAndWorkspaces?.parquetFloorArea,
      otherSpaces?.parquetFloorArea
    ]);

    return volumeSum == null
        ? null
        : volumeSum * FloorStructureAndMaterialWeights.parquetKgPerSqm / 1000;
  }

  num? get ceramicTileFloorVolume {
    final volumeSum = Utils.sumOrNull([
      officeSpaces?.ceramicTileFloorArea,
      lobbiesAndOtherCommonAreas?.ceramicTileFloorArea,
      restroomsAndWashingFacilities?.ceramicTileFloorArea,
      kitchens?.ceramicTileFloorArea,
      teachingAndTreatmentSpaces?.ceramicTileFloorArea,
      storageAndWorkspaces?.ceramicTileFloorArea,
      otherSpaces?.ceramicTileFloorArea
    ]);

    return volumeSum == null
        ? null
        : volumeSum *
            FloorStructureAndMaterialWeights.ceramicTilesKgPerSqm /
            1000;
  }

  num? get floorPanelFloorTons => floorPanelFloorVolume == null
      ? null
      : floorPanelFloorVolume! /
          1000 *
          UpperBaseStructureAndWaterRoofWeights.underPlankingKgPerCbm;

  num? get plasticCarpetOrPlasticTileFloorTons =>
      plasticCarpetOrPlasticTileFloorVolume == null
          ? null
          : plasticCarpetOrPlasticTileFloorVolume! /
              1000 *
              FloorStructureAndMaterialWeights.plasticMatKgPerCbm;

  num? get parquetFloorTons => parquetFloorVolume == null
      ? null
      : parquetFloorVolume! /
          1000 *
          FloorStructureAndMaterialWeights.parquetKgPerCbm;

  num? get ceramicTileFloorTons => ceramicTileFloorVolume == null
      ? null
      : ceramicTileFloorVolume! /
          1000 *
          FloorStructureAndMaterialWeights.ceramicTilesKgPerCbm;
}
