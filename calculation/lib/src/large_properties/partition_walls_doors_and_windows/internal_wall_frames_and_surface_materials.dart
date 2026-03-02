import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'internal_wall_frames_and_surface_materials.freezed.dart';
part 'internal_wall_frames_and_surface_materials.g.dart';

/// 7. SISÄSEINIEN RUNGOT JA PINTAMATERIAALIT
/// Toimisto, aula, luokka, asumis, yms. tavanomaiset huonetilat
/// Sisältää jokaisen huoneen ja niiden yhteislaskettavat arvot
@freezed
abstract class InternalWallFramesAndSurfaceMaterial
    with _$InternalWallFramesAndSurfaceMaterial {
  InternalWallFramesAndSurfaceMaterial._();

  factory InternalWallFramesAndSurfaceMaterial(
          {num? overallWallLength,
          num? averageWallHeight,
          RoomSpace? officeSpaces,
          RoomSpace? lobbiesAndOtherCommonAreas,
          RoomSpace? restroomsAndWashingFacilities,
          RoomSpace? kitchens,
          RoomSpace? teachingAndTreatmentSpaces,
          RoomSpace? storageAndWorkspaces,
          RoomSpace? otherSpaces,
          @Default(false) bool surfaceMaterialCoatingContainsAsbestos}) =
      _InternalWallFramesAndSurfaceMaterial;

  factory InternalWallFramesAndSurfaceMaterial.fromJson(
          Map<String, dynamic> json) =>
      _$InternalWallFramesAndSurfaceMaterialFromJson(json);

  late final totalOfficeSpaces = TotalRoomSpace(
      roomSpace: officeSpaces, internalWallFramesAndSurfaceMaterial: this);

  late final totalLobbiesAndOtherCommonAreas = TotalRoomSpace(
      roomSpace: lobbiesAndOtherCommonAreas,
      internalWallFramesAndSurfaceMaterial: this);

  late final totalRestroomsAndWashingFacilities = TotalRoomSpace(
      roomSpace: restroomsAndWashingFacilities,
      internalWallFramesAndSurfaceMaterial: this);

  late final totalKitchens = TotalRoomSpace(
      roomSpace: kitchens, internalWallFramesAndSurfaceMaterial: this);

  late final totalTeachingAndTreatmentSpaces = TotalRoomSpace(
      roomSpace: teachingAndTreatmentSpaces,
      internalWallFramesAndSurfaceMaterial: this);

  late final totalStorageAndWorkspaces = TotalRoomSpace(
      roomSpace: storageAndWorkspaces,
      internalWallFramesAndSurfaceMaterial: this);

  late final totalOtherSpaces = TotalRoomSpace(
      roomSpace: otherSpaces, internalWallFramesAndSurfaceMaterial: this);

  num? get totalArea {
    if (overallWallLength == null || averageWallHeight == null) {
      return null;
    }
    return overallWallLength! * averageWallHeight!;
  }

  /// Kaikki tilat yhteensä (m2)
  num? get totalWoodFramedWallsInSquareMeters {
    if (overallWallLength == null || averageWallHeight == null) {
      return null;
    }

    final totalLength = Utils.sumOrNull([
      officeSpaces?.woodFramedWalls,
      lobbiesAndOtherCommonAreas?.woodFramedWalls,
      restroomsAndWashingFacilities?.woodFramedWalls,
      kitchens?.woodFramedWalls,
      teachingAndTreatmentSpaces?.woodFramedWalls,
      storageAndWorkspaces?.woodFramedWalls,
      otherSpaces?.woodFramedWalls,
    ]);

    return totalLength == null ? null : totalLength * averageWallHeight!;
  }

  num? get totalBrickWallsInSquareMeters {
    if (averageWallHeight == null) {
      return null;
    }

    final totalLength = Utils.sumOrNull([
      officeSpaces?.brickWalls,
      lobbiesAndOtherCommonAreas?.brickWalls,
      restroomsAndWashingFacilities?.brickWalls,
      kitchens?.brickWalls,
      teachingAndTreatmentSpaces?.brickWalls,
      storageAndWorkspaces?.brickWalls,
      otherSpaces?.brickWalls,
    ]);

    return totalLength == null ? null : totalLength * averageWallHeight!;
  }

  num? get totalConcreteElementOrCastingWallsInSquareMeters {
    if (averageWallHeight == null) {
      return null;
    }

    final totalLength = Utils.sumOrNull([
      officeSpaces?.concreteElementOrCastingWalls,
      lobbiesAndOtherCommonAreas?.concreteElementOrCastingWalls,
      restroomsAndWashingFacilities?.concreteElementOrCastingWalls,
      kitchens?.concreteElementOrCastingWalls,
      teachingAndTreatmentSpaces?.concreteElementOrCastingWalls,
      storageAndWorkspaces?.concreteElementOrCastingWalls,
      otherSpaces?.concreteElementOrCastingWalls,
    ]);

    return totalLength == null ? null : totalLength * averageWallHeight!;
  }

  num? get totalSpacesWall => Utils.sumOrNull([
        officeSpaces?.totalWallLength,
        lobbiesAndOtherCommonAreas?.totalWallLength,
        restroomsAndWashingFacilities?.totalWallLength,
        kitchens?.totalWallLength,
        teachingAndTreatmentSpaces?.totalWallLength,
        storageAndWorkspaces?.totalWallLength,
        otherSpaces?.totalWallLength
      ]);

  num? get totalSpacesWallArea => Utils.sumOrNull([
        totalOfficeSpaces.totalWallArea,
        totalLobbiesAndOtherCommonAreas.totalWallArea,
        totalRestroomsAndWashingFacilities.totalWallArea,
        totalKitchens.totalWallArea,
        totalTeachingAndTreatmentSpaces.totalWallArea,
        totalStorageAndWorkspaces.totalWallArea,
        totalOtherSpaces.totalWallArea
      ]);

  num? get totalWallAreaPortionPercentage => Utils.sumOrNull([
        totalOfficeSpaces.totalWallAreaPortionPercentage,
        totalLobbiesAndOtherCommonAreas.totalWallAreaPortionPercentage,
        totalRestroomsAndWashingFacilities.totalWallAreaPortionPercentage,
        totalKitchens.totalWallAreaPortionPercentage,
        totalTeachingAndTreatmentSpaces.totalWallAreaPortionPercentage,
        totalStorageAndWorkspaces.totalWallAreaPortionPercentage,
        totalOtherSpaces.totalWallAreaPortionPercentage
      ]);

  /// Materiaalimäärä yhteensa (m3)
  num? get totalWoodFramedWallsVolume {
    if (totalWoodFramedWallsInSquareMeters == null) {
      return null;
    }
    return totalWoodFramedWallsInSquareMeters! *
        WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
            WoodMaterialType.trunkWood50x100) *
        WoodMaterialInfo.volumePerLinearMeter(WoodMaterialType.trunkWood50x100);
  }

  num? get totalBrickWallsVolume {
    if (totalBrickWallsInSquareMeters == null) {
      return null;
    }
    return totalBrickWallsInSquareMeters! *
        FoundationStructureWeights.limeSandBrick130mmKgPerSqm /
        FoundationStructureWeights.limeSandBrick130mmKgPerCbm;
  }

  num? get totalConcreteElementOrCastingWallsVolume {
    if (totalConcreteElementOrCastingWallsInSquareMeters == null) {
      return null;
    }
    return totalConcreteElementOrCastingWallsInSquareMeters! *
        FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm /
        FrameBarWeights.concreteWallElement200mmThickConcreteKgPerCbm;
  }

  /// Materiaalimaara yhteensa (tonnia)
  num? get totalWoodFramedWallsTons {
    if (totalWoodFramedWallsVolume == null) {
      return null;
    }
    return totalWoodFramedWallsVolume! *
        WoodMaterialInfo.densityKgPerCubicMeter() /
        1000;
  }

  num? get totalBrickWallsTons {
    if (totalBrickWallsVolume == null) {
      return null;
    }

    return totalBrickWallsInSquareMeters! *
        FoundationStructureWeights.limeSandBrick130mmKgPerSqm /
        1000;
  }

  num? get totalConcreteElementOrCastingWallsTons {
    if (totalConcreteElementOrCastingWallsVolume == null) {
      return null;
    }

    return totalConcreteElementOrCastingWallsInSquareMeters! *
        FrameBarWeights.concreteWallElement200mmThickConcreteKgPerSqm /
        1000;
  }

  /// Seinien pintarakenteen osuus % kaikista valiseinista (seinapinta-alasta)

  /// Kaikki tilat yhteensa (m2)
  num? get totalChipboardArea => Utils.sumOrNull([
        totalOfficeSpaces.chipboardArea,
        totalLobbiesAndOtherCommonAreas.chipboardArea,
        totalRestroomsAndWashingFacilities.chipboardArea,
        totalKitchens.chipboardArea,
        totalTeachingAndTreatmentSpaces.chipboardArea,
        totalStorageAndWorkspaces.chipboardArea,
        totalOtherSpaces.chipboardArea
      ]);

  num? get totalCybrocArea => Utils.sumOrNull([
        totalOfficeSpaces.cybrocArea,
        totalLobbiesAndOtherCommonAreas.cybrocArea,
        totalRestroomsAndWashingFacilities.cybrocArea,
        totalKitchens.cybrocArea,
        totalTeachingAndTreatmentSpaces.cybrocArea,
        totalStorageAndWorkspaces.cybrocArea,
        totalOtherSpaces.cybrocArea
      ]);

  num? get totalBoardPanelArea => Utils.sumOrNull([
        totalOfficeSpaces.boardPanelArea,
        totalLobbiesAndOtherCommonAreas.boardPanelArea,
        totalRestroomsAndWashingFacilities.boardPanelArea,
        totalKitchens.boardPanelArea,
        totalTeachingAndTreatmentSpaces.boardPanelArea,
        totalStorageAndWorkspaces.boardPanelArea,
        totalOtherSpaces.boardPanelArea
      ]);

  num? get totalCeramicTileWallsArea => Utils.sumOrNull([
        totalOfficeSpaces.ceramicTileWallsArea,
        totalLobbiesAndOtherCommonAreas.ceramicTileWallsArea,
        totalRestroomsAndWashingFacilities.ceramicTileWallsArea,
        totalKitchens.ceramicTileWallsArea,
        totalTeachingAndTreatmentSpaces.ceramicTileWallsArea,
        totalStorageAndWorkspaces.ceramicTileWallsArea,
        totalOtherSpaces.ceramicTileWallsArea
      ]);

  num? get totalPaintedPlasteredBrickWallArea => Utils.sumOrNull([
        totalOfficeSpaces.paintedPlasteredBrickWallArea,
        totalLobbiesAndOtherCommonAreas.paintedPlasteredBrickWallArea,
        totalRestroomsAndWashingFacilities.paintedPlasteredBrickWallArea,
        totalKitchens.paintedPlasteredBrickWallArea,
        totalTeachingAndTreatmentSpaces.paintedPlasteredBrickWallArea,
        totalStorageAndWorkspaces.paintedPlasteredBrickWallArea,
        totalOtherSpaces.paintedPlasteredBrickWallArea
      ]);

  num? get totalPlasticCarpetArea => Utils.sumOrNull([
        totalOfficeSpaces.plasticCarpetArea,
        totalLobbiesAndOtherCommonAreas.plasticCarpetArea,
        totalRestroomsAndWashingFacilities.plasticCarpetArea,
        totalKitchens.plasticCarpetArea,
        totalTeachingAndTreatmentSpaces.plasticCarpetArea,
        totalStorageAndWorkspaces.plasticCarpetArea,
        totalOtherSpaces.plasticCarpetArea
      ]);

  num? get totalAreaPercentage => Utils.sumOrNull([
        totalChipboardArea,
        totalCybrocArea,
        totalBoardPanelArea,
        totalCeramicTileWallsArea,
        totalPaintedPlasteredBrickWallArea,
        totalPlasticCarpetArea
      ]);

  /// Materiaalimaara yhteensa (m3)
  num? get totalChipboardVolume {
    if (totalChipboardArea == null) {
      return null;
    }
    return totalChipboardArea! *
        UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerSqm /
        UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerCbm;
  }

  num? get totalCybrocVolume {
    if (totalCybrocArea == null) {
      return null;
    }
    return totalCybrocArea! *
        UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerSqm /
        UpperBaseStructureAndWaterRoofWeights.plasterBoardKgPerCbm;
  }

  num? get totalBoardPanelVolume {
    if (totalBoardPanelArea == null) {
      return null;
    }
    return totalBoardPanelArea! *
        WoodMaterialInfo.woodWeightPerSquareMeter(
            WoodMaterialType.board20x125) /
        WoodMaterialInfo.densityKgPerCubicMeter();
  }

  num? get totalCeramicTileWallsVolume {
    if (totalCeramicTileWallsArea == null) {
      return null;
    }
    return totalCeramicTileWallsArea! *
        DividingWallWeights.ceramicTileKgPerSqm /
        DividingWallWeights.ceramicTileKgPerCbm;
  }

  num? get totalPaintedPlasteredBrickWallVolume {
    if (totalPaintedPlasteredBrickWallArea == null) {
      return null;
    }
    return totalPaintedPlasteredBrickWallArea! *
        FoundationSlabWeights.acrylicCoatingKgPerSqm /
        FoundationSlabWeights.acrylicCoatingKgPerCbm;
  }

  num? get totalPlasticCarpetVolume {
    if (totalPlasticCarpetArea == null) {
      return null;
    }
    return totalPlasticCarpetArea! *
        FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
        FloorStructureAndMaterialWeights.plasticMatKgPerCbm;
  }

  /// Materiaalimaara yhteensa (tonnia)
  num? get totalChipboardTons {
    if (totalChipboardArea == null) {
      return null;
    }
    return totalChipboardArea! *
        UpperBaseStructureAndWaterRoofWeights.chipBoard15mmKgPerSqm /
        1000;
  }

  num? get totalCybrocTons {
    if (totalCybrocArea == null) {
      return null;
    }
    return totalCybrocArea! *
        UpperBaseStructureAndWaterRoofWeights.hardDiskKgPerSqm /
        1000;
  }

  num? get totalBoardPanelTons {
    if (totalBoardPanelArea == null) {
      return null;
    }
    return totalBoardPanelArea! *
        WoodMaterialInfo.woodWeightPerSquareMeter(
            WoodMaterialType.board20x125) /
        1000;
  }

  num? get totalCeramicTileWallsTons {
    if (totalCeramicTileWallsArea == null) {
      return null;
    }
    return totalCeramicTileWallsArea! *
        DividingWallWeights.ceramicTileKgPerSqm /
        1000;
  }

  num? get totalPaintedPlasteredBrickWallTons {
    if (totalPaintedPlasteredBrickWallArea == null) {
      return null;
    }
    return totalPaintedPlasteredBrickWallArea! *
        FoundationSlabWeights.acrylicCoatingKgPerSqm /
        1000;
  }

  num? get totalPlasticCarpetTons {
    if (totalPlasticCarpetArea == null) {
      return null;
    }
    return totalPlasticCarpetArea! *
        FloorStructureAndMaterialWeights.plasticMatKgPerSqm /
        1000;
  }
}
