import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/widget/majournee.dart';
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

  List<Journee> _isDaySet(DateTime dateTime) {
    final String dayKey = DateTime(dateTime.year, dateTime.month, dateTime.day).toString();
    final List<Journee> joursSaisis = [];
    if(_cycles.containsKey(dayKey)) {
      joursSaisis.add(Journee(_cycles.get(dayKey)!.journee, _cycles.get(dayKey)!.commentaires, _cycles.get(dayKey)!.flux, _cycles.get(dayKey)!.transit, _cycles.get(dayKey)!.ballonnements, _cycles.get(dayKey)!.douleurs, _cycles.get(dayKey)!.jambesLourdes, _cycles.get(dayKey)!.forme, _cycles.get(dayKey)!.libido, _cycles.get(dayKey)!.stress));
    }
    return joursSaisis;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
        valueListenable: widget.cycles.listenable(),
        builder: (context, box, widget) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
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
                      currentDay: daySelected,
                      calendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      selectedDayPredicate: (day) {
                        return isSameDay(daySelected, day);
                        /*if(_cycles.containsKey(DateTime(day.year, day.month, day.day).toString())) {
                          return true;
                        }
                        else {
                          return false;
                        }*/
                      },
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
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                        weekendStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                      ),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          daySelected = selectedDay;
                        });
                      },
                      eventLoader: _isDaySet,
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          if (_cycles.containsKey(DateTime(day.year, day.month, day.day).toString())) {
                            if (_cycles.get(DateTime(day.year, day.month, day.day).toString())!.flux != 0) {
                              return Center(
                                child: Text(day.day.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                            );
                            } else {
                              return Center(
                                child: Text(day.day.toString(),
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: Theme.of(context).colorScheme.onBackground,
                                          fontWeight: FontWeight.bold)),
                            );
                            }
                          }
                          return null;
                        },
                        selectedBuilder: (context, day, focusedDay) {
                        if (_cycles.containsKey(DateTime(day.year, day.month, day.day).toString())) {
                          if (_cycles.get(DateTime(day.year, day.month, day.day).toString())!.flux !=0) {
                            return Container(
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(day.day.toString(),
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                              ),
                            );
                          } else {
                            return Container(
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(day.day.toString(),
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: Theme.of(context).colorScheme.onBackground,
                                            fontWeight: FontWeight.bold)),
                              ),
                            );
                          }
                        }
                        return Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(day.day.toString(),
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Theme.of(context).colorScheme.onBackground)),
                          ),
                        );
                      },
                        markerBuilder: (context, day, events) {
                          if (!_cycles.containsKey(DateTime(day.year, day.month, day.day).toString())) {
                            return const SizedBox();
                          } else {
                            Journee journee = _cycles.get(DateTime(day.year, day.month, day.day).toString())!;
                            double counter = 0;
                            if (journee.transit == 1 || journee.transit == 5) {
                              counter = counter + 2;
                            }
                            if (journee.ballonnements >= 2) {
                              counter = counter + 2;
                            }
                            if (journee.douleurs >= 2) {
                              counter = counter + 2;
                            }
                            if(journee.jambesLourdes >= 2){
                              counter = counter + 2;
                            }
                            if(journee.forme <= 3 && journee.forme != 0) {
                              counter = counter + 2;
                            }
                            return Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  height: 5,
                                  width: counter,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.red),
                                ),
                              );
                            }
                          }
                      ),
                    ),
                    const SizedBox(height: 16,),
                    MaJournee(cycles: _cycles, daySelected: daySelected,),
                  ]));
        });
  }
}
