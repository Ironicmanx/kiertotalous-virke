import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/utils/test_utils.dart';

void main() {
  // the purpose of these tests are to explore Foundations functionality
  group('Building frame', () {
    test('Basic calculation', () {
      final frame = TotalBuildingFrame(
          buildingFrame: BuildingFrame(
              useFoundationCircumference: false,
              externalWallsAverageHeight: 2,
              externalWallsPerimeter: 400,
              woodPortionPercentage: 20,
              glulamVerticalColumnsPortionPercentage: 20,
              concreteVerticalColumnsPortionPercentage: 20,
              steelVerticalColumnsPortionPercentage: 20,
              doubleLoadBearingBrickWallPortionPercentage: 10,
              concreteElementWallsWithoutFrameworkPortionPercentage: 10));

      expect(frame.concreteVerticalColumnsPart.concreteVolume, equals(4.8));
      expect(frame.concreteVerticalColumnsPart.concreteTons, equals(12));
      expect(frame.woodFramePart.woodTons, equals(1));
      expect(frame.woodFramePart.woodVolume, equals(2));
    });

    test('In-depth calculation', () {
      final frame = TotalBuildingFrame(
          buildingFrame: BuildingFrame(
              useFoundationCircumference: false,
              externalWallsAverageHeight: 2,
              externalWallsPerimeter: 400,
              woodPortionPercentage: 20,
              glulamVerticalColumnsPortionPercentage: 20,
              concreteVerticalColumnsPortionPercentage: 20,
              steelVerticalColumnsPortionPercentage: 20,
              doubleLoadBearingBrickWallPortionPercentage: 10,
              concreteElementWallsWithoutFrameworkPortionPercentage: 10,
              brickCladWallPortionPercentage: 20,
              boardWallPortionPercentage: 20,
              profiledSheetMetalPortionPercentage: 10,
              steelProfileSandwichStructurePortionPercentage: 20,
              mineriteOrOtherStoneBoardPortionPercentage: 10));

      expect(
          frame.brickVeneerWallFramePart.windProtectionBoardTons, equals(1.12));
      expect(
          frame.woodenPlankWallFramePart.windProtectionBoardTons, equals(1.12));
      expect(frame.profiledSheetMetalFramePart.windProtectionBoardTons,
          equals(0.56));
      expect(frame.mineralWoolInsulationVolume, equals(80));
      expect(frame.limeOrRedBrickTons, equals(24));
      expect(TestUtils.round(frame.limeOrRedBrickVolume), equals(13.521));
      expect(frame.exteriorWoodCladdingTons, equals(2.56));
      expect(frame.exteriorWoodCladdingVolume, equals(5.12));
      expect(TestUtils.round(frame.gypsumBoardTons), equals(5.04));
      expect(TestUtils.round(frame.gypsumBoardVolume), equals(7.283));
      expect(frame.profileSteelSheetTons, equals(0.336));
      expect(frame.profileSteelSheetVolume, equals(0.048));
      expect(frame.semiHardFiberBoardTons, equals(0.56));
      expect(TestUtils.round(frame.semiHardFiberBoardVolume), equals(1.217));
      expect(TestUtils.round(frame.mineriteBoardVolume), equals(0.676));
      expect(frame.mineriteBoardTons, equals(1.2));
      expect(TestUtils.round(frame.styrofoamTons), equals(0.13));
      expect(TestUtils.round(frame.styrofoamVolume), equals(7.2));
      expect(frame.concreteElementWallsWithoutFrameworkPart.styrofoamTons,
          equals(0.0432));
      expect(
          frame.concreteElementWallsWithoutFrameworkPart
              .mineralWoolInsulationTons,
          equals(0.44));
      expect(frame.doubleLoadBearingBrickWallPart.mineralWoolInsulationTons,
          equals(0.44));
      expect(frame.doubleLoadBearingBrickWallPart.plasterCoatingTons,
          equals(0.192));
    });
  });
}
