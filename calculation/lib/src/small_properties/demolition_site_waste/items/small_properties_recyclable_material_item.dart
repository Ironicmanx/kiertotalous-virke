import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'small_properties_recyclable_material_item.freezed.dart';

@freezed
abstract class SmallPropertiesRecyclableMaterialItem
    with _$SmallPropertiesRecyclableMaterialItem {
  const SmallPropertiesRecyclableMaterialItem._();

  const factory SmallPropertiesRecyclableMaterialItem(
      {num? quantityEstimate,
      String? exploitingOrProcessingOrFinalDisposalSite,
      num? handlingAndDismantlingCost,
      num? materialValue}) = _SmallPropertiesRecyclableMaterialItem;

  num? get demolitionCostPerMaterialBatch =>
      Utils.multiplyOrNull([quantityEstimate, handlingAndDismantlingCost]);

  num? get batchPrice => Utils.sumOrNull([quantityEstimate, materialValue]);
}
