import '../../data_types/exports.dart';

abstract class Foundation {
  num? get concreteVolume;

  num? get concreteTons;

  num? get rebarTons;

  num? get concreteBlockVolume;

  num? get concreteBlockTons;

  num? get mineralWoolVolume;

  num? get mineralWoolTons;

  num? get plasticWasteVolume;

  num? get plasticWasteTons;

  num? get woodShavingsVolume;

  num? get woodShavingsTons;

  num? get solidBoardingAndWoodFrameVolume;

  num? get solidBoardingAndWoodFrameTons;

  num? get combustibleWasteVolume;

  num? get combustibleWasteTons;

  num? get hotBitumenCoatingVolume;

  num? get hotBitumenCoatingTons;

  num? get area;

  num? get circumference;

  FoundationMaterial? get material;
}
