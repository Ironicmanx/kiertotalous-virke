import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'small_properties_waste_disposal_item.freezed.dart';

@freezed
abstract class SmallPropertiesWasteDisposalItem
    with _$SmallPropertiesWasteDisposalItem {
  const SmallPropertiesWasteDisposalItem._();

  const factory SmallPropertiesWasteDisposalItem(
      {num? quantityEstimate,
      String? exploitingOrProcessingOrFinalDisposalSite,
      num? demolitionOrProcessingCost}) = _SmallPropertiesWasteDisposalItem;

  num? get demolitionBatchPrice =>
      Utils.multiplyOrNull([quantityEstimate, demolitionOrProcessingCost]);
}
