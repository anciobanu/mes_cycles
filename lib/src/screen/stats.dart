import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/model/periode.dart';

class Stats extends StatelessWidget {
  const Stats({super.key, required this.cycles});

  final Box<Journee> cycles;

  @override
  Widget build(BuildContext context) {
    final List<Periode> periodes = detecterPeriodes(cycles);
    final List<int> durees = calculDurees(periodes);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text('Cycle le plus court : ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline)),
                Text('${durees[1]} jours',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline)),
              ],
            ),
            Row(
              children: [
                Text('Cycle le plus long : ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline)),
                Text('${durees[2]} jours',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline)),
              ],
            ),
            Row(
              children: [
                Text('Durée moyenne du cycle : ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline)),
                Text('${durees[0]} jours',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.outline)),
              ],
            ),
            Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.outline),
                  Row(
              children: [
            Text('Date prochaines règles : ',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.outline)),
            Text(DateFormat('dd/MM/yyyy').format(dernieresRegles(cycles).journee.add(Duration(days: durees[0]))),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.outline)),
              ],
            ),
          ]),
    );
  }
}
