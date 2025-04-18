import 'package:flutter/material.dart';

class Barre extends StatelessWidget {
  const Barre({
    super.key,
    required this.titre,
    required this.valeur,
  });

  final double valeur;
  final String titre;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: LinearProgressIndicator(
              value: valeur / 5.0,
              minHeight: 20,
              backgroundColor: const Color.fromARGB(255, 164, 149, 149),
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(titre,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
