abstract class SmallPropertyBasicInfoEvent {}

class SmallPropertyNameChanged extends SmallPropertyBasicInfoEvent {
  final String? propertyName;

  SmallPropertyNameChanged(this.propertyName);
}

class SmallPropertyBuildingTypeChanged extends SmallPropertyBasicInfoEvent {
  final String? buildingType;

  SmallPropertyBuildingTypeChanged(this.buildingType);
}

class SmallPropertyAddressChanged extends SmallPropertyBasicInfoEvent {
  final String? address;

  SmallPropertyAddressChanged(this.address);
}

class IsHazardousSubstanceSurveyDoneChanged
    extends SmallPropertyBasicInfoEvent {
  final bool value;
  IsHazardousSubstanceSurveyDoneChanged(this.value);
}
