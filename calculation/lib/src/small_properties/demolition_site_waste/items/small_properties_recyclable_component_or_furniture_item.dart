import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'small_properties_recyclable_component_or_furniture_item.freezed.dart';

@freezed
abstract class SmallPropertiesRecyclableComponentOrFurnitureItem
    with _$SmallPropertiesRecyclableComponentOrFurnitureItem {
  const SmallPropertiesRecyclableComponentOrFurnitureItem._();

  const factory SmallPropertiesRecyclableComponentOrFurnitureItem(
      {num? quantityEstimate,
      num? pcs,
      String? exploitingOrProcessingOrFinalDisposalSite,
      num? handlingAndDismantlingCost,
      num? unitPrice}) = _SmallPropertiesRecyclableComponentOrFurnitureItem;

  num? get demolitionCostPerMaterialBatch =>
      Utils.multiplyOrNull([quantityEstimate, handlingAndDismantlingCost]);

  num? get batchPrice => Utils.sumOrNull([pcs, unitPrice]);
}
