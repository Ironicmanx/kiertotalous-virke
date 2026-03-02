import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../data_types/exports.dart';
import '../../demolition_materials/foundation_and_floors_demolition_materials.dart';
import 'foundation.dart';

part 'false_plinth_foundation.freezed.dart';
part 'false_plinth_foundation.g.dart';

@freezed
abstract class FalsePlinthFoundation extends Foundation
    with _$FalsePlinthFoundation {
  FalsePlinthFoundation._();

  factory FalsePlinthFoundation(
      {num? area,
      num? circumference,
      @Default(FoundationMaterial.concreteCasting)
      FoundationMaterial? material}) = _FalsePlinthFoundation;

  factory FalsePlinthFoundation.fromJson(Map<String, dynamic> json) =>
      _$FalsePlinthFoundationFromJson(json);

  late final _reinforcedConcreteColumnFalsePlinth =
      ReinforcedConcreteColumnFalsePlinth(this);
  late final _concreteBlockFalsePlinth = ConcreteBlockFalsePlinth(this);
  late final _frostProofStyrofoamFalsePlinth =
      FrostProofStyrofoamFalsePlinth(this);
  late final _finnFoamFalsePlinth = FinnFoamFalsePlinth(this);
  late final _vaporBarrierPlasticFalsePlinth =
      VaporBarrierPlasticFalsePlinth(this);
  late final _reinforcedConcreteSlabFalsePlinthGroundFloor =
      ReinforcedConcreteSlabFalsePlinthGroundFloor(this);
  late final _hotBitumenBrushingFalsePlinthGroundFloor =
      HotBitumenBrushingFalsePlinthGroundFloor(this);
  late final _mineralWoolFalsePlinthGroundFloor =
      MineralWoolFalsePlinthGroundFloor(this);
  late final _styrofoamFalsePlinthGroundFloor =
      StyrofoamFalsePlinthGroundFloor(this);
  late final _concreteCastingFalsePlinthGroundFloor =
      ConcreteCastingFalsePlinthGroundFloor(this);

  @override
  num? get concreteVolume => Utils.sumOrNull([
        _reinforcedConcreteColumnFalsePlinth.volume,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.volume,
        _concreteCastingFalsePlinthGroundFloor.volume
      ]);

  @override
  num? get concreteTons => Utils.sumOrNull([
        _reinforcedConcreteColumnFalsePlinth.concreteTons,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.tons,
        _concreteCastingFalsePlinthGroundFloor.concreteTons
      ]);

  @override
  num? get rebarTons => Utils.sumOrNull([
        _reinforcedConcreteColumnFalsePlinth.steelTons,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.steelTons,
        _concreteCastingFalsePlinthGroundFloor.steelTons
      ]);

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteBlock
      ? _concreteBlockFalsePlinth.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteBlock
      ? _concreteBlockFalsePlinth.tons
      : 0;

  @override
  num? get mineralWoolVolume => _mineralWoolFalsePlinthGroundFloor.volume;

  @override
  num? get mineralWoolTons => _mineralWoolFalsePlinthGroundFloor.tons;

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        _frostProofStyrofoamFalsePlinth.volume,
        _finnFoamFalsePlinth.volume,
        _vaporBarrierPlasticFalsePlinth.volume,
        _styrofoamFalsePlinthGroundFloor.volume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        _frostProofStyrofoamFalsePlinth.tons,
        _finnFoamFalsePlinth.tons,
        _vaporBarrierPlasticFalsePlinth.tons,
        _styrofoamFalsePlinthGroundFloor.tons
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
      _hotBitumenBrushingFalsePlinthGroundFloor.volume;

  @override
  num? get hotBitumenCoatingTons =>
      _hotBitumenBrushingFalsePlinthGroundFloor.tons;
}
