import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/saisie_slider.dart';

class Saisie extends StatefulWidget {
  const Saisie({super.key, required this.cycles, required this.selectedDate});

  final Box<Journee> cycles;
  final DateTime selectedDate;

  @override
  State<Saisie> createState() => _SaisieState();
}

class _SaisieState extends State<Saisie> {
  late Box<Journee> cycles;
  late DateTime selectedDate;
  late String dateKey;

  final _commentaires = TextEditingController();
  late double flux, transit, ballonnements, douleurs, jambes, forme, libido, stress;


  @override
  void initState() {
    cycles = widget.cycles;
    selectedDate = widget.selectedDate;
    dateKey = DateTime(selectedDate.year,selectedDate.month,selectedDate.day).toString();

    if (cycles.containsKey(dateKey)) {
      flux = cycles.get(dateKey)!.flux;
      transit = cycles.get(dateKey)!.transit;
      ballonnements = cycles.get(dateKey)!.ballonnements;
      douleurs = cycles.get(dateKey)!.douleurs;
      jambes = cycles.get(dateKey)!.jambesLourdes;
      forme = cycles.get(dateKey)!.forme;
      libido = cycles.get(dateKey)!.libido;
      stress = cycles.get(dateKey)!.stress;
      if (cycles.get(dateKey)!.commentaires != null) {
        _commentaires.text = cycles.get(dateKey)!.commentaires!;
      }
    } else {
      flux = 0;
      transit = 0;
      ballonnements = 0;
      douleurs = 0;
      jambes = 0;
      forme = 0;
      libido = 0;
      stress = 0;
    }
    super.initState();
  }

  void _saveFlux(double nouvelleValeur) {
    flux = nouvelleValeur;
  }
  void _saveTransit(double nouvelleValeur) {
    transit = nouvelleValeur;
  }
  void _saveBallonnements(double nouvelleValeur) {
    ballonnements = nouvelleValeur;
  }
  void _saveDouleurs(double nouvelleValeur) {
    douleurs = nouvelleValeur;
  }
  void _saveJambes(double nouvelleValeur) {
    jambes = nouvelleValeur;
  }
  void _saveForme(double nouvelleValeur) {
    forme = nouvelleValeur;
  }
  void _saveLibido(double nouvelleValeur) {
    libido = nouvelleValeur;
  }
  void _saveStress(double nouvelleValeur) {
    stress = nouvelleValeur;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Theme.of(context).colorScheme.surface,
      //surfaceTintColor: Theme.of(context).colorScheme.background,
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.outline)),
                  Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.outline)),
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
                      Text('Flux (0 RAS) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveFlux, currentSliderValue: flux,),
                      
                      Text('Transit (1 diarrhée - 5 constipation) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveTransit, currentSliderValue: transit,),

                      Text('Ballonnements (1 faibles - 5 fréquents) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveBallonnements, currentSliderValue: ballonnements,),

                      Text('Douleurs (1 faibles - 5 fortes) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveDouleurs, currentSliderValue: douleurs,),

                      Text('Jambes lourdes (1 faible - 5 fort) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveJambes, currentSliderValue: jambes,),

                      Text('Forme (1 fatigue - 5 la pêche) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveForme, currentSliderValue: forme,),

                      Text('Libido (1 none - 5 fatale) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveLibido, currentSliderValue: libido,),

                      Text('Stress (1 Doc Gynéco - 5 Frodon) :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      SaisieSlider(saveValeur: _saveStress, currentSliderValue: stress,),

                      Text('Commentaires :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.outline)),
                      TextField(
                        controller: _commentaires,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Theme.of(context).colorScheme.outline),
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
                          Navigator.pop(context, null),
                      child: Text('Annuler', style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),)),
                  ElevatedButton(
                      onPressed: () {
                        cycles.put(DateTime(selectedDate.year, selectedDate.month, selectedDate.day).toString(), Journee(DateTime(selectedDate.year, selectedDate.month, selectedDate.day), _commentaires.text, flux, transit, ballonnements, douleurs, jambes, forme, libido, stress));
                        Navigator.pop(context);
                      },
                      child: Text('OK', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondaryContainer),)),
                ],
              ),
            ],
          )),
    );
  }
}