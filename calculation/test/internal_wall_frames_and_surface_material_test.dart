import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/utils/test_utils.dart';

void main() {
  // the purpose of these tests are to explore Foundations functionality
  group('Internal wall frames and surface materials', () {
    test('Partition wall calculations', () {
      final view = InternalWallFramesAndSurfaceMaterial(
          overallWallLength: 797,
          averageWallHeight: 3.3,
          officeSpaces: RoomSpace(
              woodFramedWalls: 63,
              brickWalls: 200,
              concreteElementOrCastingWalls: 10),
          lobbiesAndOtherCommonAreas: RoomSpace(
              woodFramedWalls: 101,
              brickWalls: 200,
              concreteElementOrCastingWalls: 10),
          restroomsAndWashingFacilities: RoomSpace(
              woodFramedWalls: 0,
              brickWalls: 27,
              concreteElementOrCastingWalls: 10),
          kitchens: RoomSpace(
              woodFramedWalls: 0,
              brickWalls: 0,
              concreteElementOrCastingWalls: 10),
          teachingAndTreatmentSpaces: RoomSpace(
              woodFramedWalls: 0,
              brickWalls: 0,
              concreteElementOrCastingWalls: 10),
          storageAndWorkspaces: RoomSpace(
              woodFramedWalls: 0,
              brickWalls: 206,
              concreteElementOrCastingWalls: 10),
          otherSpaces: RoomSpace(
              woodFramedWalls: 0,
              brickWalls: 0,
              concreteElementOrCastingWalls: 10));

      expect(view.totalArea, equals(2630.1));

      expect(TestUtils.round(view.totalWoodFramedWallsInSquareMeters),
          equals(541.2));
      expect(TestUtils.round(view.totalWoodFramedWallsVolume), equals(3.382));
      expect(TestUtils.round(view.totalWoodFramedWallsTons), equals(1.691));

      expect(
          TestUtils.round(view.totalBrickWallsInSquareMeters), equals(2088.9));
      expect(TestUtils.round(view.totalBrickWallsVolume), equals(229.779));
      expect(TestUtils.round(view.totalBrickWallsTons), equals(574.448));

      expect(
          TestUtils.round(
              view.totalConcreteElementOrCastingWallsInSquareMeters),
          equals(231));
      expect(TestUtils.round(view.totalConcreteElementOrCastingWallsVolume),
          equals(46.2));
      expect(TestUtils.round(view.totalConcreteElementOrCastingWallsTons),
          equals(60.06));
    });
  });
}
