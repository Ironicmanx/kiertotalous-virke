abstract class MachinesOrEquipments {
  final int? quantity;
  final num? weightKgPerPiece;

  const MachinesOrEquipments({this.quantity, this.weightKgPerPiece});

  num? get tons {
    if (quantity == null) {
      return null;
    }

    return (weightKgPerPiece ?? defaultWeightKgPerPiece) * quantity! / 1000;
  }

  num get defaultWeightKgPerPiece;
}
