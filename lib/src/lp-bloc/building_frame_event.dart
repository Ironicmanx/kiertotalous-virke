abstract class BuildingFrameEvent {}

class UseFoundationCircumferenceChanged extends BuildingFrameEvent {
  final bool value;
  UseFoundationCircumferenceChanged(this.value);
}

class ExternalWallsPerimeterChanged extends BuildingFrameEvent {
  final num? value;
  ExternalWallsPerimeterChanged(this.value);
}

class ExternalWallsAverageHeightChanged extends BuildingFrameEvent {
  final num? value;
  ExternalWallsAverageHeightChanged(this.value);
}

class AreMaterialsRecyclableChanged extends BuildingFrameEvent {
  final bool value;
  AreMaterialsRecyclableChanged(this.value);
}

class WoodPortionPercentageChanged extends BuildingFrameEvent {
  final num? value;
  WoodPortionPercentageChanged(this.value);
}

class GlulamVerticalColumnsPortionPercentageChanged extends BuildingFrameEvent {
  final num? value;
  GlulamVerticalColumnsPortionPercentageChanged(this.value);
}

class ConcreteVerticalColumnsPortionPercentageChanged
    extends BuildingFrameEvent {
  final num? value;
  ConcreteVerticalColumnsPortionPercentageChanged(this.value);
}

class SteelVerticalColumnsPortionPercentageChanged extends BuildingFrameEvent {
  final num? value;
  SteelVerticalColumnsPortionPercentageChanged(this.value);
}

class DoubleLoadBearingBrickWallPortionPercentageChanged
    extends BuildingFrameEvent {
  final num? value;
  DoubleLoadBearingBrickWallPortionPercentageChanged(this.value);
}

class ConcreteElementWallsWithoutFrameworkPortionPercentageChanged
    extends BuildingFrameEvent {
  final num? value;
  ConcreteElementWallsWithoutFrameworkPortionPercentageChanged(this.value);
}

class BrickCladWallPortionPercentageChanged extends BuildingFrameEvent {
  final num? value;
  BrickCladWallPortionPercentageChanged(this.value);
}

class BoardWallPortionPercentageChanged extends BuildingFrameEvent {
  final num? value;
  BoardWallPortionPercentageChanged(this.value);
}

class ProfiledSheetMetalPortionPercentageChanged extends BuildingFrameEvent {
  final num? value;
  ProfiledSheetMetalPortionPercentageChanged(this.value);
}

class SteelProfileSandwichStructurePortionPercentageChanged
    extends BuildingFrameEvent {
  final num? value;
  SteelProfileSandwichStructurePortionPercentageChanged(this.value);
}

class MineriteOrOtherStoneBoardPortionPercentageChanged
    extends BuildingFrameEvent {
  final num? value;
  MineriteOrOtherStoneBoardPortionPercentageChanged(this.value);
}
