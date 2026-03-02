import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/utils.dart';
import '../data_types/cellar_exterior_material.dart';
import '../demolition_materials/cellar_demolition_materials.dart';

part 'cellar.freezed.dart';
part 'cellar.g.dart';

@freezed
abstract class Cellar with _$Cellar {
  late final _reinforcedConcreteSlabGroundFloor =
      ReinforcedConcreteSlabGroundFloor(this);
  late final _hotBitumenBrushingGroundFloor =
      HotBitumenBrushingGroundFloor(this);
  late final _mineralWoolGroundFloor = MineralWoolGroundFloor(this);
  late final _styrofoamGroundFloor = StyrofoamGroundFloor(this);
  late final _concreteCastingGroundFloor = ConcreteCastingGroundFloor(this);
  late final _vaporBarrierPlasticGroundFloor =
      VaporBarrierPlasticGroundFloor(this);
  late final _frostProofStyrofoamInsulation =
      FrostProofStyrofoamInsulation(this);
  late final _styrofoamInsulation = StyrofoamInsulation(this);
  late final _finnFoamInsulation = FinnFoamInsulation(this);
  late final _vaporBarrierPlasticInsulation =
      VaporBarrierPlasticInsulation(this);
  late final _hotBitumenCoatingInsulation = HotBitumenCoatingInsulation(this);
  late final _concreteCastingWalls = ConcreteCastingWalls(this);
  late final _brickWalls = BrickWalls(this);
  late final _brickWallInnerFiller = BrickWallInnerFiller(this);
  late final _lightweightConcreteBlockWalls =
      LightweightConcreteBlockWalls(this);
  late final _plasteringInteriorAndExteriorWalls =
      PlasteringInteriorAndExteriorWalls(this);

  Cellar._();

  factory Cellar(
      {num? floorArea,
      num? exteriorWallsPerimeter,
      num? wallHeight,
      CellarExteriorMaterial? exteriorWallsMaterial}) = _Cellar;

  factory Cellar.fromJson(Map<String, dynamic> json) => _$CellarFromJson(json);

  num? get concreteVolume => Utils.sumOrNull([
        _reinforcedConcreteSlabGroundFloor.volume,
        _concreteCastingGroundFloor.volume,
        _concreteCastingWalls.volume,
        _brickWallInnerFiller.volume,
        _plasteringInteriorAndExteriorWalls.volume
      ]);

  num? get concreteTons => Utils.sumOrNull([
        _reinforcedConcreteSlabGroundFloor.concreteTons,
        _concreteCastingGroundFloor.concreteTons,
        _concreteCastingWalls.concreteTons,
        _brickWallInnerFiller.tons,
        _plasteringInteriorAndExteriorWalls.tons
      ]);

  num? get rebarTons => Utils.sumOrNull([
        _reinforcedConcreteSlabGroundFloor.steelTons,
        _concreteCastingGroundFloor.steelTons,
        _concreteCastingWalls.steelTons
      ]);

  num? get brickVolume => _brickWalls.volume;

  num? get brickTons => _brickWalls.tons;

  num? get blockVolume => _lightweightConcreteBlockWalls.volume;

  num? get blockTons => _lightweightConcreteBlockWalls.tons;

  num? get glassAndMineralWoolInsulationVolume =>
      _mineralWoolGroundFloor.volume;

  num? get glassAndMineralWoolInsulationTons => _mineralWoolGroundFloor.tons;

  num? get plasticWasteVolume => Utils.sumOrNull([
        _styrofoamGroundFloor.volume,
        _vaporBarrierPlasticGroundFloor.volume,
        _frostProofStyrofoamInsulation.volume,
        _styrofoamInsulation.volume,
        _finnFoamInsulation.volume,
        _vaporBarrierPlasticInsulation.volume
      ]);

  num? get plasticWasteTons => Utils.sumOrNull([
        _styrofoamGroundFloor.tons,
        _vaporBarrierPlasticGroundFloor.tons,
        _frostProofStyrofoamInsulation.tons,
        _styrofoamInsulation.tons,
        _finnFoamInsulation.tons,
        _vaporBarrierPlasticInsulation.tons
      ]);

  num? get hotBitumenCoatingVolume => Utils.sumOrNull([
        _hotBitumenBrushingGroundFloor.volume,
        _hotBitumenCoatingInsulation.volume
      ]);

  num? get hotBitumenCoatingTons => Utils.sumOrNull(
      [_hotBitumenBrushingGroundFloor.tons, _hotBitumenCoatingInsulation.tons]);

  num? get totalExteriorWallsSurfaceArea =>
      Utils.multiplyOrNull([exteriorWallsPerimeter, wallHeight]);
}
