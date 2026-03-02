import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class InternalWallFramesAndSurfaceMaterialEvent {}

class OverallLengthOfInternalWallsAllFloorsChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final num amount;
  OverallLengthOfInternalWallsAllFloorsChanged(this.amount);
}

class AverageHeightOfInternalWallsChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final num amount;
  AverageHeightOfInternalWallsChanged(this.amount);
}

class RoomSpaceChanged extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace roomSpace;
  RoomSpaceChanged(this.roomSpace);
}

class OfficeSpacesChanged extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace value;
  OfficeSpacesChanged(this.value);
}

class LobbiesAndOtherCommonAreasChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace value;
  LobbiesAndOtherCommonAreasChanged(this.value);
}

class RestroomsAndWashingFacilitiesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace value;
  RestroomsAndWashingFacilitiesChanged(this.value);
}

class KitchensChanged extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace value;
  KitchensChanged(this.value);
}

class TeachingAndTreatmentSpacesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace value;
  TeachingAndTreatmentSpacesChanged(this.value);
}

class StorageAndWorkSpacesChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace value;
  StorageAndWorkSpacesChanged(this.value);
}

class OtherSpacesChanged extends InternalWallFramesAndSurfaceMaterialEvent {
  final RoomSpace value;
  OtherSpacesChanged(this.value);
}

class SurfaceMaterialCoatingContainsAsbestosChanged
    extends InternalWallFramesAndSurfaceMaterialEvent {
  final bool containsAsbestos;
  SurfaceMaterialCoatingContainsAsbestosChanged(this.containsAsbestos);
}
