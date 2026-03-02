abstract class SpWindowsEvent {}

class WoodenFramePcsChanged extends SpWindowsEvent {
  num value;
  WoodenFramePcsChanged(this.value);
}

class SteelPcsChanged extends SpWindowsEvent {
  num value;
  SteelPcsChanged(this.value);
}

class AluminiumPcsChanged extends SpWindowsEvent {
  num value;
  AluminiumPcsChanged(this.value);
}

class AreWindowsRecyclableChanged extends SpWindowsEvent {
  bool value;
  AreWindowsRecyclableChanged(this.value);
}
