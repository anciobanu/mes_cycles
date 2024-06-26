import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/saisie.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key, required this.cycles});

  final Box<Journee> cycles;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Box<Journee> _cycles;
  late DateTime daySelected;

  @override
  void initState() {
    _cycles = widget.cycles;
    daySelected = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: widget.cycles.listenable(),
        builder: (context, box, widget) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(16,16,16,80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TableCalendar(
                    locale: 'fr_FR',
                    daysOfWeekHeight: 22,
                    focusedDay: daySelected,
                    firstDay: DateTime.utc(2024, 1, 1),
                    lastDay: DateTime.now(),
                    currentDay: daySelected, //DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground),
                    ),
                    calendarStyle: CalendarStyle(
                      rangeHighlightColor: Theme.of(context).colorScheme.onBackground,
                      todayTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                      todayDecoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, shape: BoxShape.circle),
                      selectedTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                      selectedDecoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer, shape: BoxShape.circle),
                      weekendTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                      defaultTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                      weekendStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        daySelected = selectedDay;
                      });
                    },
                  ),
                  const SizedBox(height: 16,),
                  Expanded(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer,
                                              fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Flux' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.flux.toInt()}/5 Flux',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Forme' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.forme.toInt()}/5 Forme',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Stress' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.stress.toInt()}/5 Stress',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
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
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Symptômes :',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondaryContainer,
                                              fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Transit' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.transit.toInt()}/5 Transit',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Ballonnements' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.ballonnements.toInt()}/5 Ballonnements',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Douleurs' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.douleurs.toInt()}/5 Douleurs',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Jambes lourdes' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.jambesLourdes.toInt()}/5 Jambes lourdes',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                                    Text(
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? 'Libido' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.libido.toInt()}/5 Libido',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
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
                                      _cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString()) == null ? '' : '${_cycles.get(DateTime(daySelected.year, daySelected.month, daySelected.day).toString())!.commentaires}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                    ),
                        const SizedBox(height: 8),
                        Center(
                          child: OutlinedButton.icon(
                            label: Text('Modifier',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                        fontWeight: FontWeight.bold)),
                            icon: Icon(Icons.edit,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer),
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => Saisie(
                                    cycles: _cycles, selectedDate: daySelected),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )))
                ],
              ));
        });
  }
}
