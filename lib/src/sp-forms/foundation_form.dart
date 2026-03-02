import 'package:flutter/material.dart';
import 'package:flutter_app/src/shared/column_cell.dart';
import 'package:flutter_app/src/shared/form_header.dart';
import 'package:flutter_app/src/shared/input_cell.dart';
import 'package:flutter_app/src/shared/output_cell.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_app/src/sp-bloc/foundation_bloc.dart';
import 'package:flutter_app/src/sp-bloc/foundation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';

class SmallPropertiesFoundationForm extends StatelessWidget {
  const SmallPropertiesFoundationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SmallPropertiesFoundationBloc>();

    return BlocBuilder<SmallPropertiesFoundationBloc,
        SmallPropertiesFoundation>(builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FormHeader(text: "Perustus"),
        LayoutGrid(columnSizes: [
          200.px,
          160.px,
          160.px,
          160.px,
          160.px,
          160.px,
          120.px,
          120.px,
          120.px,
        ], rowSizes: [
          50.px,
          50.px,
          50.px,
        ], children: [
          RowCell(
              checkbox: true,
              checkboxSetter: (value) =>
                  bloc.add(ContainsAsbestosChanged(value)),
              checkboxTitle: "Sisältää asbestia",
              checkboxValue: state.containsAsbestos),
          ColumnCell(initialValue: "Sokkelin pituus (jm)"),
          ColumnCell(initialValue: "Sokkelin paksuus (otsapinnan leveys) (m)"),
          ColumnCell(initialValue: "Betonilaatan pinta-ala (m2)"),
          ColumnCell(initialValue: "Sokkelin korkeus (m)"),
          ColumnCell(initialValue: "Betonilaatan paksuus (m)"),
          ColumnCell(initialValue: "Betoni (m3)"),
          ColumnCell(initialValue: "Betoni (tonnia)"),
          ColumnCell(initialValue: "Betoniteräs (tonnia)"),
          RowCell(
              checkbox: true,
              checkboxSetter: (value) =>
                  bloc.add(ContainsPcbPaintsChanged(value)),
              checkboxTitle: "Sisältää PBC maaleja",
              checkboxValue: state.containsPcbPaints),
          InputCell(
              initialValue: state.plinthLengthInLinearMeters,
              setter: (value) => bloc.add(PlinthLengthChanged(value))),
          InputCell(
              initialValue: state.plinthThicknessInMeters,
              setter: (value) => bloc.add(PlinthThicknessChanged(value))),
          InputCell(
              initialValue: state.concreteSlabAreaInSquareMeters,
              setter: (value) => bloc.add(ConcreteSlabAreaChanged(value))),
          InputCell(
              initialValue: state.plinthHeightInMeters,
              setter: (value) => bloc.add(PlinthHeightChanged(value))),
          InputCell(
              initialValue: state.concreteSlabThicknessInMeters,
              setter: (value) => bloc.add(ConcreteSlabThicknessChanged(value))),
          OutputCell(getter: () => state.concreteVolume),
          OutputCell(getter: () => state.concreteTons),
          OutputCell(getter: () => state.reinforcedConcreteTons),
        ])
      ]);
    });
  }
}
