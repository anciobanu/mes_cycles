import 'package:flutter/material.dart';

import 'package:mes_cycles/src/model/journee.dart';
//import 'package:mes_cycles/src/widget/saisie_slider.dart';

class Saisie extends StatefulWidget {
  const Saisie({super.key});

  @override
  State<Saisie> createState() => _SaisieState();
}

class _SaisieState extends State<Saisie> {

  final DateTime date = DateTime.now();
  double _flux = 0, _transit = 0, _ballonnements = 0, _jambes = 0, _forme = 0, _libido = 0, _stress = 0;
  final _commentaires = TextEditingController();
  final Map<DateTime, Journee> result = {};

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
                      Slider(
                        value: _flux,
                        max: 5,
                        divisions: 5,
                        label: _flux.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _flux = value;
                          });
                        },
                      ),
                      Text('Transit :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Slider(
                        value: _transit,
                        max: 5,
                        divisions: 5,
                        label: _transit.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _transit = value;
                          });
                        },
                      ),
                      Text('Ballonnements :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Slider(
                        value: _ballonnements,
                        max: 5,
                        divisions: 5,
                        label: _ballonnements.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _ballonnements = value;
                          });
                        },
                      ),
                      Text('Jambes lourdes :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Slider(
                        value: _jambes,
                        max: 5,
                        divisions: 5,
                        label: _jambes.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _jambes = value;
                          });
                        },
                      ),
                      Text('Forme :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Slider(
                        value: _forme,
                        max: 5,
                        divisions: 5,
                        label: _forme.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _forme = value;
                          });
                        },
                      ),
                      Text('Libido :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Slider(
                        value: _libido,
                        max: 5,
                        divisions: 5,
                        label: _libido.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _libido = value;
                          });
                        },
                      ),
                      Text('Stress :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Slider(
                        value: _stress,
                        max: 5,
                        divisions: 5,
                        label: _stress.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _stress = value;
                          });
                        },
                      ),
                      Text('Commentaires :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextField(
                        controller: _commentaires,
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
                        result[DateTime(date.year, date.month, date.day)] = Journee(_flux, _transit, _ballonnements, _jambes, _forme, _libido, _stress, _commentaires.text);
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
