abstract class OuterDoorsEvent {}

class OuterShutWoodenDoorsChanged extends OuterDoorsEvent {
  final num? value;
  OuterShutWoodenDoorsChanged(this.value);
}

class OuterGlassWoodenDoorsChanged extends OuterDoorsEvent {
  final num? value;
  OuterGlassWoodenDoorsChanged(this.value);
}

class OuterShutAluminiumDoorsChanged extends OuterDoorsEvent {
  final num? value;
  OuterShutAluminiumDoorsChanged(this.value);
}

class OuterGlassAluminiumDoorsChanged extends OuterDoorsEvent {
  final num? value;
  OuterGlassAluminiumDoorsChanged(this.value);
}

class OuterShutSteelDoorsChanged extends OuterDoorsEvent {
  final num? value;
  OuterShutSteelDoorsChanged(this.value);
}

class OuterGlassSteelDoorsChanged extends OuterDoorsEvent {
  final num? value;
  OuterGlassSteelDoorsChanged(this.value);
}

class OuterAccessAndLoadingDoorsChanged extends OuterDoorsEvent {
  final num? value;
  OuterAccessAndLoadingDoorsChanged(this.value);
}

class OuterAreDoorsRecyclableChanged extends OuterDoorsEvent {
  final bool value;
  OuterAreDoorsRecyclableChanged(this.value);
}
