import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SPApartmentSizeEvent {}

class OneRoomChanged extends SPApartmentSizeEvent {
  Apartment apartment;
  OneRoomChanged(this.apartment);
}

class TwoRoomsChanged extends SPApartmentSizeEvent {
  Apartment apartment;
  TwoRoomsChanged(this.apartment);
}

class ThreeRoomsChanged extends SPApartmentSizeEvent {
  Apartment apartment;
  ThreeRoomsChanged(this.apartment);
}

class FourRoomsChanged extends SPApartmentSizeEvent {
  Apartment apartment;
  FourRoomsChanged(this.apartment);
}
