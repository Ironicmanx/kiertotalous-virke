import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'waste_cost_item.freezed.dart';

/// A separate item in 'Purkujätteet ja kustannukset'
@freezed
abstract class WasteCostItem with _$WasteCostItem {
  const WasteCostItem._();

  const factory WasteCostItem({
    num? volume,
    num? tons,
    num? demolitionCost,
  }) = _WasteCostItem;

  num? get batchPrice => Utils.multiplyOrNull([tons, demolitionCost]);
}
