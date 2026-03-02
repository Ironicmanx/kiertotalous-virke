import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/building_frame_bloc.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/total_building_frame_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalBuildingFrameBloc
    extends Bloc<TotalBuildingFrameEvent, TotalBuildingFrame> {
  final FoundationsBloc foundationsBloc;
  final BuildingFrameBloc buildingFrameBloc;

  TotalBuildingFrameBloc(
    this.foundationsBloc,
    this.buildingFrameBloc,
  ) : super(
          TotalBuildingFrame().copyWith(
            foundations: foundationsBloc.state,
            buildingFrame: buildingFrameBloc.state,
          ),
        ) {
    on<FoundationsChanged>(
      (event, emit) {
        logger.d(
            'TotalBuildingFrame.foundations changed to ${event.foundations}');
        emit(
          state.copyWith(
            foundations: event.foundations,
          ),
        );
      },
    );

    on<BuildingFrameChanged>(
      (event, emit) {
        logger.d(
            'TotalBuildingFrame.buildingFrame changed to: ${event.buildingFrame}');
        emit(
          state.copyWith(
            buildingFrame: event.buildingFrame,
          ),
        );
      },
    );

    // updates this bloc when FoundationsBloc is changed elsewhere
    foundationsBloc.stream.listen((foundationsState) {
      add(FoundationsChanged(foundationsState));
    });

    // updates this bloc when BuildingFrameBloc is changed elsewhere
    buildingFrameBloc.stream.listen((buildingFrameState) {
      add(BuildingFrameChanged(buildingFrameState));
    });
  }
}
