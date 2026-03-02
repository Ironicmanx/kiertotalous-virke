abstract class YardOrProtectiveStructures {
  final num? squareMeters;
  final num? weightKgPerSquareMeter;

  const YardOrProtectiveStructures(
      {this.squareMeters, this.weightKgPerSquareMeter});

  num? get tons {
    if (squareMeters == null) {
      return null;
    }

    return (weightKgPerSquareMeter ?? defaultWeightKgPerSquareMeter) *
        squareMeters! /
        1000;
  }

  num get defaultWeightKgPerSquareMeter;
}
