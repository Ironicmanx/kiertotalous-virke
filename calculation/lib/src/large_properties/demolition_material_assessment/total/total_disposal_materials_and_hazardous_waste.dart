import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../external_shell_and_frame_structures/exports.dart';
import '../../partition_walls_doors_and_windows/exports.dart';
import '../disposal_materials_and_hazardous_waste.dart';
import '../items/exports.dart';

part 'total_disposal_materials_and_hazardous_waste.freezed.dart';

/// Loppusijoitettavat materiaalit ja ongelmajätteet
@freezed
abstract class TotalDisposalMaterialsAndHazardousWaste
    with _$TotalDisposalMaterialsAndHazardousWaste {
  TotalDisposalMaterialsAndHazardousWaste._();

  factory TotalDisposalMaterialsAndHazardousWaste(
          {DisposalMaterialsAndHazardousWaste? disposalMaterialsAndHazardousWaste,
          ExcavationArea? excavationArea,
          Cellar? cellar,
          FixedFurniture? fixedFurniture,
          FloorStructures? floorStructures,
          Foundations? foundations,
          InternalWallFramesAndSurfaceMaterial?
              internalWallFramesAndSurfaceMaterial}) =
      _TotalDisposalMaterialsAndHazardousWaste;

  /// Kierrätyskelvoton tiilijäte
  late final nonRecyclableBrickWaste = WasteDisposalItem(
      volume: cellar?.brickVolume,
      tons: cellar?.brickTons,
      demolitionOrProcessingCost: disposalMaterialsAndHazardousWaste
          ?.nonRecyclableBrickWasteDemolitionOrProcessingCost);

  /// Saastunut maa
  late final contaminatedSoil = WasteDisposalItem(
      volume: excavationArea?.contaminatedSoil,
      tons: excavationArea?.contaminatedLandTons,
      demolitionOrProcessingCost: disposalMaterialsAndHazardousWaste
          ?.contaminatedSoilDemolitionOrProcessingCost);

  /// Asbestia tai BCP maalia sisältävä betoni (bitumi ja akryylipinnoitettu)
  late final asbestosOrBCPConcrete = WasteDisposalItem(
      volume: Utils.sumOrNull([
        (foundations?.bituminousWaterProofing ?? false)
            ? Utils.sumOrNull([
                // TODO: I don't know why we use tons here to calculate volume.
                // This is according to spec, but a bit fishy regardless.
                foundations?.concreteVolume,
                foundations?.concreteTons,
                foundations?.rebarTons,
                foundations?.concreteBlockVolume,
                foundations?.concreteBlockTons
              ])
            : null,
        cellar?.concreteVolume,
        cellar?.brickVolume,
        (internalWallFramesAndSurfaceMaterial
                    ?.surfaceMaterialCoatingContainsAsbestos ??
                false)
            ? internalWallFramesAndSurfaceMaterial?.totalPlasticCarpetVolume
            : null
      ]),
      tons: Utils.sumOrNull([
        (foundations?.bituminousWaterProofing ?? false)
            ? Utils.sumOrNull([
                // TODO: This also seems fishy. Check above.
                foundations?.concreteTons,
              ])
            : null,
        cellar?.concreteTons,
        cellar?.brickTons,
        (internalWallFramesAndSurfaceMaterial
                    ?.surfaceMaterialCoatingContainsAsbestos ??
                false)
            ? internalWallFramesAndSurfaceMaterial?.totalPlasticCarpetTons
            : null
      ]),
      demolitionOrProcessingCost: disposalMaterialsAndHazardousWaste
          ?.asbestosOrBCPConcreteDemolitionOrProcessingCost);

  /// Bitumi
  late final bitumen = WasteDisposalItem(
      volume: Utils.sumOrNull([
        foundations?.hotBitumenCoatingVolume,
        cellar?.hotBitumenCoatingVolume
      ]),
      tons: Utils.sumOrNull(
          [foundations?.hotBitumenCoatingTons, cellar?.hotBitumenCoatingTons]),
      demolitionOrProcessingCost: disposalMaterialsAndHazardousWaste
          ?.bitumenDemolitionOrProcessingCost);

  /// Mineriitti, tiilet, tiilikate, kattohuopa, kaakelilaatat yms. sisältää asbestia
  late final otherAsbestosContainingMaterial = WasteDisposalItem(
      volume: Utils.sumOrNull([
        (floorStructures?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? floorStructures?.ceramicTileFloorVolume
            : null,
        (internalWallFramesAndSurfaceMaterial
                    ?.surfaceMaterialCoatingContainsAsbestos ??
                false)
            ? internalWallFramesAndSurfaceMaterial?.totalCeramicTileWallsVolume
            : null,
        (fixedFurniture?.isFurnitureRecyclable ?? false)
            ? fixedFurniture?.ceramicVolume
            : null
      ]),
      tons: Utils.sumOrNull([
        (floorStructures?.surfaceMaterialCoatingContainsAsbestos ?? false)
            ? floorStructures?.ceramicTileFloorTons
            : null,
        (internalWallFramesAndSurfaceMaterial
                    ?.surfaceMaterialCoatingContainsAsbestos ??
                false)
            ? internalWallFramesAndSurfaceMaterial?.totalCeramicTileWallsTons
            : null,
        (fixedFurniture?.isFurnitureRecyclable ?? false)
            ? fixedFurniture?.ceramicTons
            : null
      ]),
      demolitionOrProcessingCost: disposalMaterialsAndHazardousWaste
          ?.otherAsbestosContainingMaterialDemolitionOrProcessingCost);

  List<WasteDisposalItem> get all => [
        nonRecyclableBrickWaste,
        asbestosOrBCPConcrete,
        bitumen,
        otherAsbestosContainingMaterial
      ];

  num? get totalVolume =>
      all.fold<num>(0, (acc, element) => acc + (element.volume ?? 0));

  num? get totalTons =>
      all.fold<num>(0, (acc, element) => acc + (element.tons ?? 0));

  num? get totalBatchPrice =>
      all.fold<num>(0, (acc, element) => acc + (element.batchPrice ?? 0));
}
