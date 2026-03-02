import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/foundations_bloc.dart';
import 'package:flutter_app/src/lp-bloc/foundations_event.dart';
import 'package:flutter_app/src/shared/cell.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/empty_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/grey_cell.dart';
import 'package:flutter_app/src/shared/info_button.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/menu_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/shared/tooltip_texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

/// Perustyyppi ja lattiat
class FoundationTypeAndFloorsForm extends StatelessWidget {
  const FoundationTypeAndFloorsForm({super.key});

  /// Converts FoundationMaterial enum values to display names
  /// and returns them as a list of DropdownMenuItems.
  List<DropdownMenuItem<FoundationMaterial?>> toList() {
    return [
      DropdownMenuItem<FoundationMaterial?>(
        value: null,
        child: Text('Valitse'),
      ),
      ...FoundationMaterial.values.map((type) {
        return DropdownMenuItem<FoundationMaterial?>(
          value: type,
          child: Text(typeToString(type)),
        );
      }),
    ];
  }

  /// Converts FoundationMaterial enum to a user-friendly display name.
  String typeToString(FoundationMaterial type) {
    switch (type) {
      case FoundationMaterial.concreteCasting:
        return "Betonivalu";
      case FoundationMaterial.concreteBlock:
        return "Harkko";
    }
  }

