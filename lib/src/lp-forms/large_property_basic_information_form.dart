import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-bloc/large_property_basic_info_bloc.dart';
import 'package:flutter_app/src/lp-bloc/large_property_basic_info_event.dart';
import 'package:flutter_app/src/shared/input_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LargePropertyBasicInformationForm extends StatelessWidget {
  const LargePropertyBasicInformationForm({super.key});

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
    final bloc = context.read<LargePropertyBasicInfoBloc>();
    return BlocBuilder<LargePropertyBasicInfoBloc, LargePropertyEvaluationInfo>(
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
                                  bloc.add(LargePropertyNameChanged(value))),
                          _buildTextField(
                              label: "Rakennustyyppi",
                              initialValue: state.buildingType,
                              width: 400,
                              setter: (value) => bloc.add(
                                  LargePropertyBuildingTypeChanged(value))),
                          _buildTextField(
                              label: "Osoite",
                              initialValue: state.address,
                              width: 400,
                              setter: (value) =>
                                  bloc.add(LargePropertyAddressChanged(value))),
                          _buildTextField(
                              label: "Kunta",
                              initialValue: state.municipality,
                              width: 400,
                              setter: (value) => bloc.add(
                                  LargePropertyMunicipalityChanged(value))),
                        ],
                      ),
                    ),
                    SizedBox(width: 16), // Spacing between columns
                    // Right column expands to fill remaining space
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns text fields to left
                        children: [
                          _buildTextField(
                              label: "Laskelman laatija",
                              initialValue: state.author,
                              width: 400,
                              setter: (value) => bloc
                                  .add(LargePropertyCalcAuthorChanged(value))),
                          _buildTextField(
                              label: "Päivämäärä",
                              initialValue: state.date,
                              width: 400,
                              setter: (value) =>
                                  bloc.add(LargePropertyDateChanged(value))),
                          _buildTextField(
                              label: "Versio",
                              initialValue: state.version,
                              width: 400,
                              setter: (value) =>
                                  bloc.add(LargePropertyVersionChanged(value))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// text field "Rakennuksen tiedot"
                TextFormField(
                  initialValue: state.description,
                  maxLines: null,
                  minLines: 5,
                  onChanged: (value) =>
                      bloc.add(LargePropertyDescriptionChanged(value)),
                  decoration: const InputDecoration(
                    labelText: "Rakennuksen tiedot",
                    alignLabelWithHint: true, // Aligns label to the top-left
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
