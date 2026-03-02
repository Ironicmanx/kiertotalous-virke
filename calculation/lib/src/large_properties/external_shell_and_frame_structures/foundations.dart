import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import '../data_types/exports.dart';
import '../demolition_materials/foundation_and_floors_demolition_materials.dart';
import 'foundation/exports.dart';

part 'foundations.freezed.dart';
part 'foundations.g.dart';

@freezed
abstract class Foundations with _$Foundations implements Foundation {
  const Foundations._();

  const factory Foundations(
      {FalsePlinthFoundation? falsePlinth,
      CrawlSpaceFoundation? crawlSpace,
      ShallowFoundation? shallow,
      PillarFoundation? pillar,
      HollowCoreSlabFoundation? hollowCoreSlab,
      @Default(false) bool bituminousWaterProofing}) = _Foundations;

  factory Foundations.fromJson(Map<String, dynamic> json) =>
      _$FoundationsFromJson(json);

  @override
  num? get area => Utils.sumOrNull([
        falsePlinth?.area,
        crawlSpace?.area,
        shallow?.area,
        pillar?.area,
        hollowCoreSlab?.area
      ]);

  @override
  num? get circumference => Utils.sumOrNull([
        falsePlinth?.circumference,
        crawlSpace?.circumference,
        shallow?.circumference,
        pillar?.circumference,
        hollowCoreSlab?.circumference
      ]);

  @override
  num? get concreteVolume => Utils.sumOrNull([
        falsePlinth?.concreteVolume,
        crawlSpace?.concreteVolume,
        shallow?.concreteVolume,
        pillar?.concreteVolume,
        hollowCoreSlab?.concreteVolume
      ]);

  @override
  num? get concreteTons => Utils.sumOrNull([
        falsePlinth?.concreteTons,
        crawlSpace?.concreteTons,
        shallow?.concreteTons,
        pillar?.concreteTons,
        hollowCoreSlab?.concreteTons
      ]);

  @override
  num? get rebarTons => Utils.sumOrNull([
        falsePlinth?.rebarTons,
        crawlSpace?.rebarTons,
        shallow?.rebarTons,
        pillar?.rebarTons,
        hollowCoreSlab?.rebarTons
      ]);

  @override
  num? get concreteBlockVolume => Utils.sumOrNull([
        falsePlinth?.concreteBlockVolume,
        crawlSpace?.concreteBlockVolume,
        shallow?.concreteBlockVolume,
        pillar?.concreteBlockVolume,
        hollowCoreSlab?.concreteBlockVolume
      ]);

  @override
  num? get concreteBlockTons => Utils.sumOrNull([
        falsePlinth?.concreteBlockTons,
        crawlSpace?.concreteBlockTons,
        shallow?.concreteBlockTons,
        pillar?.concreteBlockTons,
        hollowCoreSlab?.concreteBlockTons
      ]);

  @override
  num? get mineralWoolVolume => Utils.sumOrNull([
        falsePlinth?.mineralWoolVolume,
        crawlSpace?.mineralWoolVolume,
        shallow?.mineralWoolVolume,
        pillar?.mineralWoolVolume,
        hollowCoreSlab?.mineralWoolVolume
      ]);

  @override
  num? get mineralWoolTons => Utils.sumOrNull([
        falsePlinth?.mineralWoolTons,
        crawlSpace?.mineralWoolTons,
        shallow?.mineralWoolTons,
        pillar?.mineralWoolTons,
        hollowCoreSlab?.mineralWoolTons
      ]);

  @override
  num? get plasticWasteVolume => Utils.sumOrNull([
        falsePlinth?.plasticWasteVolume,
        crawlSpace?.plasticWasteVolume,
        shallow?.plasticWasteVolume,
        pillar?.plasticWasteVolume,
        hollowCoreSlab?.plasticWasteVolume
      ]);

