import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/barre.dart';
import 'package:mes_cycles/src/widget/bouton_modif.dart';

class JourneePleine extends StatelessWidget {
  const JourneePleine({
    super.key,
    required this.cycles,
    required this.daySelected,
  });

  final Box<Journee> cycles;
  final DateTime daySelected;

  @override
  Widget build(BuildContext context) {
    final String dayKey = DateTime(daySelected.year, daySelected.month, daySelected.day).toString();
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(1, 1, 1, 3),
                      child: Text('Etat de forme : ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(children: [
                      Barre(titre: 'Flux', valeur: cycles.get(dayKey)!.flux),
                    ]),
                    Row(children: [
                      Barre(titre: 'Forme', valeur: cycles.get(dayKey)!.forme),
                    ]),
                    Row(children: [
                      Barre(titre: 'Stress', valeur: cycles.get(dayKey)!.stress),
                    ]),
                    Row(children: [
                      Barre(titre: 'Libido', valeur: cycles.get(dayKey)!.libido),
                    ]),
                  ],
                ),
              ),
              VerticalDivider(
                width: 5,
                thickness: 1,
                color: Theme.of(context).colorScheme.onSecondaryContainer),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(1, 1, 1, 3),
                      child: Text('Symptômes :',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(children: [
                      Barre(titre: 'Transit', valeur: cycles.get(dayKey)!.transit),
                    ]),
                    Row(children: [
                      Barre(titre: 'Ballonnements', valeur: cycles.get(dayKey)!.ballonnements),
                    ]),
                    Row(children: [
                      Barre(titre: 'Douleurs', valeur: cycles.get(dayKey)!.douleurs),
                    ]),
                    Row(children: [
                      Barre(titre: 'JambesLourdes', valeur: cycles.get(dayKey)!.jambesLourdes),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),

        // 2eme ligne pour les commentaires
        const SizedBox(height: 8),
        Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child:
                Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Text(
                      '${cycles.get(dayKey)!.commentaires}',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondaryContainer,),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
            )),
        const SizedBox(height: 8),

        // 3eme ligne centrée pour le bouton de modification de la journée
        Center(
          child: BoutonModif(cycles: cycles, daySelected: daySelected),
        ),
      ],
    );
  }
}
