abstract class HvacOrElectricalInstallations {
  final num? meters;
  final num? weightKgPerMeter;

  const HvacOrElectricalInstallations({this.meters, this.weightKgPerMeter});

  num? get volume => null;

  num? get tons {
    if (meters == null) {
      return null;
    }

    return (weightKgPerMeter ?? defaultWeightKgPerMeter) * meters! / 1000;
  }

  num get defaultWeightKgPerMeter;
}
