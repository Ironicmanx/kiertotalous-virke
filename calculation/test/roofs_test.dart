import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/utils/test_utils.dart';

void main() {
  group('Roofs', () {
    test('Property calculation', () {
      var totalRoofs = TotalRoofs(
          foundations: Foundations(
            falsePlinth: FalsePlinthFoundation(area: 5, circumference: 5),
            crawlSpace: CrawlSpaceFoundation(area: 5, circumference: 5),
            shallow: ShallowFoundation(area: 5, circumference: 5),
            pillar: PillarFoundation(area: 5, circumference: 5),
            hollowCoreSlab: HollowCoreSlabFoundation(area: 5, circumference: 5),
          ),
          roofs: Roofs(
              ceilingArea: 5,
              ridgeOrGableRoofPortionPercentage: 5,
              useDefaultDimensions: false,
              ridgeOrGableRoofType: RoofType.steelTruss,
              ridgeOrGableWaterRoofType: WaterRoofType.roofingFelt,
              flatOrMonoPitchedRoofType: RoofType.concreteBeam,
              flatOrMonoPitchedWaterRoofType: WaterRoofType.roofingFelt));

      expect(TestUtils.round(totalRoofs.calculatedCeilingArea), equals(5));
      expect(TestUtils.round(totalRoofs.defaultRidgeOrGableRoofCeilingArea),
          equals(0.25));
      expect(TestUtils.round(totalRoofs.flatOrMonoPitchedRoofPortionPercentage),
          equals(95));
      expect(
          TestUtils.round(totalRoofs.defaultFlatOrMonoPitchedRoofCeilingArea),
          equals(4.75));
      expect(TestUtils.round(totalRoofs.woodVolume), equals(0.16));
      expect(TestUtils.round(totalRoofs.woodTons), equals(0.080));
      expect(TestUtils.round(totalRoofs.steelTons), equals(0.013));
      expect(TestUtils.round(totalRoofs.concreteVolume), equals(0.17));
      expect(TestUtils.round(totalRoofs.concreteTons), equals(1.188));
      expect(TestUtils.round(totalRoofs.insulationVolume), equals(0.15));
      expect(TestUtils.round(totalRoofs.insulationTons), equals(0.008));
      expect(TestUtils.round(totalRoofs.underlayVolume), equals(0.001));
      expect(TestUtils.round(totalRoofs.underlayTons), equals(0.001));
      expect(TestUtils.round(totalRoofs.bitumenVolume), equals(0.03));
      expect(TestUtils.round(totalRoofs.bitumenTons), equals(0.040));
      expect(TestUtils.round(totalRoofs.mineriteVolume), equals(0));
      expect(TestUtils.round(totalRoofs.mineriteTons), equals(0));
      expect(TestUtils.round(totalRoofs.roofTileVolume), equals(0));
      expect(TestUtils.round(totalRoofs.roofTileTons), equals(0));

      totalRoofs = totalRoofs.copyWith.roofs!(
          ridgeOrGableWaterRoofType: WaterRoofType.mineriteRoof,
          flatOrMonoPitchedWaterRoofType: WaterRoofType.tiledRoof);

      expect(TestUtils.round(totalRoofs.woodVolume), equals(0.16));
      expect(TestUtils.round(totalRoofs.woodTons), equals(0.080));
      expect(TestUtils.round(totalRoofs.steelTons), equals(0.013));
      expect(TestUtils.round(totalRoofs.concreteVolume), equals(0.17));
      expect(TestUtils.round(totalRoofs.concreteTons), equals(1.188));
      expect(TestUtils.round(totalRoofs.insulationVolume), equals(0.15));
      expect(TestUtils.round(totalRoofs.insulationTons), equals(0.008));
      expect(TestUtils.round(totalRoofs.underlayVolume), equals(0.001));
      expect(TestUtils.round(totalRoofs.underlayTons), equals(0.001));
      expect(TestUtils.round(totalRoofs.bitumenVolume), equals(0));
      expect(TestUtils.round(totalRoofs.bitumenTons), equals(0));
      expect(TestUtils.round(totalRoofs.mineriteVolume), equals(0.002));
      expect(TestUtils.round(totalRoofs.mineriteTons), equals(0.004));
      expect(TestUtils.round(totalRoofs.roofTileVolume), equals(0.104));
      expect(TestUtils.round(totalRoofs.roofTileTons), equals(0.185));
    });

    test('Property calculation with wood and with no foundation data', () {
      var totalRoofs = TotalRoofs(
          roofs: Roofs(
              ceilingArea: 500,
              ridgeOrGableRoofPortionPercentage: 50,
              useDefaultDimensions: false,
              ridgeOrGableRoofType: RoofType.woodenTruss,
              ridgeOrGableWaterRoofType: WaterRoofType.metalRoof,
              flatOrMonoPitchedRoofType: RoofType.woodenTruss,
              flatOrMonoPitchedWaterRoofType: WaterRoofType.metalRoof));

      expect(TestUtils.round(totalRoofs.woodVolume), equals(30.063));
      expect(TestUtils.round(totalRoofs.woodTons), equals(15.031));
    });
  });
}
