abstract class SmallPropertiesFoundationEvent {}

class ContainsAsbestosChanged extends SmallPropertiesFoundationEvent {
  final bool value;
  ContainsAsbestosChanged(this.value);
}

class ContainsPcbPaintsChanged extends SmallPropertiesFoundationEvent {
  final bool value;
  ContainsPcbPaintsChanged(this.value);
}

class PlinthLengthChanged extends SmallPropertiesFoundationEvent {
  final num? value;
  PlinthLengthChanged(this.value);
}

class PlinthThicknessChanged extends SmallPropertiesFoundationEvent {
  final num? value;
  PlinthThicknessChanged(this.value);
}

class ConcreteSlabAreaChanged extends SmallPropertiesFoundationEvent {
  final num? value;
  ConcreteSlabAreaChanged(this.value);
}

class PlinthHeightChanged extends SmallPropertiesFoundationEvent {
  final num? value;
  PlinthHeightChanged(this.value);
}

class ConcreteSlabThicknessChanged extends SmallPropertiesFoundationEvent {
  final num? value;
  ConcreteSlabThicknessChanged(this.value);
}
