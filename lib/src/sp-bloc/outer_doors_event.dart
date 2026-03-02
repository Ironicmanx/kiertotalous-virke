abstract class SPOuterDoorsEvent {}

class SPOuterShutWoodenDoorsChanged extends SPOuterDoorsEvent {
  final num? value;
  SPOuterShutWoodenDoorsChanged(this.value);
}

class SPOuterGlassWoodenDoorsChanged extends SPOuterDoorsEvent {
  final num? value;
  SPOuterGlassWoodenDoorsChanged(this.value);
}

class SPOuterShutAluminiumDoorsChanged extends SPOuterDoorsEvent {
  final num? value;
  SPOuterShutAluminiumDoorsChanged(this.value);
}

class SPOuterGlassAluminiumDoorsChanged extends SPOuterDoorsEvent {
  final num? value;
  SPOuterGlassAluminiumDoorsChanged(this.value);
}

class SPOuterShutSteelDoorsChanged extends SPOuterDoorsEvent {
  final num? value;
  SPOuterShutSteelDoorsChanged(this.value);
}

class SPOuterGlassSteelDoorsChanged extends SPOuterDoorsEvent {
  final num? value;
  SPOuterGlassSteelDoorsChanged(this.value);
}

class SPAreDoorsRecyclableChanged extends SPOuterDoorsEvent {
  final bool value;
  SPAreDoorsRecyclableChanged(this.value);
}
