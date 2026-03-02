import 'package:freezed_annotation/freezed_annotation.dart';

import '../../demolition_material_assessment/total/exports.dart';
import '../exports.dart';

part 'total_bituminous_mixtures_coal_tar_products.freezed.dart';

/// bitumiseokset, kivihiiliterva ja -tervatuotteet
@freezed
abstract class TotalBituminousMixturesCoalTarProducts
    with _$TotalBituminousMixturesCoalTarProducts {
  TotalBituminousMixturesCoalTarProducts._();

  factory TotalBituminousMixturesCoalTarProducts(
          {BituminousMixturesCoalTarProducts? bituminousMixturesCoalTarProducts,
          TotalDemolitionWasteAndCosts? totalDemolitionWasteAndCosts}) =
      _TotalBituminousMixturesCoalTarProducts;

  late final coalTarContainingBituminousMixtures =
      WasteLawDemolitionMaterialEstimateEntry(
          volume: totalDemolitionWasteAndCosts
              ?.totalDisposalMaterialsAndHazardousWaste?.bitumen.volume,
          tons: totalDemolitionWasteAndCosts
              ?.totalDisposalMaterialsAndHazardousWaste?.bitumen.tons,
          notes: bituminousMixturesCoalTarProducts
              ?.coalTarContainingBituminousMixturesNotes);

  WasteLawDemolitionMaterialEstimateEntry? get otherBituminousMixtures =>
      bituminousMixturesCoalTarProducts?.otherBituminousMixtures;
  WasteLawDemolitionMaterialEstimateEntry? get unnamed =>
      bituminousMixturesCoalTarProducts?.unnamed;
  WasteLawDemolitionMaterialEstimateEntry? get coalTarAndTarProducts =>
      bituminousMixturesCoalTarProducts?.coalTarAndTarProducts;
}
