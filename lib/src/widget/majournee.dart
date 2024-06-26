import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/saisie.dart';


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
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Etat de forme : ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Flux'
                            : '${cycles.get(dayKey)!.flux.toInt()}/5 Flux',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Forme'
                            : '${cycles.get(dayKey)!.forme.toInt()}/5 Forme',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Stress'
                            : '${cycles.get(dayKey)!.stress.toInt()}/5 Stress',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                    thickness: 1,
                    color: Theme.of(context).colorScheme.onSecondaryContainer),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Symptômes :',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Transit'
                            : '${cycles.get(dayKey)!.transit.toInt()}/5 Transit',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Ballonnements'
                            : '${cycles.get(dayKey)!.ballonnements.toInt()}/5 Ballonnements',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Douleurs'
                            : '${cycles.get(dayKey)!.douleurs.toInt()}/5 Douleurs',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Jambes lourdes'
                            : '${cycles.get(dayKey)!.jambesLourdes.toInt()}/5 Jambes lourdes',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                      Text(
                        cycles.get(dayKey) == null
                            ? 'Libido'
                            : '${cycles.get(dayKey)!.libido.toInt()}/5 Libido',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            cycles.get(dayKey) == null
                ? ''
                : '${cycles.get(dayKey)!.commentaires}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
          const SizedBox(height: 8),
          Center(
            child: OutlinedButton.icon(
              label: Text('Modifier',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.bold)),
              icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.onSecondaryContainer),
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => Saisie(cycles: cycles, selectedDate: daySelected),
                );
              },
            ),
          ),
        ],
      ),
    )));
  }
}
