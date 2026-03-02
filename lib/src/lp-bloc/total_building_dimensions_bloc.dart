import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/building_dimensions_bloc.dart';
import 'package:flutter_app/src/lp-bloc/building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/cellar_bloc.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_dimensions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBuildingDimensionsBloc
    extends Bloc<TotalBuildingDimensionsEvent, TotalBuildingDimensions> {
  final BuildingDimensionsBloc buildingDimensionsBloc;
  final CellarBloc cellarBloc;
  final FoundationsBloc foundationsBloc;
  final BuildingFrameBloc buildingFrameBloc;
  TotalBuildingDimensionsBloc({
    required this.buildingDimensionsBloc,
    required this.cellarBloc,
    required this.foundationsBloc,
    required this.buildingFrameBloc,
  }) : super(
          TotalBuildingDimensions(
            buildingDimensions: buildingDimensionsBloc.state,
            cellar: cellarBloc.state,
            foundations: foundationsBloc.state,
            buildingFrame: buildingFrameBloc.state,
          ),
        ) {
    // handle events
    on<BuildingDimensionsChanged>((event, emit) {
      emit(state.copyWith(buildingDimensions: event.buildingDimensions));
      logger.d(
          'TotalBuildingDimensions.buildingDimensions changed to ${event.buildingDimensions}');
    });
    on<CellarChanged>((event, emit) {
      emit(state.copyWith(cellar: event.cellar));
      logger.d('TotalBuildingDimensions.cellar changed to ${event.cellar}');
    });
    on<FoundationsChanged>((event, emit) {
      emit(state.copyWith(foundations: event.foundations));
      logger.d(
          'TotalBuildingDimensions.foundations changed to ${event.foundations}');
    });
    on<BuildingFrameChanged>((event, emit) {
      emit(state.copyWith(buildingFrame: event.buildingFrame));
      logger.d(
          'TotalBuildingDimensions.buildingFrame changed to ${event.buildingFrame}');
    });

    // listen to other blocs
    buildingDimensionsBloc.stream.listen(
      (state) => add(
        BuildingDimensionsChanged(state),
      ),
    );
    cellarBloc.stream.listen(
      (state) => add(
        CellarChanged(state),
      ),
    );
    foundationsBloc.stream.listen(
      (state) => add(
        FoundationsChanged(state),
      ),
    );
    buildingFrameBloc.stream.listen(
      (state) => add(
        BuildingFrameChanged(state),
      ),
    );
  }
}
