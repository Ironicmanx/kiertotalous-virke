abstract class SPInnerDoorsEvent {}

class SPInnerShutWoodenDoorsChanged extends SPInnerDoorsEvent {
  final num? value;
  SPInnerShutWoodenDoorsChanged(this.value);
}

class SPInnerGlassWoodenDoorsChanged extends SPInnerDoorsEvent {
  final num? value;
  SPInnerGlassWoodenDoorsChanged(this.value);
}

class SPInnerShutPanelDoorsChanged extends SPInnerDoorsEvent {
  final num? value;
  SPInnerShutPanelDoorsChanged(this.value);
}

class SPInnerGlassPanelDoorsChanged extends SPInnerDoorsEvent {
  final num? value;
  SPInnerGlassPanelDoorsChanged(this.value);
}

class SPInnerDoorsAreDoorsRecyclableChanged extends SPInnerDoorsEvent {
  final bool value;
  SPInnerDoorsAreDoorsRecyclableChanged(this.value);
}
