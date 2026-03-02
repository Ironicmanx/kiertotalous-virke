import 'package:test/test.dart';

import 'package:bl_demolition_materials/bl_demolition_materials.dart';

void main() {
  // the purpose of these tests are to explore Foundations functionality
  group('Foundations class', () {
    test('values can be changed', () {
      Foundations foundation = Foundations();
      foundation = foundation.copyWith(
        falsePlinth: FalsePlinthFoundation(
          area: 1,
          circumference: 2,
          material: FoundationMaterial.concreteBlock,
        ),
      );
      expect(
        foundation.falsePlinth?.material,
        equals(
          FoundationMaterial.concreteBlock,
        ),
      );
    });

    test('copied Foundations is a different instance', () {
      Foundations foundation = Foundations();
      // make a copy
      Foundations foundation2 = foundation;
      foundation2 = foundation2.copyWith(
        crawlSpace: CrawlSpaceFoundation(
          area: 2,
        ),
      );
      expect(
        // original instance didn't change
        foundation.crawlSpace?.area,
        equals(null),
      );
      expect(
        // copied instance has changed
        foundation2.crawlSpace?.area,
        equals(2),
      );
    });

    test('setting Foundations attributes with a passed function is doable', () {
      Foundations foundation = Foundations();
      // something like this works as a setter
      setCrawlSpaceArea(value) {
        foundation = foundation.copyWith(
          crawlSpace: CrawlSpaceFoundation(
            area: value,
          ),
        );
      }

      setCrawlSpaceArea(5);
      expect(
        foundation.crawlSpace?.area,
        equals(5),
      );
    });

    test('getting Foundations attributes with a passed function is doable', () {
      Foundations foundation = Foundations();
      foundation = foundation.copyWith(
        crawlSpace: CrawlSpaceFoundation(
          area: 4,
        ),
      );
      // getter
      num? getCrawlSpaceArea() {
        return foundation.crawlSpace?.area;
      }

      expect(
        getCrawlSpaceArea(),
        equals(4),
      );
    });

    test('total area works as expected with a mix of nulls and numbers', () {
      Foundations foundation = Foundations();
      foundation = foundation.copyWith(
        crawlSpace: CrawlSpaceFoundation(
          area: 1,
        ),
        falsePlinth: FalsePlinthFoundation(
          area: 2,
        ),
        shallow: ShallowFoundation(
          area: 3,
        ),
      );
      expect(
        foundation.pillar?.area,
        equals(null),
      );
      expect(
        foundation.area,
        equals(6),
      );
    });

    group('CrawlSpaceFoundation basic tests', () {
      late CrawlSpaceFoundation crawlSpaceFoundation;

      setUpAll(() {
        crawlSpaceFoundation = CrawlSpaceFoundation(
            area: 100,
            circumference: 100,
            material: FoundationMaterial.concreteCasting);
      });

      test('concrete volume', () {
        expect(crawlSpaceFoundation.concreteVolume, equals(18));
      });

      test('concrete tons', () {
        expect(crawlSpaceFoundation.concreteTons, equals(70));
      });

      test('rebar tons', () {
        expect(crawlSpaceFoundation.rebarTons, equals(0));
      });

      test('CrawlSpaceFoundation#solidBoardingAndWoodFrameVolume', () {
        final asd = SolidBoardingCrawlSpaceGroundFloor(crawlSpaceFoundation);
        expect(asd.volume, equals(4));
        expect(asd.tons, equals(2));

        final dsa = WoodFrameCrawlSpaceGroundFloor(crawlSpaceFoundation);
        expect(dsa.volume, equals(0.62));
        expect(dsa.tons, equals(0.31));

        expect(
            crawlSpaceFoundation.solidBoardingAndWoodFrameVolume, equals(4.62));
      });

      test('CrawlSpaceFoundation#solidBoardingAndWoodFrameTons', () {
        expect(
            crawlSpaceFoundation.solidBoardingAndWoodFrameTons, equals(0.62));
      });
    });

    group('ShallowFoundation basic tests', () {
      late ShallowFoundation shallowFoundation;

      setUpAll(() {
        shallowFoundation = ShallowFoundation(area: 100, circumference: 100);
      });

      test('concrete volume', () {
        expect(shallowFoundation.concreteVolume, equals(20));
      });

      test('concrete tons', () {
        expect(shallowFoundation.concreteTons, equals(50));
      });

      test('rebar tons', () {
        expect(shallowFoundation.rebarTons, equals(2));
      });
    });

    group('PillarFoundation basic tests', () {
      late PillarFoundation pillarFoundation;

      setUpAll(() {
        pillarFoundation = PillarFoundation(
            area: 100,
            circumference: 100,
            material: FoundationMaterial.concreteBlock);
      });

      test('concrete block volume', () {
        expect(pillarFoundation.concreteBlockVolume, equals(18));
      });

      test('concrete block tons', () {
        expect(pillarFoundation.concreteBlockTons, equals(12.6));
      });
    });

    group('HollowCoreSlabFoundation basic tests', () {
      late HollowCoreSlabFoundation hollowCoreSlabFoundation;

      setUpAll(() {
        hollowCoreSlabFoundation = HollowCoreSlabFoundation(
            area: 100,
            circumference: 100,
            material: FoundationMaterial.concreteBlock);
      });

      test('concrete block volume', () {
        expect(hollowCoreSlabFoundation.concreteBlockVolume, equals(18));
      });

      test('concrete block tons', () {
        expect(hollowCoreSlabFoundation.concreteBlockTons, equals(12.6));
      });

      test('plastic waste tons', () {
        expect(hollowCoreSlabFoundation.plasticWasteTons, equals(25.381));
      });
    });
  });
}
