abstract class FixedFurnitureEvent {}

class FixedFurnitureRecyclableChanged extends FixedFurnitureEvent {
  final bool isRecyclable;
  FixedFurnitureRecyclableChanged(this.isRecyclable);
}

class PorcelainToiletsChanged extends FixedFurnitureEvent {
  final num value;
  PorcelainToiletsChanged(this.value);
}

class PorcelainSinksChanged extends FixedFurnitureEvent {
  final num value;
  PorcelainSinksChanged(this.value);
}

class SteelTablesChanged extends FixedFurnitureEvent {
  final num value;
  SteelTablesChanged(this.value);
}

class KitchenClosetsChanged extends FixedFurnitureEvent {
  final num value;
  KitchenClosetsChanged(this.value);
}

class SteelLockerCabinetsChanged extends FixedFurnitureEvent {
  final num value;
  SteelLockerCabinetsChanged(this.value);
}

class ClothingClosetsChanged extends FixedFurnitureEvent {
  final num value;
  ClothingClosetsChanged(this.value);
}

class ElectricStovesChanged extends FixedFurnitureEvent {
  final num value;
  ElectricStovesChanged(this.value);
}

class IndustrialElectricStovesChanged extends FixedFurnitureEvent {
  final num value;
  IndustrialElectricStovesChanged(this.value);
}

class ColdRoomCabinetsChanged extends FixedFurnitureEvent {
  final num value;
  ColdRoomCabinetsChanged(this.value);
}

class RefrigeratorsChanged extends FixedFurnitureEvent {
  final num value;
  RefrigeratorsChanged(this.value);
}

class SaunaStovesChanged extends FixedFurnitureEvent {
  final num value;
  SaunaStovesChanged(this.value);
}
