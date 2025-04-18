import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/screen/saisie.dart';

class BoutonModif extends StatelessWidget {
  const BoutonModif({
    super.key,
    required this.cycles,
    required this.daySelected,
  });

  final Box<Journee> cycles;
  final DateTime daySelected;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text('Modifier',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer,
              fontWeight: FontWeight.bold)),
      icon: Icon(Icons.edit,
          color:
              Theme.of(context).colorScheme.onSecondaryContainer),
      style : ButtonStyle(
        side: WidgetStatePropertyAll(BorderSide(width: 1.5)),
      ),
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              Saisie(cycles: cycles, selectedDate: daySelected),
        );
      },
    );
  }
}