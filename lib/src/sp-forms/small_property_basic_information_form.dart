import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/shared/row_cell.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/sp-bloc/small_property_basic_info_bloc.dart';
import 'package:flutter_app/src/sp-bloc/small_property_basic_info_event.dart';
import 'package:flutter_app/src/shared/input_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertyBasicInformationForm extends StatelessWidget {
  const SmallPropertyBasicInformationForm({super.key});

  Widget _buildTextField(
      {required String label,
      double? width,
      required void Function(String) setter,
      String? initialValue}) {
    return Container(
        margin: EdgeInsets.all(5),
        child: SizedBox(
            width: width,
            child: InputText(
                label: label,
                initialValue: initialValue,
                width: width,
                setter: setter)));
  }

  /// Build a form for basic information about the building being calculated.
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SmallPropertyBasicInfoBloc>();
    return BlocBuilder<SmallPropertyBasicInfoBloc, SmallPropertyEvaluationInfo>(
      builder: (context, state) => SizedBox(
        width: 900,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.only(top: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kohteen tiedot",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Aligns to top
                  children: [
                    // Left column with fixed width
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns text fields to left
                        children: [
                          _buildTextField(
                              label: "Kohteen nimi",
                              initialValue: state.propertyName,
                              width: 400,
                              setter: (value) =>
                                  bloc.add(SmallPropertyNameChanged(value))),
                          _buildTextField(
                              label: "Rakennustyyppi",
                              initialValue: state.buildingType,
                              width: 400,
                              setter: (value) => bloc.add(
                                  SmallPropertyBuildingTypeChanged(value))),
                          _buildTextField(
                              label: "Osoite",
                              initialValue: state.address,
                              width: 400,
                              setter: (value) =>
                                  bloc.add(SmallPropertyAddressChanged(value))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LayoutGrid(columnSizes: [
                  350.px,
                ], rowSizes: [
                  50.px,
                ], children: [
                  RowCell(
                    checkbox: true,
                    checkboxSetter: (value) =>
                        bloc.add(IsHazardousSubstanceSurveyDoneChanged(value)),
                    checkboxTitle:
                        "Onko vaarallisten aineiden kartoitus tehty?",
                    checkboxValue: state.isHazardousSubstanceSurveyDone,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
