import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';

void main() {
  // the purpose of these tests are to explore Foundations functionality
  group('Outer door tests', () {
    test('shut wooden doors', () {
      final outerDoors = OuterDoors(woodenDoors: DoorsInfo(shutDoors: 3));

      expect(outerDoors.totalWoodVolume, equals(0.306));
      expect(outerDoors.totalWoodTons, equals(0.153));
    });

    test('glass wooden doors', () {
      final outerDoors = OuterDoors(woodenDoors: DoorsInfo(glassDoors: 3));

      expect(outerDoors.totalWoodVolume, equals(0.306));
      expect(outerDoors.totalWoodTons, equals(0.063));
      expect(outerDoors.totalGlassVolume, equals(0.00625));
      expect(outerDoors.totalGlassTons, equals(0.015));
    });

    test('shut aluminium doors', () {
      final outerDoors = OuterDoors(aluminiumDoors: DoorsInfo(shutDoors: 3));
      expect(outerDoors.totalAluminiumTons, equals(0.12));
    });
    test('glass aluminium doors', () {
      final outerDoors = OuterDoors(aluminiumDoors: DoorsInfo(glassDoors: 3));

      expect(outerDoors.totalAluminiumTons, equals(0.12));
      expect(outerDoors.totalGlassVolume, equals(0.00625));
      expect(outerDoors.totalGlassTons, equals(0.015));
    });

    test('shut steel doors', () {
      final outerDoors = OuterDoors(steelDoors: DoorsInfo(shutDoors: 3));

      expect(outerDoors.totalSteelTons, equals(0.15));
    });

    test('glass steel doors', () {
      final outerDoors = OuterDoors(steelDoors: DoorsInfo(glassDoors: 3));

      expect(outerDoors.totalSteelTons, equals(0.24));
      expect(outerDoors.totalGlassVolume, equals(0.00625));
      expect(outerDoors.totalGlassTons, equals(0.015));
    });
  });
}
