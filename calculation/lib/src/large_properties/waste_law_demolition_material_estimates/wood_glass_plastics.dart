import 'package:freezed_annotation/freezed_annotation.dart';

part 'wood_glass_plastics.freezed.dart';
part 'wood_glass_plastics.g.dart';

/// puu, lasi ja muovit
@freezed
abstract class WoodGlassPlastics with _$WoodGlassPlastics {
  WoodGlassPlastics._();

  factory WoodGlassPlastics({
    String? woodNotes,
    String? glassNotes,
    String? plasticNotes,
    String? otherDangerousOrContaminatedMaterialsNotes,
  }) = _WoodGlassPlastics;

  factory WoodGlassPlastics.fromJson(Map<String, dynamic> json) =>
      _$WoodGlassPlasticsFromJson(json);
}
