import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../demolition_material_assessment/total/exports.dart';
import '../exports.dart';

part 'total_metals_and_alloys.freezed.dart';

/// metallit, niiden seokset (lejeeringit) mukaan luettuina
@freezed
abstract class TotalMetalsAndAlloys with _$TotalMetalsAndAlloys {
  TotalMetalsAndAlloys._();

  factory TotalMetalsAndAlloys(
          {MetalsAndAlloys? metalAndAlloys,
          TotalDemolitionWasteAndCosts? totalDemolitionWasteAndCosts}) =
      _TotalMetalsAndAlloys;

  late final copperBronzeAndBrass = WasteLawDemolitionMaterialEstimateEntry(
      tons: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.copper.tons,
      notes: metalAndAlloys?.copperBronzeAndBrassNotes);

  late final aluminium = WasteLawDemolitionMaterialEstimateEntry(
      tons: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.aluminium.tons,
      notes: metalAndAlloys?.aluminiumNotes);

  late final ironAndSteel = WasteLawDemolitionMaterialEstimateEntry(
      tons: totalDemolitionWasteAndCosts
          ?.totalReusableAndRecyclableMaterials?.rebarAndSteelScrap.tons,
      notes: metalAndAlloys?.ironAndSteelNotes);

  late final mixedMetals = WasteLawDemolitionMaterialEstimateEntry(
      tons: Utils.sumOrNull([
        totalDemolitionWasteAndCosts
            ?.totalReusableAndRecyclableMaterials?.eWaste.tons,
        totalDemolitionWasteAndCosts
            ?.totalReusableAndRecyclableMaterials?.stainlessSteel.tons
      ]),
      notes: metalAndAlloys?.mixedMetalsNotes);

  WasteLawDemolitionMaterialEstimateEntry? get lead => metalAndAlloys?.lead;

  WasteLawDemolitionMaterialEstimateEntry? get zinc => metalAndAlloys?.zinc;

  WasteLawDemolitionMaterialEstimateEntry? get tin => metalAndAlloys?.tin;

  WasteLawDemolitionMaterialEstimateEntry? get contaminatedMetalWaste =>
      metalAndAlloys?.contaminatedMetalWaste;

  WasteLawDemolitionMaterialEstimateEntry? get hazardousOilAndTarCables =>
      metalAndAlloys?.hazardousOilAndTarCables;

  WasteLawDemolitionMaterialEstimateEntry? get otherCables =>
      metalAndAlloys?.otherCables;
}
