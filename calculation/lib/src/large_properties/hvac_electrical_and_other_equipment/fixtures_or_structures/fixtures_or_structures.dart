abstract class FixturesOrStructures {
  final num? meters;
  final num? weightKgPerMeter;

  const FixturesOrStructures({this.meters, this.weightKgPerMeter});

  num? get tons {
    if (meters == null) {
      return null;
    }

    return (weightKgPerMeter ?? defaultWeightKgPerMeter) * meters! / 1000;
  }

  num get defaultWeightKgPerMeter;
}
