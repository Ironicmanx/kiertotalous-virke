import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/large_properties/data_types/exports.dart';

void main() {
  group('TotalIntermediateFloors', () {
    TotalIntermediateFloors tif = TotalIntermediateFloors();
    setUp(() {
      tif = TotalIntermediateFloors(
        intermediateFloors: IntermediateFloors(
          woodFramePercentage: 10,
          concreteCastingPercentage: 10,
          hollowCoreSlabPercentage: 10,
          glulamBeamPercentage: 70,
        ),
        totalBuildingDimensions: TotalBuildingDimensions(
          buildingDimensions: BuildingDimensions(
              grossFloorArea: 100,
              volume: 400,
              floorCountExcludingCellars: 5,
              averageArea: 40),
        ),
        foundations: Foundations(
          falsePlinth: FalsePlinthFoundation(
              area: 5,
              circumference: 10,
              material: FoundationMaterial.concreteBlock),
        ),
      );
    });
    test('woodFrameFloorArea getter non-null non-zero value', () {
      print('result: ${tif.woodFrameFloorArea}');
      expect(tif.woodFrameFloorArea, equals(isNotNull));
      expect(tif.woodFrameFloorArea, isNot(equals(0.0)));
    });
    test('concreteCastingFloorArea getter non-null non-zero value', () {
      print('result: ${tif.concreteCastingFloorArea}');
      expect(tif.concreteCastingFloorArea, equals(isNotNull));
      expect(tif.concreteCastingFloorArea, isNot(equals(0.0)));
    });
    test('hollowCoreSlabFloorArea getter non-null non-zero value', () {
      print('result: ${tif.hollowCoreSlabFloorArea}');
      expect(tif.hollowCoreSlabFloorArea, equals(isNotNull));
      expect(tif.hollowCoreSlabFloorArea, isNot(equals(0.0)));
    });
    test('glulamBeamFloorArea getter non-null non-zero value', () {
      print('result: ${tif.glulamBeamFloorArea}');
      expect(tif.glulamBeamFloorArea, equals(isNotNull));
      expect(tif.glulamBeamFloorArea, isNot(equals(0.0)));
    });
    test('totalFloorArea getter non-null non-zero value', () {
      print('result: ${tif.totalFloorArea}');
      expect(tif.totalFloorArea, equals(isNotNull));
      expect(tif.totalFloorArea, isNot(equals(0.0)));
    });
    test('woodFrameWoodVolume getter non-null non-zero value', () {
      print('result: ${tif.woodFrameWoodVolume}');
      expect(tif.woodFrameWoodVolume, equals(isNotNull));
      expect(tif.woodFrameWoodVolume, isNot(equals(0.0)));
    });
    test('glulamBeamWoodVolume getter non-null non-zero value', () {
      print('result: ${tif.glulamBeamWoodVolume}');
      expect(tif.glulamBeamWoodVolume, equals(isNotNull));
      expect(tif.glulamBeamWoodVolume, isNot(equals(0.0)));
    });
    test('woodFrameWoodTons getter non-null non-zero value', () {
      print('result: ${tif.woodFrameWoodTons}');
      expect(tif.woodFrameWoodTons, equals(isNotNull));
      expect(tif.woodFrameWoodTons, isNot(equals(0.0)));
    });
    test('glulamBeamWoodTons getter non-null non-zero value', () {
      print('result: ${tif.glulamBeamWoodTons}');
      expect(tif.glulamBeamWoodTons, equals(isNotNull));
      expect(tif.glulamBeamWoodTons, isNot(equals(0.0)));
    });
    test('concreteCastingConcreteVolume getter non-null non-zero value', () {
      print('result: ${tif.concreteCastingConcreteVolume}');
      expect(tif.concreteCastingConcreteVolume, equals(isNotNull));
      expect(tif.concreteCastingConcreteVolume, isNot(equals(0.0)));
    });
    test('hollowCoreSlabConcreteVolume getter non-null non-zero value', () {
      print('result: ${tif.hollowCoreSlabConcreteVolume}');
      expect(tif.hollowCoreSlabConcreteVolume, equals(isNotNull));
      expect(tif.hollowCoreSlabConcreteVolume, isNot(equals(0.0)));
    });
    test('concreteCastingConcreteTons getter non-null non-zero value', () {
      print('result: ${tif.concreteCastingConcreteTons}');
      expect(tif.concreteCastingConcreteTons, equals(isNotNull));
      expect(tif.concreteCastingConcreteTons, isNot(equals(0.0)));
    });
    test('hollowCoreSlabConcreteTons getter non-null non-zero value', () {
      print('result: ${tif.hollowCoreSlabConcreteTons}');
      expect(tif.hollowCoreSlabConcreteTons, equals(isNotNull));
      expect(tif.hollowCoreSlabConcreteTons, isNot(equals(0.0)));
    });
    test('concreteCastingRebarTons getter non-null non-zero value', () {
      print('result: ${tif.concreteCastingRebarTons}');
      expect(tif.concreteCastingRebarTons, equals(isNotNull));
      expect(tif.concreteCastingRebarTons, isNot(equals(0.0)));
    });
  });
}
