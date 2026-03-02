import 'package:flutter_app/src/lp-bloc/exterior_wall_structures_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoubleLoadBearingBrickWallBloc extends Bloc<
    DoubleLoadBearingBrickWallEvent, DoubleLoadBearingBrickWallState> {
  DoubleLoadBearingBrickWallBloc() : super(DoubleLoadBearingBrickWallState()) {
    on<LoadData>((event, emit) async {
      try {
        final portionFractionPercentage = event.totalBuildingFrame
            .doubleLoadBearingBrickWallPart.portionPercentage;
        final area =
            event.totalBuildingFrame.doubleLoadBearingBrickWallPart.area;
        final brickVolume =
            event.totalBuildingFrame.doubleLoadBearingBrickWallPart.brickVolume;
        final brickTons =
            event.totalBuildingFrame.doubleLoadBearingBrickWallPart.brickTons;

        emit(state.copyWith(
          portionFractionPercentage: portionFractionPercentage,
          area: area,
          brickVolume: brickVolume,
          brickTons: brickTons,
        ));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    });
  }
}

class DoubleLoadBearingBrickWallState {
  final num? portionFractionPercentage;
  final num? area;
  final num? brickVolume;
  final num? brickTons;
  final String? errorMessage;

  DoubleLoadBearingBrickWallState({
    this.portionFractionPercentage,
    this.area,
    this.brickVolume,
    this.brickTons,
    this.errorMessage,
  });

  DoubleLoadBearingBrickWallState copyWith({
    num? portionFractionPercentage,
    num? area,
    num? brickVolume,
    num? brickTons,
    String? errorMessage,
  }) {
    return DoubleLoadBearingBrickWallState(
      portionFractionPercentage:
          portionFractionPercentage ?? this.portionFractionPercentage,
      area: area ?? this.area,
      brickVolume: brickVolume ?? this.brickVolume,
      brickTons: brickTons ?? this.brickTons,
      errorMessage: errorMessage,
    );
  }
}
