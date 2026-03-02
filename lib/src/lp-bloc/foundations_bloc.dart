import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/foundations_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoundationsBloc extends Bloc<FoundationsEvent, Foundations> {
  FoundationsBloc() : super(Foundations()) {
    on<BituminousWaterProofingChanged>((event, emit) {
      logger.d("BituminousWaterProofingChanged fired");
      emit(state.copyWith(bituminousWaterProofing: event.value));
    });

    // materials
    on<FalsePlinthMaterialChanged>((event, emit) {
      logger.d("FalsePlinthMaterialChanged fired");
      emit(
        state.copyWith(
          falsePlinth: FalsePlinthFoundation(
            material: event.material,
            area: state.falsePlinth?.area,
            circumference: state.falsePlinth?.circumference,
          ),
        ),
      );
    });
    on<CrawlSpaceMaterialChanged>((event, emit) {
      logger.d("CrawlSpaceMaterialChanged fired");
      emit(
        state.copyWith(
          crawlSpace: CrawlSpaceFoundation(
            material: event.material,
            area: state.crawlSpace?.area,
            circumference: state.crawlSpace?.circumference,
          ),
        ),
      );
    });
    on<PillarMaterialChanged>((event, emit) {
      logger.d("PillarMaterialChanged to ${event.material}");
      emit(
        state.copyWith(
          pillar: PillarFoundation(
            material: event.material,
            area: state.pillar?.area,
            circumference: state.pillar?.circumference,
          ),
        ),
      );
    });
    on<HollowCoreSlabMaterialChanged>((event, emit) {
      logger.d("HollowCoreSlabMaterialChanged fired");
      emit(
        state.copyWith(
          hollowCoreSlab: HollowCoreSlabFoundation(
            material: event.material,
            area: state.hollowCoreSlab?.area,
            circumference: state.hollowCoreSlab?.circumference,
          ),
        ),
      );
    });

    // areas
    on<FalsePlinthAreaChanged>((event, emit) {
      logger.d("FalsePlinthAreaChanged fired");
      // TODO: change copies to deep copies once nested classes are @freezed
      emit(
        state.copyWith(
          falsePlinth: FalsePlinthFoundation(
            area: event.value,
            circumference: state.falsePlinth?.circumference,
            material: state.falsePlinth?.material,
          ),
        ),
      );
    });
    on<CrawlSpaceAreaChanged>((event, emit) {
      logger.d("CrawlSpaceAreaChanged fired");
      emit(
        state.copyWith(
          crawlSpace: CrawlSpaceFoundation(
            area: event.value,
            circumference: state.crawlSpace?.circumference,
            material: state.crawlSpace?.material,
          ),
        ),
      );
    });
    on<ShallowAreaChanged>((event, emit) {
      logger.d("ShallowAreaChanged fired");
      emit(
        state.copyWith(
          shallow: ShallowFoundation(
            area: event.value,
            circumference: state.shallow?.circumference,
          ),
        ),
      );
    });
    on<PillarAreaChanged>((event, emit) {
      logger.d("PillarAreaChanged fired");
      emit(
        state.copyWith(
          pillar: PillarFoundation(
            area: event.value,
            circumference: state.pillar?.circumference,
            material: state.pillar?.material,
          ),
        ),
      );
    });
    on<HollowCoreSlabAreaChanged>((event, emit) {
      logger.d("HollowCoreSlabAreaChanged fired");
      emit(
        state.copyWith(
          hollowCoreSlab: HollowCoreSlabFoundation(
            area: event.value,
            circumference: state.hollowCoreSlab?.circumference,
            material: state.hollowCoreSlab?.material,
          ),
        ),
      );
    });

    // circumferences
    on<FalsePlinthCircumferenceChanged>((event, emit) {
      logger.d("FalsePlinthCircumferenceChanged fired");
      emit(
        state.copyWith(
          falsePlinth: FalsePlinthFoundation(
            circumference: event.value,
            area: state.falsePlinth?.area,
            material: state.falsePlinth?.material,
          ),
        ),
      );
    });
    on<CrawlSpaceCircumferenceChanged>((event, emit) {
      logger.d("CrawlSpaceCircumferenceChanged fired");
      emit(
        state.copyWith(
          crawlSpace: CrawlSpaceFoundation(
            circumference: event.value,
            area: state.crawlSpace?.area,
            material: state.crawlSpace?.material,
          ),
        ),
      );
    });
    on<ShallowCircumferenceChanged>((event, emit) {
      logger.d("ShallowCircumferenceChanged fired");
      emit(
        state.copyWith(
          shallow: ShallowFoundation(
            circumference: event.value,
            area: state.shallow?.area,
          ),
        ),
      );
    });
    on<PillarCircumferenceChanged>((event, emit) {
      logger.d("PillarCircumferenceChanged fired");
      emit(
        state.copyWith(
          pillar: PillarFoundation(
            circumference: event.value,
            area: state.pillar?.area,
            material: state.pillar?.material,
          ),
        ),
      );
    });
    on<HollowCoreSlabCircumferenceChanged>((event, emit) {
      logger.d("HollowCoreSlabCircumferenceChanged fired");
      emit(
        state.copyWith(
          hollowCoreSlab: HollowCoreSlabFoundation(
            circumference: event.value,
            area: state.hollowCoreSlab?.area,
            material: state.hollowCoreSlab?.material,
          ),
        ),
      );
    });
  }
}
