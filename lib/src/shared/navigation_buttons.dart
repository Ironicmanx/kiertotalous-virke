import 'package:flutter/material.dart';

import 'cancel_dialog.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // "Edellinen" button - Goes back or to HomeView if first tab
          ElevatedButton(
            onPressed: tabController.index == 0
                ? () => showDialog<String>(
                    context: context, builder: (_) => CancelDialog())
                : () => tabController.animateTo(tabController.index - 1),
            child: const Text("Edellinen"),
          ),
          // Space  between the buttons
          const SizedBox(width: 100),
          // "Seuraava" button - Goes to the next tab //TODO: Implement the logic for the last tab
          ElevatedButton(
            onPressed: () => tabController.animateTo(tabController.index + 1),
            child: const Text("Seuraava"),
          ),
        ],
      ),
    );
  }
}
