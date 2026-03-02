import 'dart:math';

import 'package:flutter/material.dart';

/// Generic view for forms. Meant to be displayed as a child of [TabBarBiew].
class TabView extends StatelessWidget {
  const TabView({
    super.key,
    required this.forms,
    this.width = 1600,
  });

  final Function forms;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // this allows for horizontal scrolling
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          // this width should match width of widest widget
          width: max(width, MediaQuery.of(context).size.width),
          // this ListView allows for vertical scrolling by default
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 64,
                children: forms(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
