abstract class LargePropertyBasicInfoEvent {}

// Changing material
class LargePropertyNameChanged extends LargePropertyBasicInfoEvent {
  final String? propertyName;

  LargePropertyNameChanged(this.propertyName);
}

class LargePropertyBuildingTypeChanged extends LargePropertyBasicInfoEvent {
  final String? buildingType;

  LargePropertyBuildingTypeChanged(this.buildingType);
}

class LargePropertyAddressChanged extends LargePropertyBasicInfoEvent {
  final String? address;

  LargePropertyAddressChanged(this.address);
}

class LargePropertyMunicipalityChanged extends LargePropertyBasicInfoEvent {
  final String? municipality;

  LargePropertyMunicipalityChanged(this.municipality);
}

class LargePropertyCalcAuthorChanged extends LargePropertyBasicInfoEvent {
  final String? author;

  LargePropertyCalcAuthorChanged(this.author);
}

class LargePropertyDateChanged extends LargePropertyBasicInfoEvent {
  final String? date;

  LargePropertyDateChanged(this.date);
}

class LargePropertyVersionChanged extends LargePropertyBasicInfoEvent {
  final String? version;

  LargePropertyVersionChanged(this.version);
}

class LargePropertyDescriptionChanged extends LargePropertyBasicInfoEvent {
  final String? description;

  LargePropertyDescriptionChanged(this.description);
}
