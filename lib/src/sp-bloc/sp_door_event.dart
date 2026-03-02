import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SpDoorEvent {}

class PassageDoorsChanged extends SpDoorEvent {
  PassageDoors passageDoors;
  PassageDoorsChanged(this.passageDoors);
}

class HallDoorsChanged extends SpDoorEvent {
  HallDoors hallDoors;
  HallDoorsChanged(this.hallDoors);
}
