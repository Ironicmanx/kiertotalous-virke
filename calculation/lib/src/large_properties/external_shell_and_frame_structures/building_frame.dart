import 'package:freezed_annotation/freezed_annotation.dart';

part 'building_frame.freezed.dart';
part 'building_frame.g.dart';

@freezed
abstract class BuildingFrame with _$BuildingFrame {
  const BuildingFrame._();

  const factory BuildingFrame(
      {@Default(false) bool useFoundationCircumference,
      num? externalWallsPerimeter,
      num? externalWallsAverageHeight,
      @Default(false) bool areMaterialsRecyclable,
      num? woodPortionPercentage,
      num? glulamVerticalColumnsPortionPercentage,
      num? concreteVerticalColumnsPortionPercentage,
      num? steelVerticalColumnsPortionPercentage,
      num? doubleLoadBearingBrickWallPortionPercentage,
      num? concreteElementWallsWithoutFrameworkPortionPercentage,
      num? brickCladWallPortionPercentage,
      num? boardWallPortionPercentage,
      num? profiledSheetMetalPortionPercentage,
      num? steelProfileSandwichStructurePortionPercentage,
      num? mineriteOrOtherStoneBoardPortionPercentage}) = _BuildingFrame;

  factory BuildingFrame.fromJson(Map<String, dynamic> json) =>
      _$BuildingFrameFromJson(json);
}
