import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class BituminousMixturesCoalTarProductsEvent {}

class CoalTarContainingBituminousMixturesNotesChanged
    extends BituminousMixturesCoalTarProductsEvent {
  final String? value;
  CoalTarContainingBituminousMixturesNotesChanged(this.value);
}

class OtherBituminousMixturesChanged
    extends BituminousMixturesCoalTarProductsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  OtherBituminousMixturesChanged(this.value);
}

class UnnamedChanged extends BituminousMixturesCoalTarProductsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  UnnamedChanged(this.value);
}

class CoalTarAndTarProductsChanged
    extends BituminousMixturesCoalTarProductsEvent {
  final WasteLawDemolitionMaterialEstimateEntry? value;
  CoalTarAndTarProductsChanged(this.value);
}

class OtherBituminousMixturesVolumeChanged
    extends BituminousMixturesCoalTarProductsEvent {
  final num? value;
  OtherBituminousMixturesVolumeChanged(this.value);
}

class OtherBituminousMixturesTonsChanged
    extends BituminousMixturesCoalTarProductsEvent {
  final num? value;
  OtherBituminousMixturesTonsChanged(this.value);
}

class OtherBituminousMixturesNotesChanged
    extends BituminousMixturesCoalTarProductsEvent {
  String? value;
  OtherBituminousMixturesNotesChanged(this.value);
}

class UnnamedVolumeChanged extends BituminousMixturesCoalTarProductsEvent {
  final num? value;
  UnnamedVolumeChanged(this.value);
}

class UnnamedTonsChanged extends BituminousMixturesCoalTarProductsEvent {
  final num? value;
  UnnamedTonsChanged(this.value);
}

class UnnamedNotesChanged extends BituminousMixturesCoalTarProductsEvent {
  String? value;
  UnnamedNotesChanged(this.value);
}

class CoalTarAndTarProductsVolumeChanged
    extends BituminousMixturesCoalTarProductsEvent {
  final num? value;
  CoalTarAndTarProductsVolumeChanged(this.value);
}

class CoalTarAndTarProductsTonsChanged
    extends BituminousMixturesCoalTarProductsEvent {
  final num? value;
  CoalTarAndTarProductsTonsChanged(this.value);
}

class CoalTarAndTarProductsNotesChanged
    extends BituminousMixturesCoalTarProductsEvent {
  String? value;
  CoalTarAndTarProductsNotesChanged(this.value);
}