  @override
  Widget build(BuildContext context) {
    final foundationsBloc = context.read<FoundationsBloc>();

    return BlocBuilder<FoundationsBloc, Foundations>(
      builder: (context, state) {
        return LayoutGrid(
          columnSizes: [400.px, 160.px, 160.px, 160.px, 160.px, 160.px, 160.px],
          rowSizes: [
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
              initialValue: 'Perustustyyppi ja lattiat',
              iconButton: InfoButton(
                text: TooltipTexts
                    .outerSheath.foundationAndFloors.foundationAndFloors,
              ),
            ),
            ColumnCell(initialValue: 'Valesokkeli'),
            ColumnCell(initialValue: 'Rossipohja'),
            ColumnCell(initialValue: 'Matalaperustus'),
            ColumnCell(initialValue: 'Pilariperustus'),
            ColumnCell(initialValue: 'Ontelolaattaperustus'),
            ColumnCell(initialValue: 'Koko rakennus yht.'),
            ColumnCell(initialValue: 'Monivalinta'),
            MenuCell<FoundationMaterial>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(FalsePlinthMaterialChanged(value)),
              initialValue: state.falsePlinth?.material,
              items: toList(),
            ),
            MenuCell<FoundationMaterial>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(CrawlSpaceMaterialChanged(value)),
              initialValue: state.crawlSpace?.material,
              items: toList(),
            ),
            ColumnCell(
              initialValue: '',
            ),
            MenuCell<FoundationMaterial?>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(PillarMaterialChanged(value)),
              initialValue: state.pillar?.material,
              items: toList(),
            ),
            MenuCell<FoundationMaterial?>(
              setter: (FoundationMaterial? value) =>
                  foundationsBloc.add(HollowCoreSlabMaterialChanged(value)),
              initialValue: state.hollowCoreSlab?.material,
              items: toList(),
            ),
            ColumnCell(
              initialValue: '',
            ),
            RowCell(initialValue: 'Perustuksen pinta-ala (m2)'),
            InputCell(
              initialValue: state.falsePlinth?.area,
              setter: (value) =>
                  foundationsBloc.add(FalsePlinthAreaChanged(value)),
            ),
            InputCell(
              initialValue: state.crawlSpace?.area,
              setter: (value) =>
                  foundationsBloc.add(CrawlSpaceAreaChanged(value)),
            ),
            InputCell(
              initialValue: state.shallow?.area,
              setter: (value) => foundationsBloc.add(ShallowAreaChanged(value)),
            ),
            InputCell(
              initialValue: state.pillar?.area,
              setter: (value) => foundationsBloc.add(PillarAreaChanged(value)),
            ),
            InputCell(
              initialValue: state.hollowCoreSlab?.area,
              setter: (value) =>
                  foundationsBloc.add(HollowCoreSlabAreaChanged(value)),
            ),
            OutputCell(getter: () => state.area),
            RowCell(initialValue: 'Perustuksen kehämitta (jm)'),
            InputCell(
              initialValue: state.falsePlinth?.circumference,
              setter: (value) => foundationsBloc.add(
                FalsePlinthCircumferenceChanged(value),
              ),
            ),
            InputCell(
              initialValue: state.crawlSpace?.circumference,
              setter: (value) => foundationsBloc.add(
                CrawlSpaceCircumferenceChanged(value),
              ),
            ),
            InputCell(
              initialValue: state.shallow?.circumference,
              setter: (value) =>
                  foundationsBloc.add(ShallowCircumferenceChanged(value)),
            ),
            InputCell(
              initialValue: state.pillar?.circumference,
              setter: (value) =>
                  foundationsBloc.add(PillarCircumferenceChanged(value)),
            ),
            InputCell(
              initialValue: state.hollowCoreSlab?.circumference,
              setter: (value) => foundationsBloc.add(
                HollowCoreSlabCircumferenceChanged(value),
              ),
            ),
            OutputCell(getter: () => state.circumference),
            FormHeader(text: "Perustusten purkumateriaalimäärät"),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            EmptyCell(),
            // TODO: needs check button!
            RowCell(
              initialValue: "Betonia (m3)",
              checkbox: true,
              checkboxValue: state.bituminousWaterProofing,
              checkboxTitle: "Vedeneristys bitumisively",
              checkboxSetter: (value) => foundationsBloc.add(
                BituminousWaterProofingChanged(value),
              ),
            ),
            OutputCell(getter: () => state.falsePlinth?.concreteVolume),
            OutputCell(getter: () => state.crawlSpace?.concreteVolume),
            OutputCell(getter: () => state.shallow?.concreteVolume),
            OutputCell(getter: () => state.pillar?.concreteVolume),
            OutputCell(getter: () => state.hollowCoreSlab?.concreteVolume),
            OutputCell(getter: () => state.concreteVolume),
            RowCell(initialValue: "Betonia (tonnia)"),
            OutputCell(getter: () => state.falsePlinth?.concreteTons),
            OutputCell(getter: () => state.crawlSpace?.concreteTons),
            OutputCell(getter: () => state.shallow?.concreteTons),
            OutputCell(getter: () => state.pillar?.concreteTons),
            OutputCell(getter: () => state.hollowCoreSlab?.concreteTons),
            OutputCell(getter: () => state.concreteTons),
            RowCell(initialValue: "Betoniterästä (tonnia)"),
            OutputCell(getter: () => state.falsePlinth?.rebarTons),
            OutputCell(getter: () => state.crawlSpace?.rebarTons),
            OutputCell(getter: () => state.shallow?.rebarTons),
            OutputCell(getter: () => state.pillar?.rebarTons),
            OutputCell(getter: () => state.hollowCoreSlab?.rebarTons),
            OutputCell(getter: () => state.rebarTons),
            RowCell(initialValue: "Betoniharkot (m3)"),
            OutputCell(getter: () => state.falsePlinth?.concreteBlockVolume),
            OutputCell(getter: () => state.crawlSpace?.concreteBlockVolume),
            OutputCell(getter: () => state.shallow?.concreteBlockVolume),
            OutputCell(getter: () => state.pillar?.concreteBlockVolume),
            OutputCell(getter: () => state.hollowCoreSlab?.concreteBlockVolume),
            OutputCell(getter: () => state.concreteBlockVolume),
            RowCell(initialValue: "Betoniharkot (tonnia)"),
            OutputCell(getter: () => state.falsePlinth?.concreteBlockTons),
            OutputCell(getter: () => state.crawlSpace?.concreteBlockTons),
            OutputCell(getter: () => state.shallow?.concreteBlockTons),
            OutputCell(getter: () => state.pillar?.concreteBlockTons),
            OutputCell(getter: () => state.hollowCoreSlab?.concreteBlockTons),
            OutputCell(getter: () => state.concreteBlockTons),
            RowCell(initialValue: "Lasi- ja mineraalieristevilla (m3)"),
            OutputCell(getter: () => state.falsePlinth?.mineralWoolVolume),
            OutputCell(getter: () => state.crawlSpace?.mineralWoolVolume),
            OutputCell(getter: () => state.shallow?.mineralWoolVolume),
            OutputCell(getter: () => state.pillar?.mineralWoolVolume),
            OutputCell(getter: () => state.hollowCoreSlab?.mineralWoolVolume),
            OutputCell(getter: () => state.mineralWoolVolume),
            RowCell(initialValue: "Lasi- ja mineraalieristevilla (tonnia)"),
            OutputCell(getter: () => state.falsePlinth?.mineralWoolTons),
            OutputCell(getter: () => state.crawlSpace?.mineralWoolTons),
            OutputCell(getter: () => state.shallow?.mineralWoolTons),
            OutputCell(getter: () => state.pillar?.mineralWoolTons),
            OutputCell(getter: () => state.hollowCoreSlab?.mineralWoolTons),
            OutputCell(getter: () => state.mineralWoolTons),
            RowCell(initialValue: "Muovijäte, styrox, kosteuseriste yms. (m3)"),
            OutputCell(getter: () => state.falsePlinth?.plasticWasteVolume),
            OutputCell(getter: () => state.crawlSpace?.plasticWasteVolume),
            OutputCell(getter: () => state.shallow?.plasticWasteVolume),
            OutputCell(getter: () => state.pillar?.plasticWasteVolume),
            OutputCell(getter: () => state.hollowCoreSlab?.plasticWasteVolume),
            OutputCell(getter: () => state.plasticWasteVolume),
            RowCell(
              initialValue: "Muovijäte, styrox, kosteuseriste yms. (tonnia)",
            ),
            OutputCell(getter: () => state.falsePlinth?.plasticWasteTons),
            OutputCell(getter: () => state.crawlSpace?.plasticWasteTons),
            OutputCell(getter: () => state.shallow?.plasticWasteTons),
            OutputCell(getter: () => state.pillar?.plasticWasteTons),
            OutputCell(getter: () => state.hollowCoreSlab?.plasticWasteTons),
            OutputCell(getter: () => state.plasticWasteTons),
            RowCell(
              initialValue: "Kutterinpuru yms. polttokelpoinen puujäte (m3)",
            ),
            OutputCell(getter: () => state.falsePlinth?.woodShavingsVolume),
            OutputCell(getter: () => state.crawlSpace?.woodShavingsVolume),
            OutputCell(getter: () => state.shallow?.woodShavingsVolume),
            OutputCell(getter: () => state.pillar?.woodShavingsVolume),
            OutputCell(getter: () => state.hollowCoreSlab?.woodShavingsVolume),
            OutputCell(getter: () => state.woodShavingsVolume),
            RowCell(
              initialValue:
                  "Kutterinpuru yms. polttokelpoinen puujäte (tonnia)",
            ),
            OutputCell(getter: () => state.falsePlinth?.woodShavingsTons),
            OutputCell(getter: () => state.crawlSpace?.woodShavingsTons),
            OutputCell(getter: () => state.shallow?.woodShavingsTons),
            OutputCell(getter: () => state.pillar?.woodShavingsTons),
            OutputCell(getter: () => state.hollowCoreSlab?.woodShavingsTons),
            OutputCell(getter: () => state.woodShavingsTons),
            RowCell(initialValue: "Runkopuu ja umpilaudoitus (m3)"),
            OutputCell(
              getter: () => state.falsePlinth?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () => state.crawlSpace?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () => state.shallow?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () => state.pillar?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(
              getter: () =>
                  state.hollowCoreSlab?.solidBoardingAndWoodFrameVolume,
            ),
            OutputCell(getter: () => state.solidBoardingAndWoodFrameVolume),
            RowCell(initialValue: "Runkopuu ja umpilaudoitus (tonnia)"),
            OutputCell(
              getter: () => state.falsePlinth?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () => state.crawlSpace?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () => state.shallow?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () => state.pillar?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(
              getter: () => state.hollowCoreSlab?.solidBoardingAndWoodFrameTons,
            ),
            OutputCell(getter: () => state.solidBoardingAndWoodFrameTons),
            RowCell(
              initialValue:
                  "Polttokelpoinen jäte, tervapaperi, rakennuspahvi yms. (m3)",
            ),
            OutputCell(getter: () => state.falsePlinth?.combustibleWasteVolume),
            OutputCell(getter: () => state.crawlSpace?.combustibleWasteVolume),
            OutputCell(getter: () => state.shallow?.combustibleWasteVolume),
            OutputCell(getter: () => state.pillar?.combustibleWasteVolume),
            OutputCell(
              getter: () => state.hollowCoreSlab?.combustibleWasteVolume,
            ),
            OutputCell(getter: () => state.combustibleWasteVolume),
            RowCell(
              initialValue:
                  "Polttokelpoinen jäte, tervapaperi, rakennuspahvi yms. (tonnia)",
            ),
            OutputCell(getter: () => state.falsePlinth?.combustibleWasteTons),
            OutputCell(getter: () => state.crawlSpace?.combustibleWasteTons),
            OutputCell(getter: () => state.shallow?.combustibleWasteTons),
            OutputCell(getter: () => state.pillar?.combustibleWasteTons),
            OutputCell(
              getter: () => state.hollowCoreSlab?.combustibleWasteTons,
            ),
            OutputCell(getter: () => state.combustibleWasteTons),
            RowCell(initialValue: "Kuumabitumisively (m3)"),
            OutputCell(
              getter: () => state.falsePlinth?.hotBitumenCoatingVolume,
            ),
            OutputCell(getter: () => state.crawlSpace?.hotBitumenCoatingVolume),
            OutputCell(getter: () => state.shallow?.hotBitumenCoatingVolume),
            OutputCell(getter: () => state.pillar?.hotBitumenCoatingVolume),
            OutputCell(
              getter: () => state.hollowCoreSlab?.hotBitumenCoatingVolume,
            ),
            OutputCell(getter: () => state.hotBitumenCoatingVolume),
            RowCell(initialValue: "Kuumabitumisively (tonnia)"),
            OutputCell(getter: () => state.falsePlinth?.hotBitumenCoatingTons),
            OutputCell(getter: () => state.crawlSpace?.hotBitumenCoatingTons),
            OutputCell(getter: () => state.shallow?.hotBitumenCoatingTons),
            OutputCell(getter: () => state.pillar?.hotBitumenCoatingTons),
            OutputCell(
              getter: () => state.hollowCoreSlab?.hotBitumenCoatingTons,
            ),
            OutputCell(getter: () => state.hotBitumenCoatingTons),
          ],
        );
      },
    );
  }
}
