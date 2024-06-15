import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/saisie_slider.dart';

class Saisie extends StatefulWidget {
  const Saisie({super.key, required this.cycles, required this.dateKey});

  final Box<Journee> cycles;
  final String dateKey;

  @override
  State<Saisie> createState() => _SaisieState();
}

class _SaisieState extends State<Saisie> {
  late Box<Journee> cycles;
  late String dateKey;

  final _commentaires = TextEditingController();
  late DateTime date;
  late double flux, transit, ballonnements, jambes, forme, libido, stress;


  @override
  void initState() {
    cycles = widget.cycles;
    dateKey = widget.dateKey;

    if(cycles.containsKey(dateKey)) {
      date = cycles.get(dateKey)!.journee;
      flux = cycles.get(dateKey)!.flux;
      transit = cycles.get(dateKey)!.transit;
      ballonnements = cycles.get(dateKey)!.ballonnements;
      jambes = cycles.get(dateKey)!.jambesLourdes;
      forme = cycles.get(dateKey)!.forme;
      libido = cycles.get(dateKey)!.libido;
      stress = cycles.get(dateKey)!.stress;
      if (cycles.get(dateKey)!.commentaires != null) {
        _commentaires.text = cycles.get(dateKey)!.commentaires!;
      }
    }
    else {
      date = DateTime.now();
      flux = 0;
      transit = 0;
      ballonnements = 0;
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
                      SaisieSlider(saveValeur: _saveFlux, currentSliderValue: flux,),
                      
                      Text('Transit :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveTransit, currentSliderValue: transit,),

                      Text('Ballonnements :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveBallonnements, currentSliderValue: ballonnements,),

                      Text('Jambes lourdes :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveJambes, currentSliderValue: jambes,),

                      Text('Forme :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveForme, currentSliderValue: forme,),

                      Text('Libido :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveLibido, currentSliderValue: libido,),

                      Text('Stress :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SaisieSlider(saveValeur: _saveStress, currentSliderValue: stress,),

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
                          Navigator.pop(context, null),
                      child: const Text('Annuler')),
                  ElevatedButton(
                      onPressed: () {
                        cycles.put(DateTime(date.year, date.month, date.day).toString(), Journee(DateTime(date.year, date.month, date.day), flux, transit, ballonnements, jambes, forme, libido, stress, _commentaires.text));
                        Navigator.pop(context);
                      },
                      child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              ),
            ],
          )),
    );
  }
}