  @override
  num? get plasticWasteTons => Utils.sumOrNull([
        falsePlinth?.plasticWasteTons,
        crawlSpace?.plasticWasteTons,
        shallow?.plasticWasteTons,
        pillar?.plasticWasteTons,
        hollowCoreSlab?.plasticWasteTons
      ]);

  @override
  num? get woodShavingsVolume => Utils.sumOrNull([
        falsePlinth?.woodShavingsVolume,
        crawlSpace?.woodShavingsVolume,
        shallow?.woodShavingsVolume,
        pillar?.woodShavingsVolume,
        hollowCoreSlab?.woodShavingsVolume
      ]);

  @override
  num? get woodShavingsTons => Utils.sumOrNull([
        falsePlinth?.woodShavingsTons,
        crawlSpace?.woodShavingsTons,
        shallow?.woodShavingsTons,
        pillar?.woodShavingsTons,
        hollowCoreSlab?.woodShavingsTons
      ]);

  @override
  num? get solidBoardingAndWoodFrameVolume => Utils.sumOrNull([
        falsePlinth?.solidBoardingAndWoodFrameVolume,
        crawlSpace?.solidBoardingAndWoodFrameVolume,
        shallow?.solidBoardingAndWoodFrameVolume,
        pillar?.solidBoardingAndWoodFrameVolume,
        hollowCoreSlab?.solidBoardingAndWoodFrameVolume
      ]);

  @override
  num? get solidBoardingAndWoodFrameTons => Utils.sumOrNull([
        falsePlinth?.solidBoardingAndWoodFrameTons,
        crawlSpace?.solidBoardingAndWoodFrameTons,
        shallow?.solidBoardingAndWoodFrameTons,
        pillar?.solidBoardingAndWoodFrameTons,
        hollowCoreSlab?.solidBoardingAndWoodFrameTons
      ]);

  @override
  num? get combustibleWasteVolume => Utils.sumOrNull([
        falsePlinth?.combustibleWasteVolume,
        crawlSpace?.combustibleWasteVolume,
        shallow?.combustibleWasteVolume,
        pillar?.combustibleWasteVolume,
        hollowCoreSlab?.combustibleWasteVolume
      ]);

  @override
  num? get combustibleWasteTons => Utils.sumOrNull([
        falsePlinth?.combustibleWasteTons,
        crawlSpace?.combustibleWasteTons,
        shallow?.combustibleWasteTons,
        pillar?.combustibleWasteTons,
        hollowCoreSlab?.combustibleWasteTons
      ]);

  @override
  num? get hotBitumenCoatingVolume {
    final list = [
      falsePlinth?.hotBitumenCoatingVolume,
      crawlSpace?.hotBitumenCoatingVolume,
      shallow?.hotBitumenCoatingVolume,
      pillar?.hotBitumenCoatingVolume,
      hollowCoreSlab?.hotBitumenCoatingVolume
    ];

    if (!bituminousWaterProofing) {
      return Utils.anyNonNull(list) ? 0 : null;
    }

    return Utils.sumOrNull(list);
  }

  @override
  num? get hotBitumenCoatingTons {
    final list = [
      falsePlinth?.hotBitumenCoatingTons,
      crawlSpace?.hotBitumenCoatingTons,
      shallow?.hotBitumenCoatingTons,
      pillar?.hotBitumenCoatingTons,
      hollowCoreSlab?.hotBitumenCoatingTons
    ];

    if (!bituminousWaterProofing) {
      return Utils.anyNonNull(list) ? 0 : null;
    }

    return Utils.sumOrNull(list);
  }

  @override
  FoundationMaterial? get material => null;

  ConcreteCastingIntermediateFloorFrames
      get concreteCastingIntermediateFloorFrames =>
          ConcreteCastingIntermediateFloorFrames();

  GlulamBeamsIntermediateFloorFrames get glulamBeamsIntermediateFloorFrames =>
      GlulamBeamsIntermediateFloorFrames();
}
