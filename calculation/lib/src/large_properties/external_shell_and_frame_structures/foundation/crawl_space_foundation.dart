import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/utils.dart';
import '../../data_types/exports.dart';
import '../../demolition_materials/foundation_and_floors_demolition_materials.dart';
import 'foundation.dart';

part 'crawl_space_foundation.freezed.dart';
part 'crawl_space_foundation.g.dart';

@freezed
abstract class CrawlSpaceFoundation extends Foundation
    with _$CrawlSpaceFoundation {
  CrawlSpaceFoundation._();

  factory CrawlSpaceFoundation(
      {num? area,
      num? circumference,
      @Default(FoundationMaterial.concreteCasting)
      FoundationMaterial? material}) = _CrawlSpaceFoundation;

  factory CrawlSpaceFoundation.fromJson(Map<String, dynamic> json) =>
      _$CrawlSpaceFoundationFromJson(json);

  late final _reinforcedConcreteSlabFalsePlinthGroundFloor =
      ReinforcedConcreteSlabFalsePlinthGroundFloor(this);
  late final _reinforcedConcreteColumnCrawlSpace =
      ReinforcedConcreteColumnCrawlSpace(this);
  late final _reinforcedConcreteCastFoundationCrawlSpace =
      ReinforcedConcreteCastFoundationCrawlSpace(this);
  late final _concreteBlockCrawlSpace = ConcreteBlockCrawlSpace(this);
  late final _woodShavingsCrawlSpaceGroundFloor =
      WoodShavingsCrawlSpaceGroundFloor(this);
  late final _woodFrameCrawlSpaceGroundFloor =
      WoodFrameCrawlSpaceGroundFloor(this);
  late final _solidBoardingCrawlSpaceGroundFloor =
      SolidBoardingCrawlSpaceGroundFloor(this);
  late final _constructionPaperCrawlSpaceGroundFloor =
      ConstructionPaperCrawlSpaceGroundFloor(this);
  late final _tarPaperCrawlSpaceGroundFloor =
      TarPaperCrawlSpaceGroundFloor(this);

  @override
  num? get concreteVolume => material == FoundationMaterial.concreteCasting
      ? Utils.sumOrNull([
          _reinforcedConcreteColumnCrawlSpace.volume,
          _reinforcedConcreteCastFoundationCrawlSpace.volume
        ])
      : 0;

  @override
  num? get concreteTons => Utils.sumOrNull([
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteSlabFalsePlinthGroundFloor.concreteTons
            : null,
        _reinforcedConcreteSlabFalsePlinthGroundFloor.tons,
        material == FoundationMaterial.concreteCasting
            ? _reinforcedConcreteCastFoundationCrawlSpace.tons
            : null,
      ]);

  @override
  num? get rebarTons => _reinforcedConcreteColumnCrawlSpace.steelTons;

  @override
  num? get concreteBlockVolume => material == FoundationMaterial.concreteBlock
      ? _concreteBlockCrawlSpace.volume
      : 0;

  @override
  num? get concreteBlockTons => material == FoundationMaterial.concreteBlock
      ? _concreteBlockCrawlSpace.tons
      : 0;

  @override
  num? get mineralWoolVolume => 0;

  @override
  num? get mineralWoolTons => 0;

  @override
  num? get plasticWasteVolume => 0;

  @override
  num? get plasticWasteTons => 0;

  @override
  num? get woodShavingsVolume => _woodShavingsCrawlSpaceGroundFloor.volume;

  @override
  num? get woodShavingsTons => _woodShavingsCrawlSpaceGroundFloor.tons;

  @override
  num? get solidBoardingAndWoodFrameVolume => Utils.sumOrNull([
        _woodFrameCrawlSpaceGroundFloor.volume,
        _solidBoardingCrawlSpaceGroundFloor.volume,
      ]);

  /// TODO: This calculation is most likely incorrect. The reference Excel had this
  /// so we are keeping it as is for now.
  @override
  num? get solidBoardingAndWoodFrameTons => Utils.sumOrNull([
        _woodFrameCrawlSpaceGroundFloor.tons,
        _woodFrameCrawlSpaceGroundFloor.tons,
      ]);

  @override
  num? get combustibleWasteVolume => Utils.sumOrNull([
        _constructionPaperCrawlSpaceGroundFloor.volume,
        _tarPaperCrawlSpaceGroundFloor.volume,
      ]);

  @override
  num? get combustibleWasteTons => Utils.sumOrNull([
        _constructionPaperCrawlSpaceGroundFloor.tons,
        _tarPaperCrawlSpaceGroundFloor.tons,
      ]);

  @override
  num? get hotBitumenCoatingVolume => 0;

  @override
  num? get hotBitumenCoatingTons => 0;
}
