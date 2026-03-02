import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class TotalBituminousMixturesCoalTarProductsEvent {}

class BituminousMixturesCoalTarProductsChanged
    extends TotalBituminousMixturesCoalTarProductsEvent {
  final BituminousMixturesCoalTarProducts bituminousMixturesCoalTarProducts;
  BituminousMixturesCoalTarProductsChanged(
      this.bituminousMixturesCoalTarProducts);
}

class TotalDemolitionWasteAndCostsChanged
    extends TotalBituminousMixturesCoalTarProductsEvent {
  final TotalDemolitionWasteAndCosts totalDemolitionWasteAndCosts;
  TotalDemolitionWasteAndCostsChanged(this.totalDemolitionWasteAndCosts);
}
