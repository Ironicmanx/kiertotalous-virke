import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bl_demolition_materials/src/utils/test_utils.dart';

void main() {
  group('Basic serialization tests', () {
    test(
        'Cellar can be serialized, written to disk, read from disk, and deserialized.',
        () {
      final cellar = Cellar(
          floorArea: 500,
          exteriorWallsPerimeter: 1500,
          wallHeight: 50,
          exteriorWallsMaterial: CellarExteriorMaterial.concreteCasting);

      final readCellar =
          TestUtils.jsonRoundTrip(cellar.toJson(), Cellar.fromJson, true);

      expect(readCellar.floorArea, equals(cellar.floorArea));
      expect(readCellar.exteriorWallsPerimeter,
          equals(cellar.exteriorWallsPerimeter));
      expect(readCellar.wallHeight, equals(cellar.wallHeight));
      expect(readCellar.exteriorWallsMaterial,
          equals(cellar.exteriorWallsMaterial));
    });
  });
}
