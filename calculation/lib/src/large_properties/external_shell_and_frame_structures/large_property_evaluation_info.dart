import 'package:freezed_annotation/freezed_annotation.dart';

part 'large_property_evaluation_info.freezed.dart';
part 'large_property_evaluation_info.g.dart';

@freezed
abstract class LargePropertyEvaluationInfo with _$LargePropertyEvaluationInfo {
  const factory LargePropertyEvaluationInfo(
      {String? propertyName,
      String? buildingType,
      String? address,
      String? municipality,
      String? author,
      String? date,
      String? version,
      String? description}) = _LargePropertyEvaluationInfo;

  factory LargePropertyEvaluationInfo.fromJson(Map<String, dynamic> json) =>
      _$LargePropertyEvaluationInfoFromJson(json);
}
