import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'recyclable_item.freezed.dart';

@freezed
abstract class RecyclableItem with _$RecyclableItem {
  const RecyclableItem._();

  const factory RecyclableItem({
    num? size,
    num? volume,
    num? tons,
    num? unitPrice,
  }) = _RecyclableItem;

  num? get batchPrice => Utils.sumOrNull([unitPrice, tons]);
}
