import '../../../../../bl_demolition_materials.dart';
import '../../../../utils/utils.dart';
import '../exports.dart';

abstract class BuildingFramePart {
  final num? portionPercentage;

  final TotalBuildingFrame? totalBuildingFrame;

  BuildingFramePart({this.totalBuildingFrame, this.portionPercentage});

  num? get area => Utils.multiplyOrNull([
        totalBuildingFrame?.externalWallsPerimeter,
        totalBuildingFrame?.externalWallsHeight,
        Utils.percentageToFraction(portionPercentage)
      ]);
}
