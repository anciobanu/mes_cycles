import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/journee_vide.dart';
import 'package:mes_cycles/src/widget/journee_pleine.dart';

class MaJournee extends StatelessWidget {
  const MaJournee({super.key, required this.cycles, required this.daySelected});

  final Box<Journee> cycles;
  final DateTime daySelected;

  @override
  Widget build(BuildContext context) {
    final String dayKey = DateTime(daySelected.year, daySelected.month, daySelected.day).toString();
    return Expanded(
        child: Card(
            child: Padding(
      padding: const EdgeInsets.all(4),
      // On regarde si la journée sélectionnée exite
      child: cycles.get(dayKey) == null
            // Cas d'une journée non renseignée : texte + boutton modifier
          ? JourneeVide(cycles: cycles, daySelected: daySelected)
            // Cas d'une journée saisie : Infos + commentaires + bouton modifier
          : JourneePleine(cycles: cycles, daySelected: daySelected),
    )));
  }
}