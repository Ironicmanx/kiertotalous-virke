import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class FloorStructuresEvent {}

class OfficeSpacesChanged extends FloorStructuresEvent {
  final FloorStructure floorStructure;
  OfficeSpacesChanged(this.floorStructure);
}

class LobbiesAndOtherCommonAreasChanged extends FloorStructuresEvent {
  final FloorStructure floorStructure;
  LobbiesAndOtherCommonAreasChanged(this.floorStructure);
}

class RestRoomsAndWashingFacilitiesChanged extends FloorStructuresEvent {
  final FloorStructure floorStructure;
  RestRoomsAndWashingFacilitiesChanged(this.floorStructure);
}

class KitchensChanged extends FloorStructuresEvent {
  final FloorStructure floorStructure;
  KitchensChanged(this.floorStructure);
}

class TeachingAndTreatmentSpacesChanged extends FloorStructuresEvent {
  final FloorStructure floorStructure;
  TeachingAndTreatmentSpacesChanged(this.floorStructure);
}

class StorageAndWorkspacesChanged extends FloorStructuresEvent {
  final FloorStructure floorStructure;
  StorageAndWorkspacesChanged(this.floorStructure);
}

class OtherSpacesChanged extends FloorStructuresEvent {
  final FloorStructure floorStructure;
  OtherSpacesChanged(this.floorStructure);
}

class SurfaceMaterialCoatingContainsAsbestosChanged
    extends FloorStructuresEvent {
  final bool asbestos;
  SurfaceMaterialCoatingContainsAsbestosChanged(this.asbestos);
}
