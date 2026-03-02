import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../data_types/exports.dart';
import '../../demolition_materials/foundation_and_floors_demolition_materials.dart';
import 'foundation.dart';

part 'hollow_core_slab_foundation.freezed.dart';
part 'hollow_core_slab_foundation.g.dart';

@freezed
abstract class HollowCoreSlabFoundation extends Foundation
    with _$HollowCoreSlabFoundation {
  HollowCoreSlabFoundation._();

  factory HollowCoreSlabFoundation(
      {num? area,
      num? circumference,
      @Default(FoundationMaterial.concreteCasting)
      FoundationMaterial? material}) = _HollowCoreSlabFoundation;

  factory HollowCoreSlabFoundation.fromJson(Map<String, dynamic> json) =>
      _$HollowCoreSlabFoundationFromJson(json);

  late final _reinforcedConcreteColumnHollowCoreSlabFoundation =
      ReinforcedConcreteColumnHollowCoreSlabFoundation(this);
  late final _concreteBlockHollowCoreSlabFoundation =
      ConcreteBlockHollowCoreSlabFoundation(this);
  late final _frostProofStyrofoamHollowCoreSlabFoundation =
      FrostProofStyrofoamHollowCoreSlabFoundation(this);
  late final _finnFoamHollowCoreSlabFoundation =
      FinnFoamHollowCoreSlabFoundation(this);
  late final _vaporBarrierPlasticHollowCoreSlabFoundation =
      VaporBarrierPlasticHollowCoreSlabFoundation(this);
  late final _hollowCoreSlabHollowCoreSlabFoundationGroundFloor =
      HollowCoreSlabHollowCoreSlabFoundationGroundFloor(this);
  late final _hotBitumenBrushingHollowCoreSlabFoundationGroundFloor =
      HotBitumenBrushingHollowCoreSlabFoundationGroundFloor(this);
  late final _mineralWoolHollowCoreSlabFoundationGroundFloor =
      MineralWoolHollowCoreSlabFoundationGroundFloor(this);
  late final _styrofoamHollowCoreSlabFoundationGroundFloor =
      StyrofoamHollowCoreSlabFoundationGroundFloor(this);
  late final _concreteCastingHollowCoreSlabFoundationGroundFloor =
      ConcreteCastingHollowCoreSlabFoundationGroundFloor(this);

  @override
  num? get concreteVolume => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteColumnHollowCoreSlabFoundation.volume
            : null,
        _hollowCoreSlabHollowCoreSlabFoundationGroundFloor.volume,
        _concreteCastingHollowCoreSlabFoundationGroundFloor.volume
      ]);

  @override
  num? get concreteTons => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteColumnHollowCoreSlabFoundation.concreteTons
            : null,
        _hollowCoreSlabHollowCoreSlabFoundationGroundFloor.concreteTons,
        _concreteCastingHollowCoreSlabFoundationGroundFloor.concreteTons
      ]);

  @override
  num? get rebarTons => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteColumnHollowCoreSlabFoundation.steelTons
            : null,
        _concreteCastingHollowCoreSlabFoundationGroundFloor.steelTons
      ]);

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteBlock
      ? _concreteBlockHollowCoreSlabFoundation.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteBlock
      ? _concreteBlockHollowCoreSlabFoundation.tons
      : 0;

  @override
  num? get mineralWoolVolume =>
      _mineralWoolHollowCoreSlabFoundationGroundFloor.volume;

  @override
  num? get mineralWoolTons =>
      _mineralWoolHollowCoreSlabFoundationGroundFloor.tons;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamHollowCoreSlabFoundation.volume,
        _finnFoamHollowCoreSlabFoundation.volume,
        _vaporBarrierPlasticHollowCoreSlabFoundation.volume,
        _styrofoamHollowCoreSlabFoundationGroundFloor.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamHollowCoreSlabFoundation.tons,
        _finnFoamHollowCoreSlabFoundation.tons,
        _vaporBarrierPlasticHollowCoreSlabFoundation.tons,
        _styrofoamHollowCoreSlabFoundationGroundFloor.tons
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
      _hotBitumenBrushingHollowCoreSlabFoundationGroundFloor.volume;

  @override
  num? get hotBitumenCoatingTons =>
      _hotBitumenBrushingHollowCoreSlabFoundationGroundFloor.tons;
}
