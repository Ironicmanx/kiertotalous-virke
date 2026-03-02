import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../bl_demolition_materials.dart';
import '../../../shared/water_roof_type.dart';
import '../../../utils/utils.dart';

part 'total_roofs.freezed.dart';

@freezed
abstract class TotalRoofs with _$TotalRoofs {
  TotalRoofs._();

  late final _woodenTrussRidgeOrGableRoof = WoodenTrussRidgeOrGableRoof(this);
  late final _steelTrussRidgeOrGableRoof = SteelTrussRidgeOrGableRoof(this);
  late final _concreteColumnRidgeOrGableRoof =
      ConcreteColumnRidgeOrGableRoof(this);
  late final _woodenTrussFlatOrMonoPitchedRoof =
      WoodenTrussFlatOrMonoPitchedRoof(this);
  late final _steelTrussFlatOrMonoPitchedRoof =
      SteelTrussFlatOrMonoPitchedRoof(this);
  late final _concreteColumnFlatOrMonoPitchedRoof =
      ConcreteColumnFlatOrMonoPitchedRoof(this);
  late final _roofBracketsFlatOrMonoPitchedRoof =
      RoofBracketsFlatOrMonoPitchedRoof(this);
  late final _woodenUnderPlankingWaterRoof = WoodenUnderPlankingWaterRoof(this);
  late final _windProofWoolWaterRoof = WindProofWoolWaterRoof(this);
  late final _underLayWaterRoof = UnderLayWaterRoof(this);
  late final _roofSheetWaterRoof = RoofSheetWaterRoof(this);
  late final _feltRoofWaterRoof = FeltRoofWaterRoof(this);
  late final _mineriteCoveringWaterRoof = MineriteCoveringWaterRoof(this);
  late final _roofTileWaterRoof = RoofTileWaterRoof(this);

  factory TotalRoofs({Foundations? foundations, Roofs? roofs}) = _TotalRoofs;

  num? get calculatedCeilingArea {
    if (useDefaultDimensions == null &&
        foundations?.area == null &&
        ceilingArea == null) {
      return null;
    }

    if (useDefaultDimensions == true && foundations?.area != null) {
      return foundations!.area;
    }

    return ceilingArea;
  }

  num? get defaultRidgeOrGableRoofCeilingArea {
    if (ridgeOrGableRoofPortionPercentage == null ||
        calculatedCeilingArea == null ||
        roofs == null) {
      return null;
    }

    late final num targetArea;

    if (calculatedCeilingArea == foundations?.area) {
      targetArea = foundations!.area! *
          (Utils.percentageToFraction(
                  roofs!.ridgeOrGableRoofSlopeRatioFactorPercentage)! +
              1);
    } else {
      targetArea = calculatedCeilingArea!;
    }

    return targetArea *
        Utils.percentageToFraction(ridgeOrGableRoofPortionPercentage)!;
  }

  num? get defaultFlatOrMonoPitchedRoofCeilingArea {
    if (flatOrMonoPitchedRoofPortionPercentage == null ||
        calculatedCeilingArea == null ||
        roofs == null) {
      return null;
    }

    late final num targetArea;

    if (calculatedCeilingArea == foundations?.area) {
      targetArea = foundations!.area! *
          (roofs!.flatOrMonoPitchedRoofEaveOverhangAddition + 1);
    } else {
      targetArea = calculatedCeilingArea!;
    }

    return targetArea *
        Utils.percentageToFraction(flatOrMonoPitchedRoofPortionPercentage)!;
  }

  num? get roofBaseArea => foundations?.area;

  RoofType? get ridgeOrGableRoofType => roofs?.ridgeOrGableRoofType;

  RoofType? get flatOrMonoPitchedRoofType => roofs?.flatOrMonoPitchedRoofType;

  WaterRoofType? get flatOrMonoPitchedWaterRoofType =>
      roofs?.flatOrMonoPitchedWaterRoofType;

  WaterRoofType? get ridgeOrGableWaterRoofType =>
      roofs?.ridgeOrGableWaterRoofType;

  num? get ceilingArea => roofs?.ceilingArea;

  num? get ridgeOrGableRoofPortionPercentage =>
      roofs?.ridgeOrGableRoofPortionPercentage;

  num? get flatOrMonoPitchedRoofPortionPercentage =>
      roofs?.flatOrMonoPitchedRoofPortionPercentage;

  bool? get useDefaultDimensions => roofs?.useDefaultDimensions;

  bool? get roofTrussesAreRecyclable => roofs?.roofTrussesAreRecyclable;

  num? get totalArea => Utils.sumOrNull([
        defaultRidgeOrGableRoofCeilingArea,
        defaultFlatOrMonoPitchedRoofCeilingArea
      ]);

  num? get ridgeOrGableRoofArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(ridgeOrGableRoofPortionPercentage)
      ]);

  num? get flatOrMonoPitchedRoofArea => Utils.multiplyOrNull([
        totalArea,
        Utils.percentageToFraction(flatOrMonoPitchedRoofPortionPercentage)
      ]);

  num? get woodVolume => Utils.sumOrNull([
        _woodenTrussRidgeOrGableRoof.woodVolume,
        _woodenTrussFlatOrMonoPitchedRoof.woodVolume, // should be 7.5
        _roofBracketsFlatOrMonoPitchedRoof.woodVolume,
        _woodenUnderPlankingWaterRoof.woodVolume
      ]);

  num? get woodTons => Utils.sumOrNull([
        _woodenTrussRidgeOrGableRoof.woodTons,
        _woodenTrussFlatOrMonoPitchedRoof.woodTons,
        _roofBracketsFlatOrMonoPitchedRoof.woodTons,
        _woodenUnderPlankingWaterRoof.woodTons
      ]);

  num? get steelTons => Utils.sumOrNull([
        _steelTrussRidgeOrGableRoof.steelTons,
        _steelTrussFlatOrMonoPitchedRoof.steelTons,
        _roofSheetWaterRoof.steelTons
      ]);

  num? get concreteVolume => Utils.sumOrNull([
        _concreteColumnRidgeOrGableRoof.concreteVolume,
        _concreteColumnFlatOrMonoPitchedRoof.concreteVolume
      ]);

  num? get concreteTons => Utils.sumOrNull([
        _concreteColumnRidgeOrGableRoof.concreteTons,
        _concreteColumnFlatOrMonoPitchedRoof.concreteTons
      ]);

  num? get insulationVolume => _windProofWoolWaterRoof.volume;

  num? get insulationTons => _windProofWoolWaterRoof.tons;

  num? get underlayVolume => _underLayWaterRoof.volume;

  num? get underlayTons => _underLayWaterRoof.tons;

  num? get bitumenVolume => _feltRoofWaterRoof.volume;

  num? get bitumenTons => _feltRoofWaterRoof.tons;

  num? get mineriteVolume => _mineriteCoveringWaterRoof.volume;

  num? get mineriteTons => _mineriteCoveringWaterRoof.tons;

  num? get roofTileVolume => _roofTileWaterRoof.volume;

  num? get roofTileTons => _roofTileWaterRoof.tons;
}
