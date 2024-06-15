import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/saisie.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key, required this.cycles});

  final Box<Journee> cycles;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: cycles.listenable(),
        builder: (context, box, widget) {
          return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                  itemCount: cycles.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => Saisie(cycles: cycles, dateKey: cycles.keyAt(index)),
                              );
                            },
                            child: Card(
                                child: Center(
                                    child: Text('${cycles.getAt(index)!.journee.day}/${cycles.getAt(index)!.journee.month}/${cycles.getAt(index)!.journee.year}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ))),
                          ),
                        ),
                      ],
                    );
                  }));
        });
  }
}
