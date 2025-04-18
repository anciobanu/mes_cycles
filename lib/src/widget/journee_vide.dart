import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/bouton_modif.dart';

class JourneeVide extends StatelessWidget {
  const JourneeVide({
    super.key,
    required this.cycles,
    required this.daySelected,
  });

  final Box<Journee> cycles;
  final DateTime daySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Journée non renseignée !',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          Center(
            child: BoutonModif(cycles: cycles, daySelected: daySelected),
          ),
        ],
      );
  }
}