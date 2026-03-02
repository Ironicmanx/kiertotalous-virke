import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class DoorsEvent {}

class InnerDoorsChanged extends DoorsEvent {
  final InnerDoors innerDoors;
  InnerDoorsChanged(this.innerDoors);
}

class OuterDoorsChanged extends DoorsEvent {
  final OuterDoors outerDoors;
  OuterDoorsChanged(this.outerDoors);
}
