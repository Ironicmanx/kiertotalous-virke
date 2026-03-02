import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bl_demolition_materials.dart';
import '../../../../utils/utils.dart';
import '../../../demolition_materials/outer_walls_and_frame_demolition_materials.dart';
import '../exports.dart';
import 'structural_building_frame_part.dart';

part 'glulam_beams_frame_part.freezed.dart';

@freezed
abstract class GlulamBeamsFramePart extends StructuralBuildingFramePart
    with _$GlulamBeamsFramePart {
  GlulamBeamsFramePart._();

  factory GlulamBeamsFramePart(
      {TotalBuildingFrame? totalBuildingFrame,
      num? portionPercentage}) = _GlulamBeamsFramePart;

  late final VerticalGlulamBeamsFrame? glulamBeamsFrame =
      VerticalGlulamBeamsFrame(totalBuildingFrame);

  @override
  num? get woodVolume {
    if (portionPercentage == null || glulamBeamsFrame?.woodVolume == null) {
      return null;
    }

    return Utils.percentageToFraction(portionPercentage)! *
        glulamBeamsFrame!.woodVolume!;
  }

  @override
  num? get woodTons {
    if (portionPercentage == null || glulamBeamsFrame?.woodVolume == null) {
      return null;
    }

    return Utils.percentageToFraction(portionPercentage)! *
        glulamBeamsFrame!.woodTons!;
  }
}
