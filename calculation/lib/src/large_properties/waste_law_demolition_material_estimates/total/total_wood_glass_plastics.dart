import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../demolition_material_assessment/total/exports.dart';
import '../exports.dart';

part 'total_wood_glass_plastics.freezed.dart';

/// puu, lasi ja muovit
@freezed
abstract class TotalWoodGlassPlastics with _$TotalWoodGlassPlastics {
  TotalWoodGlassPlastics._();

  factory TotalWoodGlassPlastics(
          {WoodGlassPlastics? woodGlassPlastics,
          TotalDemolitionWasteAndCosts? totalDemolitionWasteAndCosts}) =
      _TotalWoodGlassPlastics;

  late final wood = WasteLawDemolitionMaterialEstimateEntry(
      volume: Utils.sumOrNull([
        totalDemolitionWasteAndCosts
            ?.totalReusableAndRecyclableMaterials?.cleanUsableWood.volume,
        totalDemolitionWasteAndCosts
            ?.totalReusableAndRecyclableMaterials?.combustibleWoodWaste.volume,
      ]),
      tons: Utils.sumOrNull([
        totalDemolitionWasteAndCosts
            ?.totalReusableAndRecyclableMaterials?.cleanUsableWood.tons,
        totalDemolitionWasteAndCosts
            ?.totalReusableAndRecyclableMaterials?.combustibleWoodWaste.tons,
      ]),
      notes: woodGlassPlastics?.woodNotes);

  late final glass = WasteLawDemolitionMaterialEstimateEntry(
      volume: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.glass.volume,
      tons: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.glass.tons,
      notes: woodGlassPlastics?.glassNotes);

  late final plastic = WasteLawDemolitionMaterialEstimateEntry(
      volume: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.plasticWaste.volume,
      tons: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.plasticWaste.tons,
      notes: woodGlassPlastics?.plasticNotes);

  late final otherDangerousOrContaminatedMaterial =
      WasteLawDemolitionMaterialEstimateEntry(
          volume: totalDemolitionWasteAndCosts
              ?.totalDisposalMaterialsAndHazardousWaste
              ?.asbestosOrBCPConcrete
              .volume,
          tons: totalDemolitionWasteAndCosts
              ?.totalDisposalMaterialsAndHazardousWaste
              ?.asbestosOrBCPConcrete
              .tons,
          notes: woodGlassPlastics?.otherDangerousOrContaminatedMaterialsNotes);
}
