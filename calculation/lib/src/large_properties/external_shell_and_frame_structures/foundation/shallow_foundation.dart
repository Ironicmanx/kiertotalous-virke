import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../data_types/exports.dart';
import '../../demolition_materials/foundation_and_floors_demolition_materials.dart';
import 'foundation.dart';

part 'shallow_foundation.freezed.dart';
part 'shallow_foundation.g.dart';

@freezed
abstract class ShallowFoundation extends Foundation with _$ShallowFoundation {
  ShallowFoundation._();

  factory ShallowFoundation({num? area, num? circumference}) =
      _ShallowFoundation;

  factory ShallowFoundation.fromJson(Map<String, dynamic> json) =>
      _$ShallowFoundationFromJson(json);

  late final _frostProofStyrofoamShallowFoundation =
      FrostProofStyrofoamShallowFoundation(this);
  late final _finnFoamShallowFoundation = FinnFoamShallowFoundation(this);
  late final _vaporBarrierPlasticShallowFoundation =
      VaporBarrierPlasticShallowFoundation(this);
  late final _reinforcedConcreteSlabShallowFoundationGroundFloor =
      ReinforcedConcreteSlabShallowFoundationGroundFloor(this);
  late final _hotBitumenBrushingShallowFoundationGroundFloor =
      HotBitumenBrushingShallowFoundationGroundFloor(this);
  late final _mineralWoolShallowFoundationGroundFloor =
      MineralWoolShallowFoundationGroundFloor(this);
  late final _styrofoamShallowFoundationGroundFloor =
      StyrofoamShallowFoundationGroundFloor(this);
  late final _concreteCastingShallowFoundationGroundFloor =
      ConcreteCastingShallowFoundationGroundFloor(this);

  @override
  num? get concreteVolume => Utils.sumOrNull([
        _reinforcedConcreteSlabShallowFoundationGroundFloor.volume,
        _concreteCastingShallowFoundationGroundFloor.volume
      ]);

  @override
  num? get concreteTons => Utils.sumOrNull([
        _reinforcedConcreteSlabShallowFoundationGroundFloor.concreteTons,
        _concreteCastingShallowFoundationGroundFloor.concreteTons
      ]);

  @override
  num? get rebarTons => Utils.sumOrNull([
        _reinforcedConcreteSlabShallowFoundationGroundFloor.steelTons,
        _concreteCastingShallowFoundationGroundFloor.steelTons
      ]);

  @override
  num? get concreteBlockVolume => 0;

  @override
  num? get concreteBlockTons => 0;

  @override
  num? get mineralWoolVolume => _mineralWoolShallowFoundationGroundFloor.volume;

  @override
  num? get mineralWoolTons => _mineralWoolShallowFoundationGroundFloor.tons;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamShallowFoundation.volume,
        _finnFoamShallowFoundation.volume,
        _vaporBarrierPlasticShallowFoundation.volume,
        _styrofoamShallowFoundationGroundFloor.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamShallowFoundation.tons,
        _finnFoamShallowFoundation.tons,
        _vaporBarrierPlasticShallowFoundation.tons,
        // TODO _styrofoamShallowFoundationGroundFloor.tons is not added here. This is according
        // to spec, but feels wrong.
      ]);

  @override
  num? get woodShavingsVolume => 0;

  @override
  num? get woodShavingsTons => 0;

  @override
  num? get solidBoardingAndWoodFrameVolume => 0;

  @override
  num? get solidBoardingAndWoodFrameTons => 0;

  @override
  num? get combustibleWasteVolume => 0;

  @override
  num? get combustibleWasteTons => 0;

  @override
  num? get hotBitumenCoatingVolume =>
      _hotBitumenBrushingShallowFoundationGroundFloor.volume;

  @override
  num? get hotBitumenCoatingTons =>
      _hotBitumenBrushingShallowFoundationGroundFloor.tons;

  @override
  FoundationMaterial? get material => null;
}
