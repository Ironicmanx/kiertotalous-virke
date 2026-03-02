import 'package:freezed_annotation/freezed_annotation.dart';

import 'waste_law_demolition_material_estimate_entry.dart';

part 'bituminous_mixtures_coal_tar_products.freezed.dart';
part 'bituminous_mixtures_coal_tar_products.g.dart';

/// bitumiseokset, kivihiiliterva ja -tervatuotteet
@freezed
abstract class BituminousMixturesCoalTarProducts
    with _$BituminousMixturesCoalTarProducts {
  BituminousMixturesCoalTarProducts._();

  factory BituminousMixturesCoalTarProducts(
          {String? coalTarContainingBituminousMixturesNotes,
          WasteLawDemolitionMaterialEstimateEntry? otherBituminousMixtures,
          WasteLawDemolitionMaterialEstimateEntry? unnamed,
          WasteLawDemolitionMaterialEstimateEntry? coalTarAndTarProducts}) =
      _BituminousMixturesCoalTarProducts;

  factory BituminousMixturesCoalTarProducts.fromJson(
          Map<String, dynamic> json) =>
      _$BituminousMixturesCoalTarProductsFromJson(json);
}
