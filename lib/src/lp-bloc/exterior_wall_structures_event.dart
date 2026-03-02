import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:equatable/equatable.dart';

abstract class DoubleLoadBearingBrickWallEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadData extends DoubleLoadBearingBrickWallEvent {
  final TotalBuildingFrame totalBuildingFrame;

  LoadData(this.totalBuildingFrame);

  @override
  List<Object?> get props => [totalBuildingFrame];
}
