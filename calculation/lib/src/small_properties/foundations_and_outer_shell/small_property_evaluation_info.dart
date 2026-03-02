import 'package:freezed_annotation/freezed_annotation.dart';

part 'small_property_evaluation_info.freezed.dart';
part 'small_property_evaluation_info.g.dart';

@freezed
abstract class SmallPropertyEvaluationInfo with _$SmallPropertyEvaluationInfo {
  const factory SmallPropertyEvaluationInfo({
    String? propertyName,
    String? buildingType,
    String? address,
    @Default(false) bool isHazardousSubstanceSurveyDone,
  }) = _SmallPropertyEvaluationInfo;

  factory SmallPropertyEvaluationInfo.fromJson(Map<String, dynamic> json) =>
      _$SmallPropertyEvaluationInfoFromJson(json);
}
