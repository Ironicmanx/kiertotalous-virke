import 'package:freezed_annotation/freezed_annotation.dart';

import '../apartments/apartment.dart';
import '../apartments/apartment_size.dart';

part 'apartments.freezed.dart';
part 'apartments.g.dart';

/// Huoneistot
@freezed
abstract class Apartments with _$Apartments {
  const Apartments._();

  const factory Apartments(
      {required ApartmentSize apartmentSize,
      required Apartment apartment}) = _Apartments;

  factory Apartments.fromJson(Map<String, dynamic> json) =>
      _$ApartmentsFromJson(json);

  /// Huoneiston koko
  /// 1h, kpl
  num? get oneRoomPcs => apartmentSize.oneRoom?.pcsPerHouse;

  /// 1h, lattia-ala (m2)
  num? get oneRoomFloorArea => apartmentSize.oneRoom?.floorAreaPerApartment;

  /// 2h, kpl
  num? get twoRoomPcs => apartmentSize.twoRooms?.pcsPerHouse;

  /// 2h, lattia-ala (m2)
  num? get twoRoomFloorArea => apartmentSize.twoRooms?.floorAreaPerApartment;

  /// 3h, kpl
  num? get threeRoomPcs => apartmentSize.threeRooms?.pcsPerHouse;

  /// 3h, lattia-ala (m2)
  num? get threeRoomFloorArea =>
      apartmentSize.threeRooms?.floorAreaPerApartment;

  /// 4h, kpl
  num? get fourRoomPcs => apartmentSize.fourRooms?.pcsPerHouse;

  /// 4h, lattia-ala (m2)
  num? get fourRoomFloorArea => apartmentSize.fourRooms?.floorAreaPerApartment;

  /// Yhteensä, kpl
  num? get totalPcs => apartmentSize.totalRoomCount;

  /// Yhteensä, lattia-ala (m2)
  num? get totalFloorArea => apartmentSize.totalFloorArea;
}
