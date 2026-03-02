import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_total_demolition_waste_and_costs_bloc.dart';
import 'package:flutter_app/src/lp-bloc/bituminous_mixtures_coal_tar_products_bloc.dart';
import 'total_bituminous_mixtures_coal_tar_products_event.dart';

class TotalBituminousMixturesCoalTarProductsBloc extends Bloc<
    TotalBituminousMixturesCoalTarProductsEvent,
    TotalBituminousMixturesCoalTarProducts> {
  final BituminousMixturesCoalTarProductsBloc
      bituminousMixturesCoalTarProductsBloc;
  final TotalDemolitionWasteAndCostsBloc totalDemolitionWasteAndCostsBloc;

  TotalBituminousMixturesCoalTarProductsBloc({
    required this.bituminousMixturesCoalTarProductsBloc,
    required this.totalDemolitionWasteAndCostsBloc,
  }) : super(TotalBituminousMixturesCoalTarProducts()) {
    on<BituminousMixturesCoalTarProductsChanged>((event, emit) {
      emit(state.copyWith(
        bituminousMixturesCoalTarProducts:
            event.bituminousMixturesCoalTarProducts,
      ));
    });
    on<TotalDemolitionWasteAndCostsChanged>((event, emit) {
      emit(state.copyWith(
        totalDemolitionWasteAndCosts: event.totalDemolitionWasteAndCosts,
      ));
    });

    // Listen to changes in the bituminousMixturesCoalTarProductsBloc
    bituminousMixturesCoalTarProductsBloc.stream.listen((state) {
      add(BituminousMixturesCoalTarProductsChanged(state));
    });

    // Listen to changes in the totalDemolitionWasteAndCostsBloc
    totalDemolitionWasteAndCostsBloc.stream.listen((state) {
      add(TotalDemolitionWasteAndCostsChanged(state));
    });
  }
}
