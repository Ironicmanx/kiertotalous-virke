import 'package:flutter/material.dart';

import '../home_view.dart';

/// This dialog is presented to the user when the are about to discard their changes.
class CancelDialog extends StatelessWidget {
  const CancelDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('Haluatko keskeyttää?'),
        content: const Text('Jatkamalla hylkäät jo tekemäsi muutokset.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Peruuta'),
            child: const Text('Peruuta'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
            },
            child: const Text('Jatka'),
          ),
        ],
      );
}
