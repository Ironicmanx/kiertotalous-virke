import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../data_types/exports.dart';
import '../../demolition_materials/foundation_and_floors_demolition_materials.dart';
import 'foundation.dart';

part 'pillar_foundation.freezed.dart';
part 'pillar_foundation.g.dart';

@freezed
abstract class PillarFoundation extends Foundation with _$PillarFoundation {
  PillarFoundation._();

  factory PillarFoundation({
    num? area,
    num? circumference,
    @Default(FoundationMaterial.concreteCasting) FoundationMaterial? material,
    @Default(0) num pileSpacing,
    @Default(0.6) num blockHeight,
    @Default(100) num frostStyrofoamThickness,
    @Default(100) num finnFoamThickness,
    @Default(3.1) num woodFrameWeight,
    @Default(25) num solidBoardingThickness,
  }) = _PillarFoundation;

  factory PillarFoundation.fromJson(Map<String, dynamic> json) =>
      _$PillarFoundationFromJson(json);

  late final _reinforcedConcreteColumnColumnFoundation =
      ReinforcedConcreteColumnColumnFoundation(this, pileSpacing);
  late final _concreteBlockColumnFoundation =
      ConcreteBlockColumnFoundation(this, blockHeight);
  late final _frostProofStyrofoamColumnFoundation =
      FrostProofStyrofoamColumnFoundation(this, frostStyrofoamThickness);
  late final _finnFoamColumnFoundation =
      FinnFoamColumnFoundation(this, finnFoamThickness);
  late final _vaporBarrierPlasticColumnFoundation =
      VaporBarrierPlasticColumnFoundation(this);
  late final _woodFrameColumnFoundationGroundFloor =
      WoodFrameColumnFoundationGroundFloor(this, woodFrameWeight);
  late final _solidBoardingColumnFoundationGroundFloor =
      SolidBoardingColumnFoundationGroundFloor(this, solidBoardingThickness);

  @override
  num? get concreteVolume => material == FoundationMaterial.concreteCasting
      ? _reinforcedConcreteColumnColumnFoundation.volume
      : 0;

  @override
  num? get concreteTons => material == FoundationMaterial.concreteCasting
      ? _reinforcedConcreteColumnColumnFoundation.concreteTons
      : 0;

  @override
  num? get rebarTons => material == FoundationMaterial.concreteCasting
      ? _reinforcedConcreteColumnColumnFoundation.steelTons
      : 0;

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteBlock
      ? _concreteBlockColumnFoundation.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteBlock
      ? _concreteBlockColumnFoundation.tons
      : 0;

  @override
  num? get mineralWoolVolume => 0;

  @override
  num? get mineralWoolTons => 0;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamColumnFoundation.volume,
        _finnFoamColumnFoundation.volume,
        _vaporBarrierPlasticColumnFoundation.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamColumnFoundation.tons,
        _finnFoamColumnFoundation.tons,
        _vaporBarrierPlasticColumnFoundation.tons
      ]);

  @override
  num? get woodShavingsVolume => 0;

  @override
  num? get woodShavingsTons => 0;

  @override
  num? get solidBoardingAndWoodFrameVolume => Utils.sumOrNull([
        _woodFrameColumnFoundationGroundFloor.volume,
        _solidBoardingColumnFoundationGroundFloor.volume
      ]);

  @override
  num? get solidBoardingAndWoodFrameTons => Utils.sumOrNull([
        _woodFrameColumnFoundationGroundFloor.tons,
        _solidBoardingColumnFoundationGroundFloor.tons
      ]);

  @override
  num? get combustibleWasteVolume => 0;

  @override
  num? get combustibleWasteTons => 0;

  @override
  num? get hotBitumenCoatingVolume => 0;

  @override
  num? get hotBitumenCoatingTons => 0;
}
