import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:mes_cycles/src/model/journee.dart';
import 'package:mes_cycles/src/screen/calendar.dart';
import 'package:mes_cycles/src/screen/saisie.dart';
import 'package:mes_cycles/src/screen/stats.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Box<Journee> cycles = Hive.box('Mes Cycles');

  int _selectedIndex = 0;
  late final List<Widget> _bodys = <Widget>[
    Calendar(cycles: cycles),
    Stats(cycles: cycles),
  ];

  static const List<String> _titles = <String>[
    'Calendrier',
    'Statistiques',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }  
  
  Future<void> _addToday() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Saisie(cycles: cycles, selectedDate: DateTime.now()),
    );
    setState(() {
      _selectedIndex = _selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle()
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: _bodys[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration().copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Suivre mes cycles',
                    textAlign: TextAlign.center,
                    style: const TextStyle().copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                _titles[0],
                style: const TextStyle().copyWith(fontWeight: FontWeight.bold,),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              selected: _selectedIndex == 0,
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              title: Text(
                _titles[1],
                style: const TextStyle().copyWith(fontWeight: FontWeight.bold,),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              selected: _selectedIndex == 1,
              onTap: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _addToday,
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary,),
      ),
    );
  }
}
