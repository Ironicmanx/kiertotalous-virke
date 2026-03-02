import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/utils/test_utils.dart';

void main() {
  // the purpose of these tests are to explore Foundations functionality
  group('Cellar class', () {
    test('Property calculation with concrete casting', () {
      final cellar = Cellar(
          floorArea: 400,
          exteriorWallsPerimeter: 5,
          wallHeight: 2,
          exteriorWallsMaterial: CellarExteriorMaterial.concreteCasting);

      expect(cellar.concreteTons, equals(384));
      expect(cellar.rebarTons, equals(16));
      expect(TestUtils.round(cellar.glassAndMineralWoolInsulationVolume),
          equals(40));
      expect(TestUtils.round(cellar.plasticWasteVolume), equals(15.089));
      expect(TestUtils.round(cellar.plasticWasteTons), equals(0.351));
      expect(TestUtils.round(cellar.hotBitumenCoatingVolume), equals(0.176));
    });

    test('Property calculation with concrete block', () {
      final cellar = Cellar(
          floorArea: 400,
          exteriorWallsPerimeter: 5,
          wallHeight: 2,
          exteriorWallsMaterial: CellarExteriorMaterial.concreteBlock);

      expect(TestUtils.round(cellar.concreteTons), equals(192.024));
      expect(cellar.rebarTons, equals(8));
      expect(TestUtils.round(cellar.blockTons), equals(2.05));
      expect(TestUtils.round(cellar.blockVolume), equals(2.929));
      expect(TestUtils.round(cellar.glassAndMineralWoolInsulationVolume),
          equals(40));
      expect(TestUtils.round(cellar.plasticWasteVolume), equals(15.089));
      expect(TestUtils.round(cellar.plasticWasteTons), equals(0.351));
      expect(TestUtils.round(cellar.hotBitumenCoatingVolume), equals(0.176));
    });
  });
}
