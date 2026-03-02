abstract class PassageDoorsEvent {}

class PassageShutWoodenDoorsChanged extends PassageDoorsEvent {
  final num? value;
  PassageShutWoodenDoorsChanged(this.value);
}

class PassageGlassWoodenDoorsChanged extends PassageDoorsEvent {
  final num? value;
  PassageGlassWoodenDoorsChanged(this.value);
}

class PassageShutAluminiumDoorsChanged extends PassageDoorsEvent {
  final num? value;
  PassageShutAluminiumDoorsChanged(this.value);
}

class PassageGlassAluminiumDoorsChanged extends PassageDoorsEvent {
  final num? value;
  PassageGlassAluminiumDoorsChanged(this.value);
}

class PassageShutSteelDoorsChanged extends PassageDoorsEvent {
  final num? value;
  PassageShutSteelDoorsChanged(this.value);
}

class PassageGlassSteelDoorsChanged extends PassageDoorsEvent {
  final num? value;
  PassageGlassSteelDoorsChanged(this.value);
}

class PassageAreDoorsRecyclableChanged extends PassageDoorsEvent {
  final bool value;
  PassageAreDoorsRecyclableChanged(this.value);
}
