import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class SmallPropertiesRoofsEvent {}

class ContainsRecyclableWoodChanged extends SmallPropertiesRoofsEvent {
  final bool value;
  ContainsRecyclableWoodChanged(this.value);
}

class CoveringMaterialContainsAsbestosChanged
    extends SmallPropertiesRoofsEvent {
  final bool value;
  CoveringMaterialContainsAsbestosChanged(this.value);
}

class SlopeLengthInMetersChanged extends SmallPropertiesRoofsEvent {
  final num? value;
  SlopeLengthInMetersChanged(this.value);
}

class SlopeWidhthInMetersChanged extends SmallPropertiesRoofsEvent {
  final num? value;
  SlopeWidhthInMetersChanged(this.value);
}

class SmallPropertyRoofTypeChanged extends SmallPropertiesRoofsEvent {
  final SmallPropertyRoofType? value;
  SmallPropertyRoofTypeChanged(this.value);
}

class WaterRoofTypeChanged extends SmallPropertiesRoofsEvent {
  final WaterRoofType? waterRoofType;
  WaterRoofTypeChanged(this.waterRoofType);
}
