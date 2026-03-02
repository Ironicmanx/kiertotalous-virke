abstract class InnerDoorsEvent {}

/// Event for inner doors recyclability change
class InnerDoorRecyclableChanged extends InnerDoorsEvent {
  final bool value;

  InnerDoorRecyclableChanged(this.value);
}

class InnerShutPanelDoorsChanged extends InnerDoorsEvent {
  final num? value;
  InnerShutPanelDoorsChanged(this.value);
}

class InnerGlassPanelDoorsChanged extends InnerDoorsEvent {
  final num? value;
  InnerGlassPanelDoorsChanged(this.value);
}

class InnerShutWoodenDoorsChanged extends InnerDoorsEvent {
  final num? value;
  InnerShutWoodenDoorsChanged(this.value);
}

class InnerGlassWoodenDoorsChanged extends InnerDoorsEvent {
  final num? value;
  InnerGlassWoodenDoorsChanged(this.value);
}

class InnerShutFireDoorsChanged extends InnerDoorsEvent {
  final num? value;
  InnerShutFireDoorsChanged(this.value);
}

class InnerGlassFireDoorsChanged extends InnerDoorsEvent {
  final num? value;
  InnerGlassFireDoorsChanged(this.value);
}

// /// Event for changing the number of shut doors for panel doors
// class InnerDoorPanelShutDoorsChanged extends InnerDoorsEvent {
//   final int value;

//   InnerDoorPanelShutDoorsChanged(this.value);
// }

// /// Event for changing the number of shut doors for wooden doors
// class InnerDoorWoodenShutDoorsChanged extends InnerDoorsEvent {
//   final int value;

//   InnerDoorWoodenShutDoorsChanged(this.value);
// }

// /// Event for changing the number of shut doors for fire doors
// class InnerDoorFireShutDoorsChanged extends InnerDoorsEvent {
//   final int value;

//   InnerDoorFireShutDoorsChanged(this.value);
// }

// /// Event for changing the number of glass doors for panel doors
// class InnerDoorPanelGlassDoorsChanged extends InnerDoorsEvent {
//   final int value;

//   InnerDoorPanelGlassDoorsChanged(this.value);
// }

// /// Event for changing the number of glass doors for wooden doors
// class InnerDoorWoodenGlassDoorsChanged extends InnerDoorsEvent {
//   final int value;

//   InnerDoorWoodenGlassDoorsChanged(this.value);
// }
