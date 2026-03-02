import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../bl_demolition_materials.dart';
import '../../utils/utils.dart';

part 'fixed_furniture.freezed.dart';
part 'fixed_furniture.g.dart';

@freezed
abstract class FixedFurniture with _$FixedFurniture {
  const factory FixedFurniture(
      {@Default(false) bool isFurnitureRecyclable,
      num? porcelainToilets,
      num? porcelainSinks,
      num? steelTables,
      num? kitchenClosetsWoodOrChipboard,
      num? steelLockerCabinets,
      num? clothingOrOtherClosetsWood,
      num? electricStoves,
      num? industrialElectricStoves,
      num? coldRoomCabinets,
      num? refrigerators,
      num? saunaStoves}) = _FixedFurniture;

  factory FixedFurniture.fromJson(Map<String, dynamic> json) =>
      _$FixedFurnitureFromJson(json);

  const FixedFurniture._();

  num? get ceramicVolume {
    final allNulls = !Utils.anyNonNull([
      Utils.multiplyOrNull([
        porcelainToilets,
        FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerPcs
      ]),
      Utils.multiplyOrNull([
        porcelainSinks,
        FurnitureDressingKitchenToiletSpaceWeights.toiletSinkPorcelainKgPerPcs
      ]),
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            porcelainToilets,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSeatPorcelainKgPerPcs
          ]),
          Utils.multiplyOrZero([
            porcelainSinks,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSinkPorcelainKgPerPcs
          ]),
        ])! /
        FurnitureDressingKitchenToiletSpaceWeights.toiletSeatPorcelainKgPerCbm;
  }

  num? get ceramicTons {
    final allNulls = !Utils.anyNonNull([porcelainToilets, porcelainSinks]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            porcelainToilets,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSeatPorcelainKgPerPcs
          ]),
          Utils.multiplyOrZero([
            porcelainSinks,
            FurnitureDressingKitchenToiletSpaceWeights
                .toiletSinkPorcelainKgPerPcs
          ]),
        ])! /
        1000;
  }

  num? get stainlessSteelTons {
    if (steelTables == null) {
      return null;
    }
    return steelTables! *
        FurnitureDressingKitchenToiletSpaceWeights
            .steelSinksAndTablesRustProofKgPerPcs /
        1000;
  }

  num? get steelTons {
    if (steelLockerCabinets == null) {
      return null;
    }
    return steelLockerCabinets! *
        FurnitureDressingKitchenToiletSpaceWeights
            .metallicDressingClosets500x1600KgPerLinearMeter /
        1000;
  }

  num? get chipboardVolume {
    final allNulls = !Utils.anyNonNull([
      kitchenClosetsWoodOrChipboard,
      clothingOrOtherClosetsWood,
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          kitchenClosetsWoodOrChipboard,
          clothingOrOtherClosetsWood,
        ])! *
        FurnitureDressingKitchenToiletSpaceWeights
            .woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter /
        FurnitureDressingKitchenToiletSpaceWeights
            .woodBasedClosetsAndOtherFurnitureWidth06MKgPerCbm;
  }

  num? get chipboardTons {
    final allNulls = !Utils.anyNonNull([
      kitchenClosetsWoodOrChipboard,
      clothingOrOtherClosetsWood,
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          kitchenClosetsWoodOrChipboard,
          clothingOrOtherClosetsWood,
        ])! *
        FurnitureDressingKitchenToiletSpaceWeights
            .woodBasedClosetsAndOtherFurnitureWidth06MKgPerLinearMeter /
        1000;
  }

  num? get electricScrapTons {
    final allNulls = !Utils.anyNonNull([
      electricStoves,
      industrialElectricStoves,
      coldRoomCabinets,
      refrigerators,
      saunaStoves,
    ]);

    if (allNulls) {
      return null;
    }
    return Utils.sumOrNull([
          Utils.multiplyOrZero([
            electricStoves,
            FurnitureDressingKitchenToiletSpaceWeights
                .electricStovesForApartmentsKgPerPcs
          ]),
          Utils.multiplyOrZero([
            industrialElectricStoves,
            FurnitureDressingKitchenToiletSpaceWeights
                .foodServiceElectricStovesKgPerPcs
          ]),
          Utils.multiplyOrZero([
            coldRoomCabinets,
            FurnitureDressingKitchenToiletSpaceWeights.coldRoomCabinetsKgPerPcs
          ]),
          Utils.multiplyOrZero([
            refrigerators,
            FurnitureDressingKitchenToiletSpaceWeights.refrigeratorsKgPerPcs
          ]),
          Utils.multiplyOrZero([
            saunaStoves,
            FurnitureDressingKitchenToiletSpaceWeights.saunaStovesKgPerPcs
          ]),
        ])! /
        1000;
  }
}
