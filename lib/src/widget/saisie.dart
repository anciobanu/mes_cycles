import 'package:flutter/material.dart';

import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/saisie_slider.dart';

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

  void _saveFlux(double nouvelleValeur) {
    _flux = nouvelleValeur;
  }
  void _saveTransit(double nouvelleValeur) {
    _transit = nouvelleValeur;
  }
  void _saveBallonnements(double nouvelleValeur) {
    _ballonnements = nouvelleValeur;
  }
  void _saveJambes(double nouvelleValeur) {
    _jambes = nouvelleValeur;
  }
  void _saveForme(double nouvelleValeur) {
    _forme = nouvelleValeur;
  }
  void _saveLibido(double nouvelleValeur) {
    _libido = nouvelleValeur;
  }
  void _saveStress(double nouvelleValeur) {
    _stress = nouvelleValeur;
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                  Text('${date.day}/${date.month}/${date.year}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
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
                      SaisieSlider(saveValeur: _saveFlux, currentSliderValue: _flux,),
                      
                      Text('Transit :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveTransit, currentSliderValue: _transit,),

                      Text('Ballonnements :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveBallonnements, currentSliderValue: _ballonnements,),

                      Text('Jambes lourdes :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveJambes, currentSliderValue: _jambes,),

                      Text('Forme :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveForme, currentSliderValue: _forme,),

                      Text('Libido :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveLibido, currentSliderValue: _libido,),

                      Text('Stress :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveStress, currentSliderValue: _stress,),

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
                      child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              ),
            ],
          )),
    );
  }
}
