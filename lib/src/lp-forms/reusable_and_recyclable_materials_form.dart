import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/lp-bloc/reusable_and_recyclable_materials_event.dart';
import 'package:flutter_app/src/lp-bloc/total_reusable_and_recyclable_materials_bloc.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ReusableAndRecyclableMaterialsForm extends StatelessWidget {
  const ReusableAndRecyclableMaterialsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReusableAndRecyclableMaterialsBloc>();

    return BlocBuilder<TotalReusableAndRecyclableMaterialsBloc,
        TotalReusableAndRecyclableMaterials>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutGrid(
              columnSizes: [
                210.px,
                120.px,
                120.px,
                120.px,
                120.px,
              ],
              rowSizes: [
                75.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
                50.px,
              ],
              children: [
                Cell.header(
                  initialValue:
                      'Hyödyntämiskelpoiset ja kierrätettävät materiaalit',
                ),
                Cell.column(initialValue: 'Purkukustannus (€/kpl tai €/tonni)'),
                Cell.column(initialValue: 'Materiaalierän hinta (€)'),
                Cell.column(initialValue: 'Tilavuus (m3)'),
                Cell.column(initialValue: 'Määräarvio (tonnia)'),
                Cell.row(initialValue: 'Maa-ainekset (puhdas maa)'),
                Cell.input(
                  initialValue: state.cleanSoil.demolitionCost,
                  setter: (value) => bloc.add(
                    CleanSoilDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.cleanSoil.batchPrice),
                Cell.output(getter: () => state.cleanSoil.volume),
                Cell.output(getter: () => state.cleanSoil.tons),
                Cell.row(initialValue: 'Asfalttijäte'),
                Cell.input(
                  initialValue: state.asphaltWaste.demolitionCost,
                  setter: (value) => bloc.add(
                    AsphaltWasteDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.asphaltWaste.batchPrice),
                Cell.output(getter: () => state.asphaltWaste.volume),
                Cell.output(getter: () => state.asphaltWaste.tons),
                Cell.row(initialValue: 'Puhdas betoni'),
                Cell.input(
                  initialValue: state.cleanConcrete.demolitionCost,
                  setter: (value) => bloc.add(
                    CleanConcreteDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.cleanConcrete.batchPrice),
                Cell.output(getter: () => state.cleanConcrete.volume),
                Cell.output(getter: () => state.cleanConcrete.tons),
                Cell.row(
                    initialValue:
                        'Betoniteräkset, peltikatto ja muu teräs-/rautaromu'),
                Cell.input(
                  initialValue: state.rebarAndSteelScrap.demolitionCost,
                  setter: (value) => bloc.add(
                    RebarAndSteelScrapDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.rebarAndSteelScrap.batchPrice),
                Cell.output(getter: () => state.rebarAndSteelScrap.volume),
                Cell.output(getter: () => state.rebarAndSteelScrap.tons),
                Cell.row(initialValue: 'Betoniharkot'),
                Cell.input(
                  initialValue: state.concreteBlocks.demolitionCost,
                  setter: (value) => bloc.add(
                    ConcreteBlocksDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.concreteBlocks.batchPrice),
                Cell.output(getter: () => state.concreteBlocks.volume),
                Cell.output(getter: () => state.concreteBlocks.tons),
                Cell.row(initialValue: 'Seinä- ja kattotiilet'),
                Cell.input(
                  initialValue: state.wallAndRoofTiles.demolitionCost,
                  setter: (value) => bloc.add(
                    WallAndRoofTilesDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.wallAndRoofTiles.batchPrice),
                Cell.output(getter: () => state.wallAndRoofTiles.volume),
                Cell.output(getter: () => state.wallAndRoofTiles.tons),
                Cell.row(
                    initialValue:
                        'Kaakelilaatat ja keramiikka (ei sisällä asbestia)'),
                Cell.input(
                  initialValue: state.ceramicTiles.demolitionCost,
                  setter: (value) => bloc.add(
                    CeramicTilesDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.ceramicTiles.batchPrice),
                Cell.output(getter: () => state.ceramicTiles.volume),
                Cell.output(getter: () => state.ceramicTiles.tons),
                Cell.row(initialValue: 'Puhdas ja käyttökelpoinen puu'),
                Cell.input(
                  initialValue: state.cleanUsableWood.demolitionCost,
                  setter: (value) => bloc.add(
                    CleanUsableWoodDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.cleanUsableWood.batchPrice),
                Cell.output(getter: () => state.cleanUsableWood.volume),
                Cell.output(getter: () => state.cleanUsableWood.tons),
                Cell.row(initialValue: 'Sähkö- ja elektroniikkaromu'),
                Cell.input(
                  initialValue: state.eWaste.demolitionCost,
                  setter: (value) => bloc.add(
                    EWasteDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.eWaste.batchPrice),
                Cell.output(getter: () => state.eWaste.volume),
                Cell.output(getter: () => state.eWaste.tons),
                Cell.row(initialValue: 'Ruostumaton teräs'),
                Cell.input(
                  initialValue: state.stainlessSteel.demolitionCost,
                  setter: (value) => bloc.add(
                    StainlessSteelDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.stainlessSteel.batchPrice),
                Cell.output(getter: () => state.stainlessSteel.volume),
                Cell.output(getter: () => state.stainlessSteel.tons),
                Cell.row(initialValue: 'Kupari'),
                Cell.input(
                  initialValue: state.copper.demolitionCost,
                  setter: (value) => bloc.add(
                    CopperDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.copper.batchPrice),
                Cell.output(getter: () => state.copper.volume),
                Cell.output(getter: () => state.copper.tons),
                Cell.row(initialValue: 'Alumiini'),
                Cell.input(
                  initialValue: state.aluminium.demolitionCost,
                  setter: (value) => bloc.add(
                    AluminiumDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.aluminium.batchPrice),
                Cell.output(getter: () => state.aluminium.volume),
                Cell.output(getter: () => state.aluminium.tons),
                Cell.row(initialValue: 'Lasi- ja mineraalieristevilla'),
                Cell.input(
                  initialValue: state.glassAndMineralWool.demolitionCost,
                  setter: (value) => bloc.add(
                    GlassAndMineralWoolDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.glassAndMineralWool.batchPrice),
                Cell.output(getter: () => state.glassAndMineralWool.volume),
                Cell.output(getter: () => state.glassAndMineralWool.tons),
                Cell.row(
                    initialValue:
                        'Mineriittikate ja palosuojalevyt (ei sisällä asbestia)'),
                Cell.input(
                  initialValue: state.fiberCementBoards.demolitionCost,
                  setter: (value) => bloc.add(
                    FiberCementBoardsDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.fiberCementBoards.batchPrice),
                Cell.output(getter: () => state.fiberCementBoards.volume),
                Cell.output(getter: () => state.fiberCementBoards.tons),
                Cell.row(initialValue: 'Kipsilevyt (cyproc)'),
                Cell.input(
                  initialValue: state.gypsumBoards.demolitionCost,
                  setter: (value) => bloc.add(
                    GypsumBoardsDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.gypsumBoards.batchPrice),
                Cell.output(getter: () => state.gypsumBoards.volume),
                Cell.output(getter: () => state.gypsumBoards.tons),
                Cell.row(initialValue: 'Lasi'),
                Cell.input(
                  initialValue: state.glass.demolitionCost,
                  setter: (value) => bloc.add(
                    GlassDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.glass.batchPrice),
                Cell.output(getter: () => state.glass.volume),
                Cell.output(getter: () => state.glass.tons),
                Cell.row(
                    initialValue:
                        'Energiajäte, maalattu puu, kattohuopa ja aluskate'),
                Cell.input(
                  initialValue: state.energyWaste.demolitionCost,
                  setter: (value) => bloc.add(
                    EnergyWasteDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.energyWaste.batchPrice),
                Cell.output(getter: () => state.energyWaste.volume),
                Cell.output(getter: () => state.energyWaste.tons),
                Cell.row(initialValue: 'Polttokelpoinen puujäte'),
                Cell.input(
                  initialValue: state.combustibleWoodWaste.demolitionCost,
                  setter: (value) => bloc.add(
                    CombustibleWoodWasteDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(
                    getter: () => state.combustibleWoodWaste.batchPrice),
                Cell.output(getter: () => state.combustibleWoodWaste.volume),
                Cell.output(getter: () => state.combustibleWoodWaste.tons),
                Cell.row(
                    initialValue: 'Tuulensuojalevyt (bituliitti tai vastaava)'),
                Cell.input(
                  initialValue: state.windProtectionBoard.demolitionCost,
                  setter: (value) => bloc.add(
                    WindProtectionBoardDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.windProtectionBoard.batchPrice),
                Cell.output(getter: () => state.windProtectionBoard.volume),
                Cell.output(getter: () => state.windProtectionBoard.tons),
                Cell.row(initialValue: 'Lastulevy'),
                Cell.input(
                  initialValue: state.chipboard.demolitionCost,
                  setter: (value) => bloc.add(
                    ChipboardDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.chipboard.batchPrice),
                Cell.output(getter: () => state.chipboard.volume),
                Cell.output(getter: () => state.chipboard.tons),
                Cell.row(
                    initialValue: 'Muovijäte (styrox, kosteuseriste yms.)'),
                Cell.input(
                  initialValue: state.plasticWaste.demolitionCost,
                  setter: (value) => bloc.add(
                    PlasticWasteDemolitionCostChanged(value),
                  ),
                ),
                Cell.output(getter: () => state.plasticWaste.batchPrice),
                Cell.output(getter: () => state.plasticWaste.volume),
                Cell.output(getter: () => state.plasticWaste.tons),
                Cell.row(initialValue: 'Yhteensä'),
                Cell.grey(),
                Cell.output(getter: () => state.totalBatchPrice),
                Cell.output(getter: () => state.totalVolume),
                Cell.output(getter: () => state.totalTons),
              ],
            ),
          ],
        );
      },
    );
  }
}
