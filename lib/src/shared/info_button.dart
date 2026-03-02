import 'package:flutter/material.dart';

/// IconButton meant to display helpful text when hovered over.
/// Does not allow to be focused, which means that this widget
/// is skipped upon pressing tab/enter.
class InfoButton extends StatelessWidget {
  const InfoButton({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return ExcludeFocus(
      excluding: true,
      child: IconButton(
        icon: const Icon(Icons.info),
        tooltip: text ??
            '''Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit, 
            sed do eiusmod tempor incididunt 
            ut labore et dolore magna aliqua.''',
        onPressed: () {},
      ),
    );
  }
}
