abstract class HallDoorsEvent {}

class WoodenDoorsChanged extends HallDoorsEvent {
  num value;
  WoodenDoorsChanged(this.value);
}

class AluminiumDoorsChanged extends HallDoorsEvent {
  num value;
  AluminiumDoorsChanged(this.value);
}

class SteelDoorsChanged extends HallDoorsEvent {
  num value;
  SteelDoorsChanged(this.value);
}

class AreHallDoorsRecyclableChanged extends HallDoorsEvent {
  bool value;
  AreHallDoorsRecyclableChanged(this.value);
}
