import 'package:flutter/material.dart';

import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/saisie_slider.dart';

class Saisie extends StatelessWidget {
  Saisie({super.key});

  final DateTime date = DateTime.now();

  final _commentaire = TextEditingController();
  static const Map<DateTime, Journee> result = {};

  void dispose() {
    _commentaire.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Journée du : ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text('${date.day}/${date.month}/${date.year}',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Flux :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SaisieSlider(),
                      Text('Transit :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SaisieSlider(),
                      Text('Ballonnements :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SaisieSlider(),
                      Text('Jambes lourdes :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SaisieSlider(),
                      Text('Forme :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SaisieSlider(),
                      Text('Libido :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SaisieSlider(),
                      Text('Stress :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SaisieSlider(),
                      Text('Commentaires :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextField(
                        controller: _commentaire,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () =>
                          Navigator.pop(context, <DateTime, Journee>{}),
                      child: const Text('Annuler')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, result);
                      },
                      child: const Text('OK')),
                ],
              ),
            ],
          )),
    );
  }
}
