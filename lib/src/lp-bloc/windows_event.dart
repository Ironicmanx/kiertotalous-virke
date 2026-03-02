abstract class WindowsEvent {}

// Changing number of windows
class WindowsPcsChanged extends WindowsEvent {
  final num value;
  WindowsPcsChanged(this.value);
}

// Changing window area
class WindowsAreaChanged extends WindowsEvent {
  final num value;
  WindowsAreaChanged(this.value);
}

// Changing glass wall area
class GlassWallAreaChanged extends WindowsEvent {
  final num value;
  GlassWallAreaChanged(this.value);
}

// Changing recyclability status
class WindowsRecyclabilityChanged extends WindowsEvent {
  final bool isRecyclable;
  WindowsRecyclabilityChanged(this.isRecyclable);
}
