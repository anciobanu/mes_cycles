import 'package:hive/hive.dart';
import 'package:mes_cycles/src/model/journee.dart';

class Periode {
  Periode(this.debut, this.fin);

  final DateTime debut;
  final DateTime fin;
  
  int get duree => fin.difference(debut).inDays;

  @override
  String toString() => 'Du ${debut.toIso8601String()} au ${fin.toIso8601String()} ($duree jours)';
}

List<Journee> trierJours(Box<Journee> cycles) {
  List<Journee> sorted = [...cycles.values]..sort((a, b) => a.journee.compareTo(b.journee));
  return sorted;
}

List<Periode> detecterPeriodes(Box<Journee> cycles) {
  List<Periode> periodes = [];
  List<Journee> sorted = trierJours(cycles);

  DateTime? debut;

  for (int i = 0; i < sorted.length; i++) {
    final actuel = sorted[i];
    final precedent = i > 0 ? (sorted[i].journee.difference(sorted[i-1].journee).inDays > 1)  ? null : sorted[i - 1] : null;
    final suivant = i < sorted.length - 1 ? (sorted[i+1].journee.difference(sorted[i].journee).inDays > 1)  ? null : sorted[i + 1] : null;

    bool estDebut = (actuel.flux > 0) && (suivant == null || suivant.flux == 0);
    bool estFin = (actuel.flux > 0) && (precedent == null || precedent.flux == 0);

    if (estDebut) {
      debut = actuel.journee.add(const Duration(days: 1));
    }
    if (estFin && debut != null) {
      periodes.add(Periode(debut, actuel.journee));
      debut = null; // reset pour la prochaine période
    }
  }

  return periodes;
}

  List<int> calculDurees(List<Periode> periodes) {
    int somme = 0;
    int dureeMoyenne = 0;
    int dureeMin = 100;
    int dureeMax = 0;

    if (periodes.isNotEmpty) {
      for (int i = 0; i < periodes.length; i++) {
        somme = somme + periodes[i].duree;
        if (periodes[i].duree > dureeMax) {
          dureeMax = periodes[i].duree;
        }
        if (periodes[i].duree < dureeMin) {
          dureeMin = periodes[i].duree;
        }
      }

      dureeMoyenne = somme ~/ periodes.length;
    }
    return [dureeMoyenne, dureeMin, dureeMax];
  }

  Journee dernieresRegles(Box<Journee> cycles) {
    List<Journee> sorted = trierJours(cycles);
    int i = sorted.length;

    while (sorted[i-1].flux > 0 && i > 0) {
        i--;
      }

    return sorted[i-1]; // Retourne la première journée avec un flux non nul
  }