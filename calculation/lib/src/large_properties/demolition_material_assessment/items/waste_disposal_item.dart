import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';

part 'waste_disposal_item.freezed.dart';

@freezed
abstract class WasteDisposalItem with _$WasteDisposalItem {
  const WasteDisposalItem._();

  const factory WasteDisposalItem(
      {num? volume,
      num? tons,
      num? demolitionOrProcessingCost}) = _WasteDisposalItem;

  num? get batchPrice =>
      Utils.multiplyOrNull([tons, demolitionOrProcessingCost]);
}
