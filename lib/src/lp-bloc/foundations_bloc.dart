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
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(falsePlinth: fp.copyWith(material: event.material)));
    });
    on<CrawlSpaceMaterialChanged>((event, emit) {
      logger.d("CrawlSpaceMaterialChanged fired");
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(crawlSpace: cs.copyWith(material: event.material)));
    });
    on<PillarMaterialChanged>((event, emit) {
      logger.d("PillarMaterialChanged to ${event.material}");
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(pillar: p.copyWith(material: event.material)));
    });
    on<HollowCoreSlabMaterialChanged>((event, emit) {
      logger.d("HollowCoreSlabMaterialChanged fired");
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(material: event.material)));
    });

    // areas
    on<FalsePlinthAreaChanged>((event, emit) {
      logger.d("FalsePlinthAreaChanged fired");
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(falsePlinth: fp.copyWith(area: event.value)));
    });
    on<CrawlSpaceAreaChanged>((event, emit) {
      logger.d("CrawlSpaceAreaChanged fired");
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(crawlSpace: cs.copyWith(area: event.value)));
    });
    on<ShallowAreaChanged>((event, emit) {
      logger.d("ShallowAreaChanged fired");
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(shallow: s.copyWith(area: event.value)));
    });
    on<PillarAreaChanged>((event, emit) {
      logger.d("PillarAreaChanged fired");
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(pillar: p.copyWith(area: event.value)));
    });
    on<HollowCoreSlabAreaChanged>((event, emit) {
      logger.d("HollowCoreSlabAreaChanged fired");
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(hollowCoreSlab: h.copyWith(area: event.value)));
    });

    // circumferences
    on<FalsePlinthCircumferenceChanged>((event, emit) {
      logger.d("FalsePlinthCircumferenceChanged fired");
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(circumference: event.value)));
    });
    on<CrawlSpaceCircumferenceChanged>((event, emit) {
      logger.d("CrawlSpaceCircumferenceChanged fired");
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(circumference: event.value)));
    });
    on<ShallowCircumferenceChanged>((event, emit) {
      logger.d("ShallowCircumferenceChanged fired");
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(
          shallow: s.copyWith(circumference: event.value)));
    });
    on<PillarCircumferenceChanged>((event, emit) {
      logger.d("PillarCircumferenceChanged fired");
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(
          pillar: p.copyWith(circumference: event.value)));
    });
    on<HollowCoreSlabCircumferenceChanged>((event, emit) {
      logger.d("HollowCoreSlabCircumferenceChanged fired");
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(circumference: event.value)));
    });

    // FalsePlinth sizing
    on<FalsePlinthPileSpacingChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(pileSpacing: event.value)));
    });
    on<FalsePlinthBlockHeightChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(blockHeight: event.value)));
    });
    on<FalsePlinthFrostStyrofoamChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(frostStyrofoamThickness: event.value)));
    });
    on<FalsePlinthFinnFoamChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(finnFoamThickness: event.value)));
    });
    on<FalsePlinthSlabThicknessChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(slabThickness: event.value)));
    });
    on<FalsePlinthMineralWoolChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(mineralWoolThickness: event.value)));
    });
    on<FalsePlinthStyrofoamChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(styrofoamThickness: event.value)));
    });
    on<FalsePlinthConcreteCastingChanged>((event, emit) {
      final fp = state.falsePlinth ?? FalsePlinthFoundation();
      emit(state.copyWith(
          falsePlinth: fp.copyWith(concreteCastingThickness: event.value)));
    });

    // CrawlSpace sizing
    on<CrawlSpacePileSpacingChanged>((event, emit) {
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(pileSpacing: event.value)));
    });
    on<CrawlSpaceCastFoundationWidthChanged>((event, emit) {
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(castFoundationWidth: event.value)));
    });
    on<CrawlSpaceCastFoundationHeightChanged>((event, emit) {
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(castFoundationHeight: event.value)));
    });
    on<CrawlSpaceBlockHeightChanged>((event, emit) {
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(blockHeight: event.value)));
    });
    on<CrawlSpaceWoodShavingsChanged>((event, emit) {
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(woodShavingsThickness: event.value)));
    });
    on<CrawlSpaceWoodFrameWeightChanged>((event, emit) {
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(woodFrameWeight: event.value)));
    });
    on<CrawlSpaceSolidBoardingChanged>((event, emit) {
      final cs = state.crawlSpace ?? CrawlSpaceFoundation();
      emit(state.copyWith(
          crawlSpace: cs.copyWith(solidBoardingThickness: event.value)));
    });

    // Shallow sizing
    on<ShallowFrostStyrofoamChanged>((event, emit) {
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(
          shallow: s.copyWith(frostStyrofoamThickness: event.value)));
    });
    on<ShallowFinnFoamChanged>((event, emit) {
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(
          shallow: s.copyWith(finnFoamThickness: event.value)));
    });
    on<ShallowSlabThicknessChanged>((event, emit) {
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(
          shallow: s.copyWith(slabThickness: event.value)));
    });
    on<ShallowMineralWoolChanged>((event, emit) {
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(
          shallow: s.copyWith(mineralWoolThickness: event.value)));
    });
    on<ShallowStyrofoamChanged>((event, emit) {
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(
          shallow: s.copyWith(styrofoamThickness: event.value)));
    });
    on<ShallowConcreteCastingChanged>((event, emit) {
      final s = state.shallow ?? ShallowFoundation();
      emit(state.copyWith(
          shallow: s.copyWith(concreteCastingThickness: event.value)));
    });

    // Pillar sizing
    on<PillarPileSpacingChanged>((event, emit) {
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(
          pillar: p.copyWith(pileSpacing: event.value)));
    });
    on<PillarBlockHeightChanged>((event, emit) {
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(
          pillar: p.copyWith(blockHeight: event.value)));
    });
    on<PillarFrostStyrofoamChanged>((event, emit) {
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(
          pillar: p.copyWith(frostStyrofoamThickness: event.value)));
    });
    on<PillarFinnFoamChanged>((event, emit) {
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(
          pillar: p.copyWith(finnFoamThickness: event.value)));
    });
    on<PillarWoodFrameWeightChanged>((event, emit) {
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(
          pillar: p.copyWith(woodFrameWeight: event.value)));
    });
    on<PillarSolidBoardingChanged>((event, emit) {
      final p = state.pillar ?? PillarFoundation();
      emit(state.copyWith(
          pillar: p.copyWith(solidBoardingThickness: event.value)));
    });

    // HollowCoreSlab sizing
    on<HollowCoreSlabPileSpacingChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(pileSpacing: event.value)));
    });
    on<HollowCoreSlabBlockHeightChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(blockHeight: event.value)));
    });
    on<HollowCoreSlabFrostStyrofoamChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(frostStyrofoamThickness: event.value)));
    });
    on<HollowCoreSlabFinnFoamChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(finnFoamThickness: event.value)));
    });
    on<HollowCoreSlabHollowCoreSlabWeightChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(hollowCoreSlabWeight: event.value)));
    });
    on<HollowCoreSlabMineralWoolChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(mineralWoolThickness: event.value)));
    });
    on<HollowCoreSlabStyrofoamChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(styrofoamThickness: event.value)));
    });
    on<HollowCoreSlabConcreteCastingChanged>((event, emit) {
      final h = state.hollowCoreSlab ?? HollowCoreSlabFoundation();
      emit(state.copyWith(
          hollowCoreSlab: h.copyWith(concreteCastingThickness: event.value)));
    });
  }
}
