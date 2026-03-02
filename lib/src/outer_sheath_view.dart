import 'package:flutter/material.dart';
import 'package:flutter_app/src/lp-forms/floor_structures_form.dart';
import 'package:flutter_app/src/lp-forms/foundation_type_and_floors_form.dart';
import 'package:flutter_app/src/lp-forms/intermediate_floors_form.dart';
import 'package:flutter_app/src/lp-forms/large_property_basic_information_form.dart';
import 'package:flutter_app/src/lp-forms/removable_grounds_form.dart';
import 'package:flutter_app/src/lp-forms/roofs_form.dart';
import 'package:flutter_app/src/shared/navigation_buttons.dart';
import 'package:flutter_app/src/lp-forms/total_building_dimensions_form.dart';
import 'package:flutter_app/src/lp-forms/cellar_form.dart';
import 'package:flutter_app/src/lp-forms/total_building_frame_form.dart';

class OuterSheathView extends StatelessWidget {
  const OuterSheathView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // this allows for horizontal scrolling
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          // this width should match width of widest widget
          width: 2200,
          // this ListView allows for vertical scrolling by default
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: LargePropertyBasicInformationForm(), //
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TotalBuildingDimensionsForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RemovableGroundsForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FoundationTypeAndFloorsForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CellarForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TotalBuildingFrameForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: RoofsForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: FloorStructuresForm(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IntermediateFloorsForm(),
              ),
              const SizedBox(height: 20),
              Align(
                child: NavigationButtons(),
              ),

              // Extra spacing at the bottom to prevent buttons from sticking
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
