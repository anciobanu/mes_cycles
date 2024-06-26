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
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                        weekendStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                      ),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          daySelected = selectedDay;
                        });
                      },
                    ),
                    const SizedBox(height: 16,),
                    MaJournee(cycles: _cycles, daySelected: daySelected,),
                  ]));
        });
  }
}
