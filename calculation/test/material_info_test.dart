import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';

void main() {
  group('WoodMaterialType', () {
    test('contains all expected values', () {
      expect(
          WoodMaterialType.values,
          containsAll([
            WoodMaterialType.board20x125,
            WoodMaterialType.trunkWood50x100,
            WoodMaterialType.trunkWood50x150,
            WoodMaterialType.trunkWood50x200,
            WoodMaterialType.trunkWood100x100,
            WoodMaterialType.trunkWood150x150,
          ]));
      print('WoodMaterialType expected values test passed');
    });
  });

  group('WoodMaterialInfo', () {
    setUp(() {
      // Reset the board consumption values to their default state before each test
      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.board20x125, 8.00);
      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood50x100, 1.25);
      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood50x150, 1.25);
      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood50x200, 1.25);
      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood100x100, 1.25);
      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood150x150, 1.25);
    });

    test('volumePerLinearMeter returns correct values', () {
      expect(
          WoodMaterialInfo.volumePerLinearMeter(WoodMaterialType.board20x125),
          equals(0.004));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood50x100),
          equals(0.005));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood50x150),
          equals(0.0075));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood50x200),
          equals(0.01));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood100x100),
          equals(0.01));
      expect(
          WoodMaterialInfo.volumePerLinearMeter(
              WoodMaterialType.trunkWood150x150),
          equals(0.0225));
      print('volumePerLinearMeter test passed');
    });

    test('weightPerLinearMeter returns correct values', () {
      expect(
          WoodMaterialInfo.weightPerLinearMeter(WoodMaterialType.board20x125),
          equals(0.004 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood50x100),
          equals(0.005 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood50x150),
          equals(0.0075 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood50x200),
          equals(0.01 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood100x100),
          equals(0.01 * 500));
      expect(
          WoodMaterialInfo.weightPerLinearMeter(
              WoodMaterialType.trunkWood150x150),
          equals(0.0225 * 500));
      print('weightPerLinearMeter test passed');
    });

    test('boardConsumptionPerSquareMeter returns correct values', () {
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.board20x125),
          equals(8));
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood50x100),
          equals(1.25));
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood50x150),
          equals(1.25));
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood50x200),
          equals(1.25));
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood100x100),
          equals(1.25));
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood150x150),
          equals(1.25));
      print('boardConsumptionPerSquareMeter test passed');
    });

    test('setBoardConsumptionPerSquareMeter modifies values correctly', () {
      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.board20x125, 10);
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.board20x125),
          equals(10));

      WoodMaterialInfo.setBoardConsumptionPerSquareMeter(
          WoodMaterialType.trunkWood50x100, 2);
      expect(
          WoodMaterialInfo.getBoardConsumptionPerSquareMeter(
              WoodMaterialType.trunkWood50x100),
          equals(2));
      print('setBoardConsumptionPerSquareMeter value modifying test passed');
    });

    test('woodWeightPerSquareMeter returns correct values', () {
      expect(
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.board20x125),
          equals(8.00 * (0.004 * 500)));
      expect(
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.trunkWood50x100),
          equals(1.25 * (0.005 * 500)));
      expect(
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.trunkWood50x150),
          equals(1.25 * (0.0075 * 500)));
      expect(
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.trunkWood50x200),
          equals(1.25 * (0.01 * 500)));
      expect(
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.trunkWood100x100),
          equals(1.25 * (0.01 * 500)));
      expect(
          WoodMaterialInfo.woodWeightPerSquareMeter(
              WoodMaterialType.trunkWood150x150),
          equals(1.25 * (0.0225 * 500)));
      print('woodWeightPerSquareMeter test passed');
    });

    test('densityKgPerCubicMeter returns correct value', () {
      expect(WoodMaterialInfo.densityKgPerCubicMeter(), equals(500));
      print('densityKgPerCubicMeter test passed');
    });
  });
}
