import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../demolition_material_assessment/total/exports.dart';
import '../../external_shell_and_frame_structures/exports.dart';
import '../../external_shell_and_frame_structures/total/exports.dart';
import '../../partition_walls_doors_and_windows/exports.dart';
import '../exports.dart';

part 'total_concrete_bricks_tiles_ceramics.freezed.dart';

/// betoni, tiilet, laatat ja keramiikka
@freezed
abstract class TotalConcreteBricksTilesCeramics
    with _$TotalConcreteBricksTilesCeramics {
  TotalConcreteBricksTilesCeramics._();

  factory TotalConcreteBricksTilesCeramics(
          {ConcreteBricksTilesCeramics? concreteBricksTilesCeramics,
          Foundations? foundations,
          TotalIntermediateFloors? totalIntermediateFloors,
          TotalRoofs? totalRoofs,
          TotalBuildingFrame? totalBuildingFrame,
          InternalWallFramesAndSurfaceMaterial?
              internalWallFramesAndSurfaceMaterial,
          TotalDemolitionWasteAndCosts? totalDemolitionWasteAndCosts}) =
      _TotalConcreteBricksTilesCeramics;

  late final concrete = WasteLawDemolitionMaterialEstimateEntry(
      volume: _concreteVolume,
      tons: _concreteTons,
      notes: concreteBricksTilesCeramics?.concreteNotes);

  late final brick = WasteLawDemolitionMaterialEstimateEntry(
      volume: Utils.sumOrNull([
        totalRoofs?.roofTileVolume,
        totalBuildingFrame?.brickVolume,
        totalBuildingFrame?.limeOrRedBrickVolume,
        internalWallFramesAndSurfaceMaterial?.totalBrickWallsVolume
      ]),
      tons: Utils.sumOrNull([
        totalRoofs?.roofTileTons,
        totalBuildingFrame?.brickTons,
        totalBuildingFrame?.limeOrRedBrickTons,
        internalWallFramesAndSurfaceMaterial?.totalBrickWallsTons
      ]),
      notes: concreteBricksTilesCeramics?.brickNotes);

  late final ceramicTiles = WasteLawDemolitionMaterialEstimateEntry(
      volume: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.ceramicTiles.volume,
      tons: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.ceramicTiles.tons,
      notes: concreteBricksTilesCeramics?.ceramicTilesNotes);

  late final hazardousConcreteBrickTileCeramicMixtures =
      WasteLawDemolitionMaterialEstimateEntry(
          volume: Utils.sumOrNull([
            totalDemolitionWasteAndCosts
                ?.totalDisposalMaterialsAndHazardousWaste
                ?.asbestosOrBCPConcrete
                .volume,
            totalDemolitionWasteAndCosts
                ?.totalDisposalMaterialsAndHazardousWaste
                ?.otherAsbestosContainingMaterial
                .volume,
          ]),
          tons: Utils.sumOrNull([
            totalDemolitionWasteAndCosts
                ?.totalDisposalMaterialsAndHazardousWaste
                ?.asbestosOrBCPConcrete
                .tons,
            totalDemolitionWasteAndCosts
                ?.totalDisposalMaterialsAndHazardousWaste
                ?.otherAsbestosContainingMaterial
                .tons,
          ]),
          notes: concreteBricksTilesCeramics
              ?.hazardousConcreteBrickTileCeramicMixturesNotes);

  WasteLawDemolitionMaterialEstimateEntry? get otherMaterials =>
      concreteBricksTilesCeramics?.otherMaterials;

  num? get _concreteVolume {
    num? foundationsConcreteVolume;
    var intermediateFloorsConcreteVolume =
        totalIntermediateFloors?.concreteCastingConcreteVolume;
    var roofsConcreteVolume = (totalRoofs?.roofTrussesAreRecyclable ?? false)
        ? null
        : totalRoofs?.concreteVolume;
    var buildingFrameConcreteVolume = totalBuildingFrame?.plasterCoatingVolume;

    if ((foundations?.bituminousWaterProofing ?? false) == false) {
      // TODO: Why are we counting tons here?
      foundationsConcreteVolume = Utils.sumOrNull([
        foundations?.concreteBlockVolume,
        foundations?.concreteTons,
        foundations?.rebarTons,
        foundations?.concreteBlockVolume,
        foundations?.concreteBlockTons
      ]);
    }

    if ((totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
            false) ==
        true) {
      intermediateFloorsConcreteVolume = Utils.sumOrNull([
        intermediateFloorsConcreteVolume,
        totalIntermediateFloors?.hollowCoreSlabConcreteVolume
      ]);
    }

    if ((totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)) {
      buildingFrameConcreteVolume = Utils.sumOrNull([
        buildingFrameConcreteVolume,
        totalBuildingFrame?.concreteVerticalColumnsPart.concreteVolume,
        totalBuildingFrame
            ?.concreteElementWallsWithoutFrameworkPart.concreteVolume
      ]);
    }

    return Utils.sumOrNull([
      foundationsConcreteVolume,
      intermediateFloorsConcreteVolume,
      roofsConcreteVolume,
      buildingFrameConcreteVolume,
      internalWallFramesAndSurfaceMaterial
          ?.totalConcreteElementOrCastingWallsVolume
    ]);
  }

  num? get _concreteTons {
    num? foundationsConcreteTons;
    var intermediateFloorsConcreteTons =
        totalIntermediateFloors?.concreteCastingConcreteTons;
    var roofsConcreteTons = (totalRoofs?.roofTrussesAreRecyclable ?? false)
        ? null
        : totalRoofs?.concreteTons;
    var buildingFrameConcreteTons = totalBuildingFrame?.plasterCoatingTons;

    if ((foundations?.bituminousWaterProofing ?? false) == false) {
      // TODO: Why are we counting tons here?
      foundationsConcreteTons = Utils.sumOrNull([
        foundations?.concreteBlockTons,
        foundations?.concreteTons,
        foundations?.rebarTons,
        foundations?.concreteBlockTons,
        foundations?.concreteBlockTons
      ]);
    }

    if ((totalIntermediateFloors?.hollowCoreSlabsAndGlulamBeamRecyclable ??
            false) ==
        true) {
      intermediateFloorsConcreteTons = Utils.sumOrNull([
        intermediateFloorsConcreteTons,
        totalIntermediateFloors?.hollowCoreSlabConcreteTons
      ]);
    }

    if ((totalBuildingFrame?.buildingFrame?.areMaterialsRecyclable ?? false)) {
      buildingFrameConcreteTons = Utils.sumOrNull([
        buildingFrameConcreteTons,
        totalBuildingFrame?.concreteVerticalColumnsPart.concreteTons,
        totalBuildingFrame
            ?.concreteElementWallsWithoutFrameworkPart.concreteTons
      ]);
    }

    return Utils.sumOrNull([
      foundationsConcreteTons,
      intermediateFloorsConcreteTons,
      roofsConcreteTons,
      buildingFrameConcreteTons,
      internalWallFramesAndSurfaceMaterial
          ?.totalConcreteElementOrCastingWallsTons
    ]);
  }
}
