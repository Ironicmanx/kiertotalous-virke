import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/utils.dart';

part 'doors_info.freezed.dart';
part 'doors_info.g.dart';

@freezed
abstract class DoorsInfo with _$DoorsInfo {
  const DoorsInfo._();

  const factory DoorsInfo({
    num? shutDoors,
    num? glassDoors,
  }) = _DoorsInfo;

  factory DoorsInfo.fromJson(Map<String, dynamic> json) =>
      _$DoorsInfoFromJson(json);

  num? get doorCount => Utils.sumOrNull([shutDoors, glassDoors]);
}
